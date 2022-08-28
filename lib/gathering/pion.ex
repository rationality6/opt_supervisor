defmodule Gettering.Pion do
  def start_link() do
    GenServer.start_link(__MODULE__, :no_args)
  end

  def init(:no_args) do
    {:ok, nil}
  end

  def gethring_gold() do
    :timer.sleep(3000)
    Gettering.Server.get_gold()
    Gettering.Server.current()
    gethring_gold()
  end
end
