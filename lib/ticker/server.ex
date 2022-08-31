defmodule Ticker.Server do
  use GenServer
  @name :ticker_server
  @interval 2000

  # init
  def start_link(init) do
    GenServer.start_link(__MODULE__, init, name: @name)
  end

  @impl true
  def init(init) do
    {:ok, init}
  end

  # api
  def current() do
    GenServer.call(@name, :current)
  end

  def tock() do
    :timer.send_interval(@interval, @name, :tock)
    # GenServer.call(@name, :tock)
  end

  # server
  @impl true
  def handle_call(:current, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call(:register, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call(:tock, _from, state) do
    IO.inspect("tick from Server")
    {:reply, state, state}
  end
end
