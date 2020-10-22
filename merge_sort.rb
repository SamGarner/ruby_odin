# frozen_string_literal: false

#Build a method merge_sort that takes in an array and returns a sorted array, 
#using a recursive merge sort methodology.

# divide left and right
# left = merge_sort(left), right = merge_sort(right)
# empty array to update after comparisons of two groups as a whole and their first values


def merge_sort(array)
  len = array.length
  mid = (len / 2.0).floor
  arr = []
  return array if len == 1
  
  left = merge_sort(array[0..(mid - 1)]) #mergesort
  right = merge_sort(array[mid..(len - 1)]) #mergesort

  until left.empty? && right.empty?
    if left.empty?
      # arr << right.shift
      arr.concat(right)
      return arr
    elsif right.empty?
      # arr << left.shift
      arr.concat(left)
      return arr
    elsif left[0] < right[0]
      arr << left.shift
    else
      arr << right.shift
    end
  end
  return arr
end    

# [2,1]


# p [2,1]
# p merge_sort([2,1])
# first = [1,4,3,2]
# p first
# p merge_sort(first)

second = [9,4,7,3,27,5,4,78] # 33, 54
p second
p merge_sort(second)

# # COPY
# def merge_sort(array)
#     if array.length > 1
#         half = array.each_slice( (array.size/2.0).round ).to_a
#         first_half = half[0]
#         second_half = half[1]
#         first_half = merge_sort(first_half)
#         second_half = merge_sort(second_half)
        
#         sorted_array = []
#         until first_half.empty? && second_half.empty?
#             if !first_half.empty? && (second_half.empty? || first_half[0] < second_half[0])
#                 sorted_array.push(first_half.shift)
#             else
#                 sorted_array.push(second_half.shift)
#             end
#         end
#         array = sorted_array
#     end
#     return array
# end