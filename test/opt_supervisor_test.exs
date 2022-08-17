defmodule OptSupervisorTest do
  use ExUnit.Case
  doctest OptSupervisor

  test "greets the world" do
    assert OptSupervisor.hello() == :world
  end
end
