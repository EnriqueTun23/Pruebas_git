class User
    attr_accessor :name, :last_name
    
    def initialize(name, last_name)
    @name = name
    @last_name = last_name
    end

    def to_print_name
        puts "Hola, me llamo #{name} #{last_name}"
    end
end

kike = User.new("Enrique", "Tun")

kike.to_print_name