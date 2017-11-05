
# a method that returns the range from start, til (not including!) endd.
def rec_range(start, endd)
  return [] if start >= endd
  endd -= 1
  rec_range(start, endd) << endd
end


def exp1(base, exponent)
  return 1 if exponent == 0
  base * exp1(base, exponent -1)
end
