
# A method that returns the range from start, til (not including!) endd.
def rec_range(start, endd)
  return [] if start >= endd
  endd -= 1
  rec_range(start, endd) << endd
end

# A method that return a base number raised to a given power, in a not so efficiant way
def exp1(base, power)
  power == 0 ? 1 : base * exp1(base, power -1)
end

# A method that return a base number raised to a given power, in an efficiant way
def exp2(base, power)
  return 1 if power == 0
  half = exp2(base, power / 2)
  power.even? ? half * half : base * half * half
end

# Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.
# This method will perform a "deep" duplication of any and all interior arrays.
def deep_dup(arr)
  dupped = []
  arr.each do |el|
    el.is_a?(Array) ? dupped << deep_dup(el) : dupped << el
  end
  dupped
end

# A one-line version of the previous method
def deep_dup(arr)
  arr.map{|el| el.is_a?(Array) ? deep_dup(el) : el}
end

# A method that returns the an array of numbers in fibonacci order, till the n'th number.
def fibonacci(n)
  return [0,1].take(n) if n <= 2
  fibs = fibonacci(n -1)
  fibs << fibs[-1] + fibs[-2]
end
