def source_paths
  [__dir__]
end

gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'platform_agent'
gem 'geared_pagination'
gem 'spreadsheet_architect'

gem_group :production do
  gem 'redis'
  gem 'sidekiq'
  gem 'rack-ratelimit'
  gem 'rack-timeout'
  gem 'scout_apm'
end

after_bundle do
  run 'spring stop'
  run 'yarn add jquery popper.js bootstrap@^4.2.1'\
    ' @fortawesome/fontawesome-free@^5.7.2'\
    ' cleave.js@^1.4.7'\
    ' izitoast@^1.4.0'\
    ' jquery.nicescroll@^3.7.4'\
    ' select2@^4.0.7-rc.0'\
    ' bootstrap-daterangepicker@^3.0.3'\
    ' waypoints@^4.0.1'

  directory 'app',      './app',      force: true
  directory 'config',   './config',   force: true
  directory 'lib',      './lib',      force: true
  directory 'public',   './public',   force: true
  directory 'test',     './test',     force: true
  directory 'vendor',   './vendor',   force: true

  copy_file 'Procfile', './Procfile'

  uncomment_lines 'config/puma.rb', /WEB_CONCURRENCY/

  environment do <<~RUBY
    config.app                            = config_for(:config)
    config.i18n.default_locale            = :en
    config.time_zone                      = 'UTC'
    config.generators.scaffold_stylesheet = false
  RUBY
  end

  environment nil, env: 'production' do <<~RUBY
    config.force_ssl = true
    config.active_job.queue_adapter = :sidekiq
    config.action_controller.asset_host = ENV['CLOUDFRONT_URL']
    config.cache_store = :redis_cache_store, { url: ENV['REDIS_CACHE_URL'] }

    config.middleware.use(
      Rack::Ratelimit, name: 'API',
      conditions: ->(env) { ActionDispatch::Request.new(env).format.json? },
      rate:   [50, 10.seconds],
      redis:  Redis.new
    ) { |env| ActionDispatch::Request.new(env).ip }
  RUBY
  end
end
