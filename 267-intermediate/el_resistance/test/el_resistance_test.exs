defmodule ElResistanceTest do
  use ExUnit.Case
  doctest ElResistance

  test "parse creates a list of nodes and connections" do
    assert ElResistance.parse("A B\nA B 10") ==
      [nodes: ["A", "B"], connections: [[points: ["A", "B"], resistance: 10]]]
  end

  test "calculate_resistance returns correct value" do
    connections = [[points: ["A", "B"], resistance: 10]]
    assert ElResistance.calculate_resistance(connections) == 10

    multiple_connections = [
      [points: ["A", "B"], resistance: 10],
      [points: ["A", "B"], resistance: 10],
    ]

    assert ElResistance.calculate_resistance(multiple_connections) == 5

    multiple_connections_2 = [
      [points: ["A", "B"], resistance: 10],
      [points: ["A", "B"], resistance: 5],
    ]

    assert ElResistance.calculate_resistance(multiple_connections_2) == 3.333
  end

  test "reduce diamond reduces 2 connections into 1" do
    connections = [
      [points: ["A", "B"], resistance: 10],
      [points: ["B", "C"], resistance: 10],
    ]

    result = [
      [points: ["A", "C"], resistance: 20]
    ]

    assert ElResistance.reduce_diamond(connections) == result
  end

  test "find_diamonds when diamonds exist" do
    connections = [
      [points: ["A", "B"], resistance: 10],
      [points: ["B", "C"], resistance: 10],
      [points: ["A", "C"], resistance: 10],
    ]

    result = [
      [points: ["A", "B"], resistance: 10],
      [points: ["B", "C"], resistance: 10],
    ]

    # assert ElResistance.find_diamonds(connections) == result

    connections2 = [
      [points: ["A", "B"], resistance: 10],
      [points: ["B", "C"], resistance: 10],
      [points: ["A", "C"], resistance: 10],
      [points: ["C", "D"], resistance: 10],
    ]

    result2 = [
      [points: ["A", "B"], resistance: 10],
      [points: ["B", "C"], resistance: 10],
    ]

    assert ElResistance.find_diamond(connections2) == result2
  end

#   test "find_diamonds when diamonds don't exist" do
#     connections = [
#       [points: ["A", "B"], resistance: 10],
#       [points: ["B", "C"], resistance: 10],
#       [points: ["A", "C"], resistance: 10],
#     ]

#     result = [
#       [points: ["A", "B"], resistance: 10],
#       [points: ["B", "C"], resistance: 10],
#     ]

#     assert ElResistance.find_diamonds(connections) == result
#   end
end
