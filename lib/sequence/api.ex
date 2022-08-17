defmodule Sequence.Api do

  def next_number() do
    GenServer.call(:cache, :next_number)
  end

  def current_number() do
    GenServer.call(:cache, :current_number)
  end

  def set_number(new_number) do
    GenServer.call(:cache, {:set_number, new_number})
  end

  def increment_number(delta) do
    GenServer.cast(:cache, {:increment_number, delta})
  end

  def status() do
    :sys.get_status(:cache)
  end

end
