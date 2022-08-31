defmodule Gathering.Resources do
  defstruct gold: 0, woods: 0, oil: 0
end

defmodule Gettering.Server do
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
    source = %Gathering.Resources{}
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

# Gettering.Server.start_link()

# Gettering.Server.current() |> IO.inspect()

# Gettering.Server.get_gold() |> IO.inspect()
# Gettering.Server.get_woods() |> IO.inspect()
# Gettering.Server.get_oil() |> IO.inspect()
# Gettering.Server.get_gold() |> IO.inspect()

# Gettering.Server.current() |> IO.inspect()
