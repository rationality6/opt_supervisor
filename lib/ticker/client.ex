defmodule Ticker.Client do
  use GenServer

  # init
  def start_link() do
    GenServer.start_link(__MODULE__, :no_args)
  end

  @impl true
  def init(:no_args) do
    {:ok, :no_args}
  end

  # api
  def tick_tock(pid) do
    GenServer.call(pid, :tick_tock)
  end

  def current(pid) do
    GenServer.call(pid, :current)
  end

  # server
  @impl true
  def handle_call(:tick_tock, _from, state) do
    Ticker.Server.tock()
    IO.inspect("tock on client")
    {:reply, state, state}
  end

  @impl true
  def handle_call(:tock, _from, state) do
    IO.inspect("tock on client")
    {:reply, state, state}
  end

  @impl true
  def handle_call(:current, _from, state) do
    {:reply, state, state}
  end
end
