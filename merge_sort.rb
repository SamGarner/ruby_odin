# frozen_string_literal: false

#Build a method merge_sort that takes in an array and returns a sorted array, 
#using a recursive merge sort methodology.


# COPY
def merge_sort(array)
    if array.length > 1
        half = array.each_slice( (array.size/2.0).round ).to_a
        first_half = half[0]
        second_half = half[1]
        first_half = merge_sort(first_half)
        second_half = merge_sort(second_half)
        
        sorted_array = []
        until first_half.empty? && second_half.empty?
            if !first_half.empty? && (second_half.empty? || first_half[0] < second_half[0])
                sorted_array.push(first_half.shift)
            else
                sorted_array.push(second_half.shift)
            end
        end
        array = sorted_array
    end
    return array
end