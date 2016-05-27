defmodule ElGraphTest do
  use ExUnit.Case
  doctest ElGraph

  test "parse returns a map with numbers as groups" do
    input = "3\n1 2\n1 3"
    assert ElGraph.parse(input) == %{connections: %{1 => [2, 3]}, nodes_count: 3}
  end

  test "connection count returns correct count" do
    connections = %{1 => [2, 3]}
    assert ElGraph.connection_count(connections, 2) == 0
    assert ElGraph.connection_count(connections, 1) == 2
    assert ElGraph.connection_count(connections, 1, 2) == 1
    assert ElGraph.connection_count(connections, 2, 3) == 0
  end
end
