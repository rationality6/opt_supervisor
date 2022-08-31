defmodule Gathering.IntervalPractice do
  use GenServer

  alias Gathering.Resources

  @interval 1000
  @gold_per_gather 100

  def start_link() do
    source = %Resources{}
    GenServer.start_link(__MODULE__, source)
  end

  def init(source) do
    :timer.send_interval(@interval, :tick)
    {:ok, source}
  end

  def handle_info(:tick, state) do
    state = Map.update!(state, :gold, &(&1 + @gold_per_gather))
    IO.inspect(state)
    {:noreply, state}
  end
end
