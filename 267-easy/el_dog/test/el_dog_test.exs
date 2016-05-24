defmodule ElDogTest do
  use ExUnit.Case
  doctest ElDog

  test "to_spoken returns correct number" do
    assert ElDog.to_spoken(0) == "0th"
    assert ElDog.to_spoken(1) == "1st"
    assert ElDog.to_spoken(2) == "2nd"
    assert ElDog.to_spoken(3) == "3rd"
    assert ElDog.to_spoken(4) == "4th"
    assert ElDog.to_spoken(5) == "5th"
    assert ElDog.to_spoken(10) == "10th"
    assert ElDog.to_spoken(11) == "11th"
    assert ElDog.to_spoken(12) == "12th"
    assert ElDog.to_spoken(13) == "13th"
    assert ElDog.to_spoken(14) == "14th"
  end

  test "create_list lists all places dog didn't get" do
    assert ElDog.create_list(1) == 1..100 |> Enum.map(&(ElDog.to_spoken(&1))) |> List.delete(ElDog.to_spoken(1))
    assert ElDog.create_list(2) == 1..100 |> Enum.map(&(ElDog.to_spoken(&1))) |> List.delete(ElDog.to_spoken(2))
  end

  test "create_list lists all places dog didn't get with range" do
    assert ElDog.create_list(1, 5) == 1..5 |> Enum.map(&(ElDog.to_spoken(&1))) |> List.delete(ElDog.to_spoken(1))
    assert ElDog.create_list(2, 5) == 1..5 |> Enum.map(&(ElDog.to_spoken(&1))) |> List.delete(ElDog.to_spoken(2))
    ElDog.he_didnt_get(1)
    ElDog.he_didnt_get(2)
  end
end
