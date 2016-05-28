defmodule ElGraphTest do
  use ExUnit.Case
  doctest ElGraph

  test "parse returns a map with numbers as groups" do
    input = """
    3
    1 2
    1 3
    """
    assert ElGraph.parse(input) == %{1 => [2, 3], 2 => [1], 3 => [1]}
  end

  test "connection count returns correct count" do
    connections = %{1 => [2, 3], 2 => [1], 3 => [1]}
    assert ElGraph.connection_count(connections, 2) == 1
    assert ElGraph.connection_count(connections, 1) == 2
    assert ElGraph.connection_count(connections, 1, 2) == 1
    assert ElGraph.connection_count(connections, 2, 3) == 0
  end

  test "challenge 1" do
    input = """
    3
    1 2
    1 3
    """

    output = """
    Node 1 has a degree of 2
    Node 2 has a degree of 1
    Node 3 has a degree of 1
    """

    adjascensy_matrix = """
    0 1 1
    1 0 0
    1 0 0
    """

    assert input |> ElGraph.parse |> ElGraph.node_count == output
    assert input |> ElGraph.parse |> ElGraph.adjascensy_matrix == adjascensy_matrix
  end

  test "challenge 2" do
    input = """
    16
    1 2
    1 3
    2 3
    1 4
    3 4
    1 5
    2 5
    1 6
    2 6
    3 6
    3 7
    5 7
    6 7
    3 8
    4 8
    6 8
    7 8
    2 9
    5 9
    6 9
    2 10
    9 10
    6 11
    7 11
    8 11
    9 11
    10 11
    1 12
    6 12
    7 12
    8 12
    11 12
    6 13
    7 13
    9 13
    10 13
    11 13
    5 14
    8 14
    12 14
    13 14
    1 15
    2 15
    5 15
    9 15
    10 15
    11 15
    12 15
    13 15
    1 16
    2 16
    5 16
    6 16
    11 16
    12 16
    13 16
    14 16
    15 16
    """

    output = """
    Node 1 has a degree of 8
    Node 2 has a degree of 8
    Node 3 has a degree of 6
    Node 4 has a degree of 3
    Node 5 has a degree of 7
    Node 6 has a degree of 10
    Node 7 has a degree of 7
    Node 8 has a degree of 7
    Node 9 has a degree of 7
    Node 10 has a degree of 5
    Node 11 has a degree of 9
    Node 12 has a degree of 8
    Node 13 has a degree of 8
    Node 14 has a degree of 5
    Node 15 has a degree of 9
    Node 16 has a degree of 9
    """

    adjascensy_matrix = """
    0 1 1 1 1 1 0 0 0 0 0 1 0 0 1 1
    1 0 1 0 1 1 0 0 1 1 0 0 0 0 1 1
    1 1 0 1 0 1 1 1 0 0 0 0 0 0 0 0
    1 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0
    1 1 0 0 0 0 1 0 1 0 0 0 0 1 1 1
    1 1 1 0 0 0 1 1 1 0 1 1 1 0 0 1
    0 0 1 0 1 1 0 1 0 0 1 1 1 0 0 0
    0 0 1 1 0 1 1 0 0 0 1 1 0 1 0 0
    0 1 0 0 1 1 0 0 0 1 1 0 1 0 1 0
    0 1 0 0 0 0 0 0 1 0 1 0 1 0 1 0
    0 0 0 0 0 1 1 1 1 1 0 1 1 0 1 1
    1 0 0 0 0 1 1 1 0 0 1 0 0 1 1 1
    0 0 0 0 0 1 1 0 1 1 1 0 0 1 1 1
    0 0 0 0 1 0 0 1 0 0 0 1 1 0 0 1
    1 1 0 0 1 0 0 0 1 1 1 1 1 0 0 1
    1 1 0 0 1 1 0 0 0 0 1 1 1 1 1 0
    """


    assert input |> ElGraph.parse |> ElGraph.node_count == output
    assert input |> ElGraph.parse |> ElGraph.adjascensy_matrix == adjascensy_matrix
  end
end
