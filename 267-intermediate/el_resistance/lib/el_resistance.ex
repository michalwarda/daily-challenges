defmodule ElResistance do
  def parse(input) do
    nodes = input |> String.split("\n") |> Enum.at(0) |> String.split(" ")
    connections = input
    |> String.split("\n")
    |> List.delete_at(0)
    |> Enum.map(&(String.split(&1) |> Enum.sort))
    |> Enum.map(fn([resistance, point1, point2]) ->
      {resistance, _} = Integer.parse(resistance)
      [points: [point1, point2], resistance: resistance]
    end)

    [nodes: nodes, connections: connections]
  end

  def calculate_resistance(connections) when length(connections) > 1 do
    1 / (connections |> Enum.reduce(0, &(&2 + 1 / &1[:resistance])))
    |> Float.round(3)
  end

  def calculate_resistance(connections) do
    Enum.at(connections, 0)[:resistance]
  end

  def reduce_diamond(connections) do
    [points: points, resistance: resistance] = connections
    |> Enum.reduce(fn(connection, acc) -> [
      points: acc[:points] ++ connection[:points],
      resistance: acc[:resistance] + connection[:resistance]
    ] end)

    points = points
    |> Enum.sort
    |> Enum.chunk_by(&(&1))
    |> List.delete_at(1)
    |> List.flatten

    [[points: points, resistance: resistance]]
  end

  def find_diamond(connections) do
    starts_with_nodes = connections
    |> Enum.group_by(&(&1[:points] |> Enum.at(0)))

    ends_with_nodes = connections
    |> Enum.group_by(&(&1[:points] |> Enum.at(1)))

    IO.inspect starts_with_nodes
    IO.inspect ends_with_nodes

    diamond_node = starts_with_nodes
    |> Map.keys
    |> Enum.concat(ends_with_nodes |> Map.keys)
    |> Enum.chunk_by(&(&1))
    |> List.flatten

  end
end
