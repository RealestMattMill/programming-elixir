### Built-in types ###
## Value types:
##   Arbitrary sized integers
##   Floating point numbers
##   Atoms
##   Ranges
##   Regular expr
## System types:
##   PIDs and Ports
##   References
## Collection types:
##   Tuples
##   Lists
##   Maps
##   Binaries
## Functions are their own type

### Numbers###

## Integers can be represented 4 ways:
## Decimal
IO.puts 1234
## Hexadecimal
IO.puts 0xcafe
## Octal
IO.puts 0o765
##Binary
IO.puts 0b1010
## Floating-point numbers must contain a decimal
IO.puts 5.12
## They can have trailing exponent
IO.puts 314159.0e-5

### Atoms ###

## Atoms are constants that represent a name.  They may contain letters, digits, underscore and at-signs (@).
## Atoms may end with an ! or ?
## You may write atoms containing arbritrary other characters by using double quotes
:fred
:is_binary?
:var@2
:<>
:===
:"func/3"
:"long john silver"
## An atom's name is its value, two atoms with the same name will always evaluate equal regardless of context

### Ranges ###

## Ranges are represented as start..end where start and end are integers
range = 3..5

### Regex ###

## Elxir uses regular expression literals of the format ~r{regexp} or ~r{regexp}opts
## Regex support is provided by PCRE www.pcre.org
IO.puts Regex.run ~r{[aeiou]}, "caterpillar"
IO.puts Regex.scan ~r{[aeiou]}, "caterpillar"
IO.puts Regex.split ~r{[aeiou]}, "caterpillar"
IO.puts Regex.replace ~r{[aeiou]}, "caterpillar", "*"

### System Types ###

## Resources in the underlying Erlang VM
## PID is a reference to a local or remote process
## Port is a reference to a resource that you'll be reading or writing
## The PID of the current process is available by calling 'self'
## The function make_ref can be used to create a globally unique reference.  The author does not like this idea.

### Collection types ###

## Tuples are ordered collections
tup = {1,2}
fancyTup = {:ok, 42, "next"}
## Tuples are typically 2-4 elements, any larger and you should use a Map or Struct
## Tuples can be used in pattern matching
{status, count, action} = {:ok, 42, "next"}
IO.puts action
## A common idiom is to write matches that assume success:
#{:ok, file} = File.open("somefile")
## This call will return a tuple {:error, :enoent} and will not match

### Lists ###

## Lists have the syntax [1,2,3] and are defined recursively.  Every list will either be empty, or contain a head and a
## tail that is also a list.  Lists are easy to traverse linearly but expensive to access randomly (must traverse the
## entire list).

## Lists have some special operators
## Concatenation
concat = [1,2,3,4] ++ [5,6,7,8]
## Difference
diff = [1,2,3,4] -- [2,4]
## Membership
contains = 1 in [1,2,3,4]
containsfalse = "something" in [1,2,3,4]

## There is a shortcut for creating key/value lists.  The following will be converted to a list of tuples
kwlist = [ name: "Dave", city: "Dallas", likes: "Programming" ]

## You can leave off the brackets if the last arg in a function call
## DB.save record, [ {:use_transaction, true}, {:logging, "HIGH"} ]
## DB.save record, :use_transaction: true, logging: "HIGH"

### Maps ###
## The map literal looks like:
state = %{ "AL" => "Alabama", "WI" => "Wisconsin"}
## Keys and values can be any type
## Keys do not have to all be the same type in a list
## Access a map with bracket notation
bama = state["AL"]
## Maps only allow one instance of a key and scale well with many entries

### Binaries ###
## To work with binary data, you can use the binary literal << >>
bytes = <<1,2>>
## This will pack two integers into bytes

### Names, Operators, Files, Conventions ###
## Identifiers can have upper and lowercase ascii characters, digits, underscores and can end with ? or !
## Module, record, protocol and behavior names should start with an uppercase and are camel case
## Other identifiers start with a lowercase or underscore and use _ between words

## Operators
## 3 different special values: true, false, nil.  nil is treated as false in booleans
## Any value other than false is treated as true for boolean operations
## Comparison
a = 1
b = a
a === b # Strict equality (1 === 1.0) is false
a !== b # Strict inequality
a == b # Value equality (1 == 1.0) is true
a != b # Value inequality
a > b  # Normal comparisons
a < b
a >= b
a <= b

## Boolean operators
## Expects true or false as the first argument
a = true
b = false
a or b  # true if a is true, otherwise b
a and b # false if a is false, otherwise b
not a   # false if a is true, otherwise true

## Relaxed boolean operators
