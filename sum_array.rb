def sum(numbers)
  total = 0
  
  numbers.each do |element_number|
  element_number = element_number.to_s
  element_reverse = element_number.reverse
  element_position = element_number.reverse.index("0")
  
  next if element_number.reverse.byteslice(0).to_i == 0
  total += element_reverse.slice(0..element_position-1).reverse.to_i

  end
  
  total
end

numbers = [1200000265, 1000002360, 1670000800, 1000006002, 1000000233]
sum(numbers)