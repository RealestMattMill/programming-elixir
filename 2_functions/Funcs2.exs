fun1 = fn -> (fn -> "Hello nested function" end) end
## fun1.() returns a function
fun2 = fun1.()

IO.puts fun1.().()
IO.puts fun2.()

## Functions remember their original environment
greeter = fn name -> (fn -> "Hello, #{name}" end) end
matt_greeter = greeter.("Matt")

IO.puts matt_greeter.()

## Another example
add_n = fn n -> ( fn other -> other + n end) end
add_2 = add_n.(2)
add_5 = add_n.(5)

IO.inspect add_2.(3)
IO.inspect add_5.(7)

## Exercise
prefix = fn prefix -> (fn other -> "#{prefix} #{other}" end) end
mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")