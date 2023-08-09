defmodule DispatcherTest do
  use ExUnit.Case, async: false
  import Phoenix.ChannelTest

  @endpoint DispatcherWeb.Endpoint

  test "dispatches to modules" do
    {:ok, _, socket} =
      DispatcherWeb.UserSocket
      |> socket(nil, %{})
      |> subscribe_and_join("room:1")

    ref = push(socket, "message:new", %{"body" => "Hello, world!"})
    assert_reply(ref, :ok, %{"body" => "Hello, world!"})

    Phoenix.PubSub.broadcast_from!(Dispatcher.PubSub, self(), "room:1", "stop")
    Process.sleep(100)

    refute Process.alive?(socket.channel_pid)
  end

  test "dispatches to functions" do
    {:ok, _, socket} =
      DispatcherWeb.UserSocket
      |> socket(nil, %{})
      |> subscribe_and_join("lobby")

    ref = push(socket, "version", %{})
    assert_reply(ref, :ok, "0.1.0")

    Phoenix.PubSub.broadcast!(Dispatcher.PubSub, "lobby", "stop")
    Process.sleep(100)

    refute Process.alive?(socket.channel_pid)
  end
end
