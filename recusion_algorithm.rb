require 'byebug'
require 'Benchmark'
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

# A method subsets that will return all subsets of an array.
def subsets(arr)
  return [[]] if arr.empty?
  last = arr.last
  subs = subsets(arr.take( (arr.size) -1 ))
  subs.concat( subs.map{|sub| sub + [last] })
end



# A big O of log(n) method to search an array
def binary_search(arr, target)
  return nil if arr.empty?
  middle = arr.size / 2
  case arr[middle] <=> target
  when 1
    binary_search(arr[0...middle], target)
  when 0
    return middle
  when -1
    result = binary_search(arr.drop(middle + 1), target)
    result.nil? ? nil : result + 1 + middle
  end
end

#A recursive method that calculates all the permutations of a given array.
def permutations(array)
  return [array] if array.length <= 1
  first = array.first
  perms = permutations(array.drop(1))
  total_permutations = []
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0...i] + [first] + perm[i..-1]
    end
  end
  total_permutations
end

# sorting method 1:  quick sort:
def quick_sort(arr)
  return arr if arr.size <= 1
  pivot = arr.first
  left, right = arr.drop(1).partition{|el| el <= pivot }
  quick_sort(left) + [pivot] + quick_sort(right)
end

# sorting method 2:  quick sort:
def merge_sort(arr)
  return arr if arr.size <= 1
  middle = arr.size / 2
   merge(merge_sort(arr.take(middle)),merge_sort(arr.drop(middle)))
end


def merge(right, left)
  merged = []
  until right.empty? || left.empty?
    right.first < left.first ? merged << right.shift : merged << left.shift
  end
  merged + left + right
end
