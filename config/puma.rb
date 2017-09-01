threads Integer(ENV['MIN_THREADS']  || 1), Integer(ENV['MAX_THREADS'] || 16)

workers Integer(ENV['PUMA_WORKERS'] || 2)

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'
preload_app!

before_fork do
  require "puma_worker_killer"

  PumaWorkerKiller.enable_rolling_restart(ENV['PUMA_RESTART_FREQUENCY_HOURS'].to_f * 3600)
end

on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
