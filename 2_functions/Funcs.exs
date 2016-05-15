pair_tuple_to_list =
fn
  ({a,b}) -> [a,b]
end

IO.inspect pair_tuple_to_list.({1234,5678})

list_concat =
fn
  a, b -> a++b
end

IO.inspect list_concat.([:a, :b], [:c, :d])

sum = fn (a,b,c) -> a+b+c end

IO.inspect sum.(1,2,3)

print_fizzbuzz = fn
 (0, 0, _) -> IO.puts "FizzBuzz"
 (0, _, _) -> IO.puts "Fizz"
 (_, 0, _) -> IO.puts "Buzz"
 (_, _, a) -> IO.puts a
end

eval_fizzbuzz = fn
a -> print_fizzbuzz.(rem(a,3), rem(a,5), a)
end
IO.puts ""
IO.puts "## FizzBuzz ##"
eval_fizzbuzz.(10)
eval_fizzbuzz.(11)
eval_fizzbuzz.(12)
eval_fizzbuzz.(13)
eval_fizzbuzz.(14)
eval_fizzbuzz.(15)
eval_fizzbuzz.(16)
#print_fizzbuzz.(0,0,5)
#print_fizzbuzz.(1,2,3)