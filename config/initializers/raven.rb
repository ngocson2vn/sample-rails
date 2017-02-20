require 'raven'
require 'raven/transports/fluentd'

Raven.configure do |config|
  config.dsn = "fluentd://#{Settings.sentry.dsn}@#{Settings.fluentd.host}:#{Settings.fluentd.port}/140300"
  config.environments = ['staging', 'production']
end
