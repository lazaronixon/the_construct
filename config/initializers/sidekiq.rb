Sidekiq.configure_server do |config|
  config.options = config.options.merge({ concurrency: ENV.fetch('WORKER_MAX_THREADS') { 5 }, retry: false })
end if defined?(Sidekiq)
