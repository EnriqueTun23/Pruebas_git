class Contact
  def self.all
    [
      {name: 'Jose', last_name: 'Lopez', age: 20, gender:'Masculino'},
      {name: 'Oscar', last_name: 'Perez', age: 21, gender: 'Masculino'},
      {name: 'Martha', last_name: 'Sanchez', age: 22, gender: 'Femenino'} 
    ]  
  end    

  def self.find_by(key, value)
    id_person = Contact.all.index{|person| person.key(value) && person.values_at(key)}
    Contact.all[id_person]
  end
end

puts "----------------Imprimir todo los arrays ----------------"
puts Contact.all
puts "----------------Busqueda perzonalizada ----------------"
puts Contact.find_by('age', 20)

