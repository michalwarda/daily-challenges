defmodule ElAnagramTest do
  use ExUnit.Case
  doctest ElAnagram

  @input """
  "wisdom" ? "mid sow"
  "Seth Rogan" ? "Gathers No"
  "Reddit" ? "Eat Dirt"
  "Schoolmaster" ? "The classroom"
  "Astronomers" ? "Moon starer"
  "Vacation Times" ? "I'm Not as Active"
  "Dormitory" ? "Dirty Rooms"
  """

  @output """
  "wisdom" is an anagram of "mid sow"
  "Seth Rogan" is an anagram of "Gathers No"
  "Reddit" is NOT an anagram of "Eat Dirt"
  "Schoolmaster" is an anagram of "The classroom"
  "Astronomers" is NOT an anagram of "Moon starer"
  "Vacation Times" is an anagram of "I'm Not as Active"
  "Dormitory" is NOT an anagram of "Dirty Rooms"
  """

  test "the truth" do
    assert @input |> ElAnagram.fill_anagram_information == @output
  end
end
