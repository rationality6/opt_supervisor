defmodule Stack.Stash do
  use GenServer

  def start_link(opts) do
    init_arg = []
    opts = [{:name, :stack_stash} | opts]
    GenServer.start_link(__MODULE__, init_arg, opts)
  end

  # api
  def get() do
    GenServer.call(:stack_stash, :get)
  end

  def update(new_stack) do
    GenServer.cast(:stack_stash, {:update, new_stack})
  end

  # server
  @impl true
  def init(initial_stack) do
    {:ok, initial_stack}
  end

  @impl true
  def handle_call(:get, _from, current_stack) do
    {:reply, current_stack, current_stack}
  end

  @impl true
  def handle_cast({:update, stack_save}, _current_number) do
    {:noreply, stack_save}
  end
end
