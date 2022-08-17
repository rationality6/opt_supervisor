defmodule Sequence.Server do
  use GenServer

  alias Sequence.Impl

  def start_link(opts) do
    init_arg = []

    opts = [{:name, :cache} | opts]
    GenServer.start_link(__MODULE__, init_arg, opts)
  end

  @impl true
  def init(_) do
    {:ok, Sequence.Stash.get()}
  end

  @impl true
  def handle_call(:next_number, _from, current_number) do
    next_number = Impl.next(current_number)
    {:reply, next_number, next_number}
  end

  @impl true
  def handle_call(:current_number, _from, status) do
    {:reply, status, status}
  end

  @impl true
  def handle_call({:set_number, new_number}, _from, _current_number) do
    {:reply, new_number, new_number}
  end

  @impl true
  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, Impl.increment(current_number, delta)}
  end

  @impl true
  def format_status(_reason, [_pdict, state]) do
    [data: [{'status', "My current status is '#{inspect(state)}', and I'm happy"}]]
  end

  @impl true
  def terminate(_reason, current_number) do
    Sequence.Stash.update(current_number)
  end
end
