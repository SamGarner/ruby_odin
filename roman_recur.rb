@roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

@roman_mapping2 = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

  # def int_to_roman(roman_map = @roman_mapping, int, result)
  #   if int.zero?
  #     result
  #   else
  #     roman_map.keys.each do |roman|
  #       times, mod = int.divmod(roman)
  #       times.times { result << roman_map[int] }
  #       int_to_roman(roman_map, mod, result) if mod > 0
  #     end
  #   end
  # end

def integer_to_roman(roman_mapping, number, result = "")
  return result if number == 0
  roman_mapping.keys.each do |divisor|  # won't loop through everything most likely
  # because nested/recursive piece will run into the number == 0 codition and return the current roman numeral
    # puts 'key:'
    # puts divisor
    quotient, modulus = number.divmod(divisor)
    # puts 'quotient, modulus'
    # puts quotient, modulus
    result << roman_mapping[divisor] * quotient
    return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
  end
  puts result
end

def roman_to_int(roman_mapping2, numeral, result_int = 0)
  if numeral == ''
    return result_int
  else roman_mapping2.keys.each do |roman|
    if roman == numeral[0, roman.length]
      numeral = numeral.delete_prefix(roman)
      result_int += roman_mapping2[roman]
      roman_to_int(roman_mapping2, numeral, result_int)
    end
  end
  end
  puts result_int
end


# 1950 integer_to_roman example
#   1000
#     1, 950
#     'M'
#         950 (1000)
#           0, 950
#         950 (900)
#           1, 50
#           'CM'
#             50 (1000)
#             50 (900)
#             ...
#             50 (50)
#               1, 0
#               'L'
#               0 (1000)
#               return result: 'MCML'



# puts 1100
# puts integer_to_roman(@roman_mapping, 1100, '')
# puts 950
# puts integer_to_roman(@roman_mapping, 950, '')
puts 1950
puts integer_to_roman(@roman_mapping, 1950,'')

puts 'MCML'
puts roman_to_int(@roman_mapping2, 'MCML', 0)

# 1100
#   1000, 100
#   'M'
#   900, 200

# 1950
#   1, 100
#   'M'
#   900, 50
#   <<'CM'
#   0..
#   ..
#   ..
#   100, 0
#   'c'

#   >>'MC'