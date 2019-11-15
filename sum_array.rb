def sum(numbers)
  total = 0
  
  numbers.each do |number|
  number = number.to_s
  number_reverse = number.reverse
  number_position = number.reverse.index("0")
  next if number.reverse.byteslice(0).to_i == 0

  total += number_reverse.slice(0..number_position-1).reverse.to_i
  end
  
  total
end

numbers = [1200000265, 1000002360, 1670000800, 1000006002, 1000000233]
sum(numbers)