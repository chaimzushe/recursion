
# a method that returns the range from start, til (not including!) endd.
def rec_range(start, endd)
  return [] if start >= endd
  endd -= 1
  rec_range(start, endd) << endd
end


def exp1(base, power)
   power == 0 ? 1 : base * exp1(base, power -1)

end
