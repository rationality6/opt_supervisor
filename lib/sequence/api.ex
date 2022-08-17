defmodule Sequence.Api do
  use GenServer
  @server Sequence.Server

  @impl true
  def init(initial_number) do
    {:ok, initial_number}
  end

  def start_link(current_number) do
    GenServer.start_link(@server, current_number, name: @server)
  end

  def next_number() do
    GenServer.call(@server, :next_number)
  end

  def current_number() do
    GenServer.call(@server, :current_number)
  end

  def set_number(new_number) do
    GenServer.call(@server, {:set_number, new_number})
  end

  def increment_number(delta) do
    GenServer.cast(@server, {:increment_number, delta})
  end

  def status() do
    :sys.get_status(@server)
  end
end
