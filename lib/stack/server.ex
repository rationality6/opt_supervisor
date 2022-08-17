defmodule Stack.Server do
  use GenServer

  @typedoc "a value stored on the stack"
  @type value :: any

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