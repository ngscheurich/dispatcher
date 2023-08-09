defmodule DispatcherWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :dispatcher

  socket("/socket", DispatcherWeb.UserSocket)
end
