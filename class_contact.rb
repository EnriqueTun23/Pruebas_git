class Contact

    def initialize()
        @personas = [
        {name: 'Jose', last_name: 'Lopez', age: 20, gender:'Masculino'},
        {name: 'Oscar', last_name: 'Perez', age: 21, gender: 'Masculino'},
        {name: 'Martha', last_name: 'Sanchez', age: 22, gender: 'Femenino'} 
    ]        
    end

    def all
       @personas 
    end    

    def find_by(k, v)
       id_person = @personas.index{|person| person.key(v) && person.values_at(k)}
       @personas[id_person]
    end
end

prueba = Contact.new
puts "----------------Imprimir todo los arrays ----------------"
puts prueba.all
puts "----------------Busqueda perzonalizada ----------------"
puts prueba.find_by('name', 'Martha')
