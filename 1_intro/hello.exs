IO.puts "Hello, world!"

### Matching ###

list = [1,2,3]
## The following passes because a=1, 2=2, b=3
[a,2,b] = list

## The following fails because '1' does not match '2' in list.
#[a,1,b] = list

a = [[1,2,3]]
## The first element of the list [a] is bound to [1,2,3]
[a] = [[1,2,3]]

## Fails
#[[a]] = [[1,2,3]]

## Ignoring a value with _
[1, _, _] = [1,2,3]
[1, _, _] = [1, "cat", "dog"]

## Values are only matched once in an expression
[a,a] = [1,1]

## The following fails because a is bound to 1, it will not be bound again to 2
#[a,a] = [1,2]

## A variable can be re-bound in a subsequent match
a = 1
[1,a,3] = [1,2,3] #passes

## If you want to force Elixir to use the existing value and not re-bind use ^ (pin operator)
a = 1
## Generates an error:
#^a = 3

## Which of the following will match?
#[a,b,a] = [1,2,3] ## No - a is bound to 1 then cannot match 3
#[a,b,a] = [1,1,2] ## No - a is bound to 1 and cannot match 2
[a,b,a] = [1,2,1]  ## Yes - a is bound to 1 then matches the second 1

# The variable 'a' is bound to 2.  Which will match?
#[a,b,a] = [1,2,3] ## No - a is re-bound to 1 and cannot match 3
#[a,b,a] = [1,1,2] ## No - a is re-bound to 1 and cannot match 2
a = 1              ## Yes - a is re-bound to 1
a = 2
^a = 2             ## Yes - a is matched against 2
# ^a = 1           ## No - a is pinned to 2 and cannot match 1
# ^a = 2 - a       ## No - a is pinned to 2 and cannot match the evaluation of a-2 (0)

## In elixir, = does not mean assignment.  It is more of an evaluation operator.  If it cannot make the expressions on
## both sides match somehow it will error

### Immutability ###

## In elixir, all data is immutable.
## In this chapter the author introduce the [ head | tail ] operator
## This is done to demonstrate the performance benefit of immutable data:
list1 = [3,2,1]
list2 = [4 | list1]

## In most languages, the machine would have to copy all values of list1 into list2.
## In Elixir, the machine will simply create a list with head as the int 4 and tail as the list list1.
## This is possible because list1 will never change, you can re-bind the list1 identifier but the original list will still
## be there.