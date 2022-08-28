defmodule Treasury.Server do
  def loop(balance) do
    receive do
      {:store, amount} ->
        loop(balance + amount)

      {:withdraw, amount} ->
        loop(balance - amount)

      {:balance} ->
        IO.inspect(balance)
        loop(balance)

      {:balance, pid} ->
        send(pid, balance)
        loop(balance)
    end
  end
end

defmodule Treasury.Client do
  def get_balance() do
    receive do
      {:ok, balance} ->
        IO.inspect("have #{balance}")
    end
  end
end
