# # frozen_string_literal: false

# def fibs(n)
#    fib_array = []
#     for i in 0..(n-1)
#        if i == 0 || i == 1
#         fib_array[i] = i
#        else
#         fib_array[i] = fib_array[i-2] + fib_array[i-1]
#        end
#     end
#     fib_array
# end


# def fibs(n)
#   return (0..n).reduce([]) { |a, v| a << v } if n < 2
#   result = [0, 1]
#   2.upto(n-1) { result << result[-2] + result[-1] }
#   result
# end

def fibs_rec(num)
  arr = []
  if num.zero?
    arr << 0
  elsif num == 1
    arr << 0 << 1
  else
    arr = [] #[0, 1]
    (2..num-1).each
    arr << (fibs_rec(num-2) + fibs_rec(num-1))
  end
  arr
end


# take n, calc that many fibonacci numbers, return the numbers

# to get that value:

# def fib_sequence(n)
#   return 0 if n < 2
#   return 1 if n == 2
#   return fib_sequence(n-1) + fib_sequence(n-2)
# end





# # def fibs(n)
# #   if 1
# #     0
# #   elsif 2
# #     0, 1
# #   else
# #     puts 0,1,0+1
# #     puts 0,1,1,1+1
# #   end
# # end
# # 1.2.3.4.5.6.7.8.9.
# # 0,1,1,2,3,5,8,13,21,34

# def fib_sequence(n, array=[])
#   return 0 if n < 2
#   return 1 if n == 2
#   array.insert(1, (fib_sequence(n-1) + fib_sequence(n-2)))  
#   # return array
# end

# # 4 >> 0,1,1,2
# # 5 >> 0,1,1,2,3

# # fib(4-1) + fib(4-2)
# # fib(3) + fib(2)
# # fib(3-1) + fib(3-2) + 1
# # 1 + 0 + 1 >> correctly gets 4th element


# # n = (n-1)+(n-2)
