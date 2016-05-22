## To filter which function is called you can use guard clauses.
## Attach a guard clause to a function with one or more "when" keywords
## Executes the function for the argument only if one more more guard clauses matches
## There is a limited set of expressions in guard clauses:
## From http://elixir-lang.org/getting-started/case-cond-and-if.html#expressions-in-guard-clauses

defmodule Guard do
  @moduledoc false
  def what_is(x) when is_number(x) do
    IO.puts "#{x} is a number"
  end

  def what_is(x) when is_list(x) do
    IO.puts "#{x} is a list"
  end

  def what_is(x) when is_atom(x) do
    IO.puts "#{x} is an atom"
  end
end