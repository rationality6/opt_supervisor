defmodule KeyValue.Server do
  use GenServer

  @name :key_value_server

  # init
  def start_link(_) do
    GenServer.start(__MODULE__, %{}, name: @name)
  end

  def init(state) do
    {:ok, state}
  end

  # api
  def put(server, key, value) do
    GenServer.cast(server, {:put, key, value})
  end

  def get(server, key) do
    GenServer.call(server, {:get, key})
  end

  def current(server) do
    GenServer.call(server, :current)
  end

  # server
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.fetch!(state, key), state}
  end

  def handle_call(:current, _from, state) do
    {:reply, state, state}
  end

end
