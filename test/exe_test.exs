defmodule ExeTest do
  use ExUnit.Case
  doctest Exe

  test "greets the world" do
    assert Exe.hello() == :world
  end
end
