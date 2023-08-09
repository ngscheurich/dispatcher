defmodule DispatcherWeb.RoomChannel do
  use Phoenix.Channel
  use Dispatcher

  join "room:" <> _id, DispatcherWeb.RoomHandler

  event "message:new", DispatcherWeb.RoomHandler

  info "stop", DispatcherWeb.RoomHandler
end
