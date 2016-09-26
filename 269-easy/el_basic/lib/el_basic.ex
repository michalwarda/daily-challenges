defmodule ElBasic do
  @tokens ~w(VAR FOR NEXT IF ENDIF PRINT)
  def parse_line(line) do
    token = line |> String.split |> Enum.at(0)
    if token in @tokens do
      {:print, line: line |> String.trim, token: token}
    else
      {:skip, line: line}
    end
  end

  def parse_file(file) do
    file
    |> String.split("\n")
    |> Enum.map(&(parse_line(&1)))
    |> Enum.filter(fn({should_print, _}) -> should_print == :print end)
    |> Enum.reduce(%{stack: [], output: ""}, &reduce_line/2)
    |> Map.fetch!(:output)
  end

  def reduce_line({_, line: line, token: token}, %{stack: stack, output: output}) do
    stack = if token in ~w(ENDIF NEXT), do: stack |> List.delete_at(-1), else: stack
    output = output <> String.duplicate(" ", Enum.count(stack) * 4) <> line <> "\n"
    stack = if token in ~w(IF FOR), do: stack |> List.insert_at(-1, token), else: stack
    %{stack: stack, output: output}
  end
end
