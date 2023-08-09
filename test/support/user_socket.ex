defmodule DispatcherWeb.UserSocket do
  use Phoenix.Socket

  channel("lobby", DispatcherWeb.LobbyChannel)
  channel("room:*", DispatcherWeb.RoomChannel)

  @impl true
  def id(_), do: nil
end
