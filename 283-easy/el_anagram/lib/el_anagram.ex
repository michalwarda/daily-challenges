defmodule ElAnagram do
  def fill_anagram_information(input) do
    input
    |> String.split("\n")
    |> Enum.map(&add_anagram_information/1)
    |> Enum.join("\n")
  end

  defp add_anagram_information(""), do: ""
  defp add_anagram_information(line) do
    [first_phrase, second_phrase] = line |> String.split("?") |> Enum.map(&String.trim/1)
    if anagrams?(first_phrase, second_phrase),
      do: first_phrase <> " is an anagram of " <> second_phrase,
      else: first_phrase <> " is NOT an anagram of " <> second_phrase
  end

  defp sort_phrase(phrase) do
    phrase
    |> String.downcase
    |> String.replace(~r/[^a-z]/, "")
    |> String.to_charlist
    |> Enum.sort
    |> to_string
  end

  defp anagrams?(first_phrase, second_phrase) do
    first_phrase |> sort_phrase == second_phrase |> sort_phrase
  end
end
