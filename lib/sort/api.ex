defmodule Sort.Api do
  def current() do
    GenServer.call(:sort, :current)
  end

  def set_list(list) do
    GenServer.call(:sort, {:set_list, list})
  end

  def sort() do
    GenServer.call(:sort, :sort)
  end
end
