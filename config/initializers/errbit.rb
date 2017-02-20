Airbrake.configure do |config|
  config.api_key = 'e8dbc177806bc9277d35a4ee582bf77c'
  config.host    = 'errbit.finc.co.jp'
  config.port    = 80
  config.secure  = config.port == 443
  config.environment_name = 'staging'
end
