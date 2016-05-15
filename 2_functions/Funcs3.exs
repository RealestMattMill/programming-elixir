#Functions as arguments
times_2 = fn a -> a * 2 end
apply = fn (fun, val) -> fun.(val) end
IO.inspect apply.(times_2, 6)

#Map
list = [1,2,3,4,5]

IO.inspect Enum.map list, fn elem -> elem * 2 end
IO.inspect Enum.map list, fn elem -> elem * elem end
IO.inspect Enum.map list, fn elem -> elem > 4 end

#You can pin values inside functions
#This will allow you to use the original arg to
#the function when evaluating the multiple arg list
defmodule Greeter do
  def for(name,greeting) do
    fn
      (^name) -> "#{greeting} #{name}"
      (_) -> "I don't know you"
    end
  end
end

matticus = Greeter.for("Matt", "Sup? ")
IO.puts matticus.("Matt")
IO.puts matticus.("Dave")

defmodule Greeter2 do
  def for(name,greeting) do
    fn
      (name) -> "#{greeting} #{name}"
      (_) -> "I don't know you"
    end
  end
end

matticus = Greeter2.for("Matt", "Sup? ")
IO.puts matticus.("Matt")
IO.puts matticus.("Dave")

IO.inspect Enum.map [1,2,3,4], &(&1 + 2)
Enum.each [1,2,3,4], &(IO.inspect &1)