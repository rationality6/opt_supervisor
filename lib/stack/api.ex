defmodule Stack.Api do
  use GenServer
  @server Stack.Server

  @impl true
  @spec init(any) :: {:ok, any}
  def init(list) do
    {:ok, list}
  end

  def start_link(initilize_stack) do
    GenServer.start_link(@server, initilize_stack, name: @server)
  end

  def current() do
    GenServer.call(@server, :current)
  end

  def push(value) do
    GenServer.call(@server, {:push, value})
  end

  def pop() do
    GenServer.call(@server, :pop)
  end
end
