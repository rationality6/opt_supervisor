defmodule Sort.Stash do
  use GenServer

  def start_link(opts) do
    init_arg = []

    opts = [{:name, :sort_stash} | opts]
    GenServer.start_link(__MODULE__, init_arg, opts)
  end

  # api

  def get() do
    GenServer.call(:sort_stash, :get)
  end

  def update(new_list) do
    GenServer.call(:sort_stash, {:update, new_list})
  end

  # server
  def init(initial_list) do
    {:ok, initial_list}
  end

  @impl true
  def handle_call(:get, _from, current_number) do
    {:reply, current_number, current_number}
  end

  @impl true
  def handle_cast({:update, new_list}, _current_number) do
    {:reply, new_list}
  end
end
