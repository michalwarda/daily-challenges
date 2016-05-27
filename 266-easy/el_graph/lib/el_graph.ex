defmodule ElGraph do
  def parse(input) do
    connections = input |> String.split("\n") |> Enum.drop(1) |> Enum.map(&String.strip/1)
    |> Enum.map(&(&1 |> String.split(" ") |> Enum.map(fn(num) ->
      {num, _} = num |> Integer.parse; num
    end)) |> Enum.sort)
    |> Enum.reduce(%{}, fn([node | child], acc) ->
      acc |> Map.update(node, child, &(&1 ++ child))
    end)
    {nodes_count, _} = input |> String.split("\n") |> Enum.at(0) |> Integer.parse
    %{connections: connections, nodes_count: nodes_count}
  end

  def connection_count(connections, node) do
    if neighbourghs = connections[node], do: neighbourghs |> length, else: 0
  end

  def connection_count(connections, node1, node2) do
    [node1, node2] = [node1, node2] |> Enum.sort
    case neighbourghs = connections[node1] do
      nil -> 0
      _ -> neighbourghs |> Enum.filter(&(&1 == node2)) |> Enum.count
    end
  end

  def print_node_count(%{connections: connections, nodes_count: nodes_count}) do
    1..nodes_count |> Enum.each(fn(n) ->
      "Node #{n} has a degree of #{connections |> connection_count(n)}" |> IO.puts
    end)
  end

  def print_adjascensy_matrix(%{connections: connections, nodes_count: nodes_count}) do
    1..nodes_count |> Enum.each(fn(y) ->
      1..nodes_count |> Enum.reduce("", fn(x, acc) ->
        number_of_connections = connections |> connection_count(x, y)
        acc <> "#{number_of_connections} "
      end) |> IO.puts
    end)
  end

  def display_graph(input) do
    parsed_graph = input |> parse
    parsed_graph |> print_adjascensy_matrix
    parsed_graph |> print_node_count
  end
end
