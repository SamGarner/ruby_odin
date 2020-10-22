require 'pry'

def fibs_rec(n)
  return (0..n).reduce([]) { |a, v| a << v } if n < 2
  prev = fibs_rec(n - 1)
  binding.pry
  prev << prev[-2] + prev[-1]
  binding.pry
end
