defmodule Dispatcher do
  @moduledoc """
  Documentation for `Dispatcher`.
  """

  defmacro __using__(_opts) do
    quote do
      import Dispatcher
    end
  end

  defmacro join(topic, {:__aliases__, _, _} = mod) do
    quote do
      def join(unquote(topic) = topic, payload, socket) do
        apply(unquote(mod), :join, [topic, payload, socket])
      end
    end
  end

  defmacro join(topic, {:fn, _, _} = fun) do
    quote do
      def join(unquote(topic) = topic, payload, socket) do
        unquote(fun).(topic, payload, socket)
      end
    end
  end

  defmacro event(event, {:__aliases__, _, _} = mod) do
    quote do
      def handle_in(unquote(event) = event, payload, socket) do
        apply(unquote(mod), :handle_in, [event, payload, socket])
      end
    end
  end

  defmacro event(event, {:fn, _, _} = fun) do
    quote do
      def handle_in(unquote(event) = event, payload, socket) do
        unquote(fun).(event, payload, socket)
      end
    end
  end

  defmacro info(message, {:__aliases__, _, _} = mod) do
    quote do
      def handle_info(unquote(message) = message, socket) do
        apply(unquote(mod), :handle_info, [message, socket])
      end
    end
  end

  defmacro info(message, {:fn, _, _} = fun) do
    quote do
      def handle_info(unquote(message) = message, socket) do
        unquote(fun).(message, socket)
      end
    end
  end
end
