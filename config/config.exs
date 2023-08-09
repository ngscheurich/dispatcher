import Config

if config_env() == :test do
  config :dispatcher, DispatcherWeb.Endpoint, pubsub_server: Dispatcher.PubSub

  config :logger, level: :warning
end
