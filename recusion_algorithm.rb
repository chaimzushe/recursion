
# a method that returns the range from start, til (not including!) endd.
def rec_range(start, endd)
  return [] if start >= endd
  endd -= 1
  rec_range(start, endd) << endd
end

# a method that return a base number raised to a given power, in a not so efficiant way
def exp1(base, power)
  power == 0 ? 1 : base * exp1(base, power -1)
end

# a method that return a base number raised to a given power, in an efficiant way
def exp2(base, power)
  return 1 if power == 0
  half = exp2(base, power / 2)
  power.even? ? half * half : base * half * half
end
