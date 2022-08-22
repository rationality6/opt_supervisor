defmodule Resources do
  defstruct gold: 0, woods: 0, oil: 0
end

defmodule Gettering do
  use GenServer

  def current() do
    GenServer.call(:resource, :current)
  end

  def get_gold() do
    GenServer.call(:resource, :get_gold)
  end

  def get_oil() do
    GenServer.call(:resource, :get_oil)
  end

  def get_woods() do
    GenServer.call(:resource, :get_woods)
  end

  def start_link() do
    source = %Resources{}
    GenServer.start_link(__MODULE__, source, name: :resource)
  end

  @impl true
  def init(source) do
    {:ok, source}
  end

  @impl true
  def handle_call(:current, _from, status) do
    {:reply, status, status}
  end

  @impl true
  def handle_call(:get_gold, _from, source) do
    source = Map.update!(source, :gold, &(&1 + 100))
    {:reply, source, source}
  end

  @impl true
  def handle_call(:get_oil, _from, source) do
    source = Map.update!(source, :oil, &(&1 + 100))
    {:reply, source, source}
  end

  @impl true
  def handle_call(:get_woods, _from, source) do
    source = Map.update!(source, :woods, &(&1 + 100))
    {:reply, source, source}
  end
end

Gettering.start_link()

Gettering.current() |> IO.inspect()

Gettering.get_gold() |> IO.inspect()
Gettering.get_woods() |> IO.inspect()
Gettering.get_oil() |> IO.inspect()
Gettering.get_gold() |> IO.inspect()

Gettering.current() |> IO.inspect()
