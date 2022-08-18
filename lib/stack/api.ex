defmodule Stack.Api do
  def current() do
    GenServer.call(:stack, :current)
  end

  def push(value) do
    GenServer.call(:stack, {:push, value})
  end

  def pop() do
    GenServer.call(:stack, :pop)
  end
end
