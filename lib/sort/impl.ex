defmodule Sort.Impl do
  def sort(list) when is_list(list) do
    do_insertion(list, [])
  end

  def do_insertion([], acc) do
    acc
  end

  def do_insertion([head | tail], acc) do
    do_insertion(tail, insert(acc, head))
  end

  def insert([], element) do
    [element]
  end

  def insert([head | tail], element) when element <= head do
    [element | [head | tail]]
  end

  def insert([head | tail], element) do
    [head | insert(tail, element)]
  end
end
