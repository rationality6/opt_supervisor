defmodule Stack.Server do
  use GenServer

  def start_link(opts) do
    initial_arg = []
    opts = [{:name, :stack} | opts]
    GenServer.start_link(__MODULE__, initial_arg, opts)
  end

  @impl true
  def init(list) do
    {:ok, list}
  end

  @impl true
  def handle_call({:push, new_value}, _from, current) do
    {:reply, [new_value | current], [new_value | current]}
  end

  def handle_call(:current, _from, current) do
    {:reply, current, current}
  end

  def handle_call(:pop, _from, [_head | tail]) do
    {:reply, tail, tail}
  end

  def handle_call(:pop, _from, []) do
    {:reply, [], []}
  end

end
