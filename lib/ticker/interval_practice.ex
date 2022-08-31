defmodule Ticker.IntervalPractice do
  use GenServer

  def init(_) do
    :timer.send_interval(1000, :tick)
    {:ok, 0}
  end

  def handle_info(:tick, state) do
    IO.inspect(state)
    {:noreply, state + 1}
  end
end
