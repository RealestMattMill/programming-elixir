## Times is a module with one function, double/1
## Load it into iex by calling:
## iex Times.exs
## iex > c "Times.iex"
defmodule Times do
  @moduledoc false
  def double(n) do
    n * 2
  end
  #You can also write funcs with this syntax:
  #Notice after args: ", do: (" and no "end"
  def greet(greeting, name), do: (
    IO.puts greeting
    IO.puts "How are you, #{name}"
  )

  #A one-line func with the previous syntax
  def quad(n), do: Times.double(n) + Times.double(n)
end