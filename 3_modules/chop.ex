require IEx;

defmodule Chop do
  @moduledoc false
  def guess(actual, range) when is_number(actual) do
    lower..upper = range
    if actual in range do
      current_guess(lower+div(upper-lower,2), actual, range)
    else
      IO.puts "Target num is not in range #{lower} - #{upper}"
    end
  end

  defp current_guess(guess, actual, range) when actual < guess do
    IO.puts "It is less than #{guess}"
    lower..upper = range
    guess(actual, lower..guess-1)
  end

  defp current_guess(guess, actual, range) when actual > guess do
    IO.puts "It is greater than #{guess}"
    lower..upper = range
    guess(actual, guess+1..upper)
  end

  defp current_guess(guess, actual, range) when guess == actual do
    IO.puts "You guessed it! #{guess}"
  end
end