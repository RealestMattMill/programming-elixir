defmodule Math do
  @moduledoc false
  def factoral(0), do: 1
  def factoral(n), do: n * factoral(n-1)


  def sum(1), do: 1
  def sum(n), do: n + sum(n-1)

  def gcd(x,0), do: x
  def gcd(x,y), do: gcd(y, rem(x,y))
end