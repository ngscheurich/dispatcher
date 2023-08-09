ExUnit.start()

children = [
  {Phoenix.PubSub, name: Dispatcher.PubSub},
  DispatcherWeb.Endpoint
]

opts = [strategy: :one_for_one, name: Dispatcher.Supervisor]
Supervisor.start_link(children, opts)
