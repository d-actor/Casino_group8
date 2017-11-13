class Player
  MIN_AGE = 21
  attr_accessor :name, :age 

  def initialize
    puts "What is your name, player?"
    @name = gets.strip
    puts "What is your age?"
    @age = gets.to_i
    age_verification
  end

  def age_verification
    if @age < MIN_AGE
      # `say GET OUT OF HERE!` 
      puts "GET OUT OF HERE!"
      exit
    end
  end

end
  