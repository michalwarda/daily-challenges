defmodule ElDog do
  def to_spoken(number) do
    case number do
      number when number in [11, 12, 13] -> '#{number}th'
      number ->
        case rem(number, 10) do
          1 -> '#{number}st'
          2 -> '#{number}nd'
          3 -> '#{number}rd'
          _ -> '#{number}th'
        end
    end
  end

  def create_list(place, range \\ 100) do
    1..range
    |> Enum.map(&(ElDog.to_spoken(&1)))
    |> List.delete(ElDog.to_spoken(place))
  end

  def he_didnt_get(place, range \\ 100) do
    create_list(place, range)
    |> Enum.each(&(IO.puts(&1)))
  end
end
