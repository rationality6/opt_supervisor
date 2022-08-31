defmodule Ticker.Client do
  use GenServer
  @name :ticker_client

  # init
  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args, name: @name)
  end

  @impl true
  def init(:no_args) do
    {:ok, :no_args}
  end

  # api
  def tick_tock() do
    GenServer.call(@name, :tick_tock)
  end

  def current() do
    GenServer.call(@name, :current)
  end

  # server
  @impl true
  def handle_call(:tick_tock, _from, state) do
    Ticker.Server.tock()
    IO.inspect("tock on client")
    {:reply, state, state}
  end

  @impl true
  def handle_call(:current, _from, state) do
    {:reply, state, state}
  end
end
