defmodule Sort.Server do
  use GenServer

  alias Sort.Impl

  def start_link(opts) do
    initial = []
    opts = [{:name, :sort} | opts]
    GenServer.start_link(__MODULE__, initial, opts)
  end

  @impl true
  def init(_) do
    {:ok, Sort.Stash.get()}
  end

  @impl true
  def handle_call(:current, _from, current) do
    {:reply, current, current}
  end

  @impl true
  def handle_call({:set_list, list}, _from, _state) do
    Sort.Stash.get()
    {:reply, list, list}
  end

  @impl true
  def handle_call(:sort, _from, state) do
    sorted_list = Impl.sort(state)
    {:reply, sorted_list, sorted_list}
  end

  @impl true
  def terminate(_reason, current_list) do
    Sort.Stash.update(current_list)
  end
end
