
# 1. 
# Write a function that accepts three arguments
# If the first two are 0 return "FizzBuzz"
# If the first is 0 return "Fizz" 
# if the second is 0 return "Buzz"
# Otherwise return the third argument
fizzbuzz = fn
    {0, 0, _} -> "FizzBuzz"
    {0, _, _} -> "Fizz"
    {_, _, third} -> third
end

# Write a funtion that accepts a string and
# and returns a function that accepts a string
# and return both strings together
prefix = fn str -> fn str_2 -> "#{str} #{str_2}" end end
mrs = prefix.("Mrs.")

IO.puts mrs.("Daisy")
IO.puts fizzbuzz.({0, 0, 1})
IO.puts fizzbuzz.({0, 1, 1})
IO.puts fizzbuzz.({1, 1, "surprice"})
