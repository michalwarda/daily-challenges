defmodule ElFibBinTest do
  use ExUnit.Case
  doctest ElFibBin

  @input """
  10 16
  10 32
  10 9024720
  F 10
  F 1
  F 111111
  F 100000
  F 10110110100111001
  """

  @output """
  1001000
  10101000
  1010100101010100000010001000010010
  1
  1
  20
  8
  2868
  """

  test "#convert" do
    assert @input |> convert == @output
  end

  # 1, 1, 2, 3, 5, 8, 13

  test "#fib_until_sum_greater_then" do
    assert fib_until_sum_greater_then(0) == [1]
    assert fib_until_sum_greater_then(1) == [1]
    assert fib_until_sum_greater_then(2) == [1, 1]
    assert fib_until_sum_greater_then(3) == [1, 1, 2]
    assert fib_until_sum_greater_then(4) == [1, 1, 2]
    assert fib_until_sum_greater_then(5) == [1, 1, 2, 3]
    assert fib_until_sum_greater_then(16) == [1, 1, 2, 3, 5, 8]
  end

  test "#to_fib" do
    assert to_fib(0) == 0
    assert to_fib(1) == 1
    assert to_fib(2) == 11
    assert to_fib(3) == 110
    assert to_fib(4) == 111
    assert to_fib(16) == 1001000
  end

  def convert(file) do
    file
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&convert_line/1)
  end

  defp convert_line("10" <> " " <> number) do
    String.to_integer(number)
    |> to_fib
  end
  defp convert_line("F" <> " " <> number) do
    {"F", number}
  end

  defp fib_until_sum_greater_then(number) when number == 0 or number == 1, do: [1]
  defp fib_until_sum_greater_then(number) do
    fib_until_sum_greater_then(number, [1, 1])
  end
  defp fib_until_sum_greater_then(number, fib) do
    if Enum.sum(fib) >= number do
      fib
    else
      last_element = Enum.at(fib, -1)
      second_last_element = Enum.at(fib, -2)
      next_fib = last_element + second_last_element
      fib_until_sum_greater_then(number, fib ++ [next_fib])
    end
  end

  defp to_fib(number) when number == 0 or number == 1, do: number
  defp to_fib(number) do
    fib_series = fib_until_sum_greater_then(number) |> Enum.reverse
    {fib_number, _} = fib_series |> Enum.reduce({[], number}, fn(fib_number, {acc, remaining_number}) ->
      if remaining_number >= fib_number,
        do: {acc ++ [1], remaining_number - fib_number},
        else: {acc ++ [0], remaining_number}
    end)
    fib_number
    |> Enum.join("")
    |> String.to_integer
  end
end
