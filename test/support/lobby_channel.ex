defmodule DispatcherWeb.LobbyChannel do
  use Phoenix.Channel
  use Dispatcher

  join "lobby", fn topic, _payload, socket ->
    :ok = Phoenix.PubSub.subscribe(Dispatcher.PubSub, topic)
    {:ok, socket}
  end

  event "version", fn _event, _payload, socket ->
    {:reply, {:ok, "0.1.0"}, socket}
  end

  info "stop", fn _message, socket ->
    {:stop, :normal, socket}
  end
end
