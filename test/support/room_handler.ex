defmodule DispatcherWeb.RoomHandler do
  def join("room:" <> _id = topic, _message, socket) do
    :ok = Phoenix.PubSub.subscribe(Dispatcher.PubSub, topic)
    {:ok, socket}
  end

  def handle_in("message:new", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  def handle_info("stop", socket) do
    {:stop, :normal, socket}
  end
end
