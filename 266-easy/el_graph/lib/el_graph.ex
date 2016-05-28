defmodule ElGraph do
  def parse(input) do
    input |> String.split("\n") |> Enum.drop(1) |> Enum.drop(-1)
    |> Enum.map(&(&1 |> String.split(" ") |> Enum.map(fn(num) ->
      {num, _} = num |> Integer.parse; num
    end)) |> Enum.sort)
    |> Enum.reduce(%{}, fn([node, child], acc) ->
      acc
      |> Map.update(node, [child], &(&1 ++ [child]))
      |> Map.update(child, [node], &(&1 ++ [node]))
    end)
  end

  def connection_count(connections, node), do: connections[node] |> length

  def connection_count(connections, node1, node2) do
    [node1, node2] = [node1, node2] |> Enum.sort
    connections[node1] |> Enum.filter(&(&1 == node2)) |> Enum.count
  end

  def node_count(connections) do
    connections |> Enum.reduce("", fn({node, _}, text) ->
      text <> "Node #{node} has a degree of #{connections |> connection_count(node)}\n"
    end)
  end

  def adjascensy_matrix(connections) do
    connections |> Enum.reduce("", fn({y, _}, text) ->
      text <> (connections |> Enum.reduce("", fn({x, _}, row) ->
        number_of_connections = connections |> connection_count(x, y)
        row <> "#{number_of_connections} "
      end) |> String.strip) <> "\n"
    end)
  end

  def display_graph(input) do
    parsed_graph = input |> parse
    parsed_graph |> adjascensy_matrix |> IO.puts
    parsed_graph |> node_count |> IO.puts
  end
end
