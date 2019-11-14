def multiplication_list(list)
  list_multiplication = []
  multiplication = 1
  list.each {|elemento| multiplication = multiplication * elemento}
  list.each do |validar|
     list_multiplication.push(multiplication/validar)
  end

  list_multiplication
end

multiplication_list([1,2,3,4])