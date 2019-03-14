# rails new awesome-rails -d=postgresql --webpack=stimulus -m ~/RailsProjects/scaffold_on_steroids/template.rb

def source_paths
  [__dir__]
end

gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'geared_pagination'
gem 'spreadsheet_architect'

gem_group :production do
  gem 'aws-sdk-s3'
  gem 'dalli'
  gem 'memcachier'
  gem 'rack-cors'
  gem 'redis'
  gem 'sidekiq'
  gem 'rack-attack'
  gem 'scout_apm'
end

after_bundle do
  run "yarn add @fortawesome/fontawesome-free@^5.7.2"
  run "yarn add bootstrap@^4.2.1"
  run "yarn add bootstrap-daterangepicker@^3.0.3"
  run "yarn add cleave.js@^1.4.7"
  run "yarn add izitoast@^1.4.0"
  run "yarn add moment@^2.24.0"
  run "yarn add popper.js@^1.14.7"
  run "yarn add jquery@^3.3.1"
  run "yarn add jquery.nicescroll@^3.7.4"
  run "yarn add select2@^4.0.6-rc.1"

  directory 'app',      './app',      force: true
  directory 'config',   './config',   force: true
  directory 'lib',      './lib',      force: true
  directory 'public',   './public',   force: true
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
    config.action_controller.asset_host = ENV['CLOUDFRONT_URL']
    config.active_job.queue_adapter = :sidekiq
    config.middleware.use Rack::Attack

    config.cache_store = :mem_cache_store, (ENV["MEMCACHIER_SERVERS"] || "").split(","), {
      username: ENV["MEMCACHIER_USERNAME"], password: ENV["MEMCACHIER_PASSWORD"],
      socket_timeout: 1.5, :socket_failure_delay => 0.2
    }
  RUBY
  end
end
