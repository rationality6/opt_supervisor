defmodule Sequence.Stash do
  use GenServer

  # def start_link(initial_number) do
  #   GenServer.start_link(__MODULE__, initial_number, name: @me)
  # end

  def start_link(opts) do
    init_arg = 123

    opts = [{:name, :stash} | opts]
    GenServer.start_link(__MODULE__, init_arg, opts)
  end

  # api
  def get() do
    GenServer.call(:stash, :get)
  end

  def update(new_number) do
    GenServer.cast(:stash, {:update, new_number})
  end

  # server
  @impl true
  def init(initial_number) do
    {:ok, initial_number}
  end

  @impl true
  def handle_call(:get, _from, current_number) do
    {:reply, current_number, current_number}
  end

  @impl true
  def handle_cast({:update, new_number}, _current_number) do
    {:noreply, new_number}
  end
end
