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
  roman_mapping.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << roman_mapping[divisor] * quotient
    return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
  end
end

puts 1100
puts integer_to_roman(@roman_mapping, 1100, '')
puts 950
puts integer_to_roman(@roman_mapping, 950, '')
