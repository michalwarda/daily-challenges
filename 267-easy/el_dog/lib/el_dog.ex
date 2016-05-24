defmodule ElDog do
  def to_spoken(number) when rem(number, 100) in [11, 12, 13] do: "#{number}th"

  def to_spoken(number) do
    ending =
      case rem(number, 10) do
        1 -> "st"
        2 -> "nd"
        3 -> "rd"
        _ -> "th"
      end

    "#{number}#{ending}"
  end

  def create_list(place, range \\ 100) do
    1..range
    |> Enum.map(&(ElDog.to_spoken(&1)))
    |> List.delete(ElDog.to_spoken(place))
  end

  def he_didnt_get(place, range \\ 100) do
    create_list(place, range) |> Enum.join(", ") |> IO.puts
  end
end
