defmodule Sequence.Api do
  use GenServer
  @server Sequence.Server

  @impl true
  def init(_) do
    {:ok, Sequence.Stash.get()}
  end

  def start_link(_) do
    GenServer.start_link(@server, nil, name: @server)
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

  @impl true
  def terminate(_reason, current_number) do
    Sequence.Stash.update(current_number)
  end
end
