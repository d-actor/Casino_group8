require_relative 'wallet'

class Player
  MIN_AGE = 21
  MAX_AGE = 120
  attr_accessor :name, :age, :wallet

  def initialize
    puts "Welcome to The Almost Famous Casino."
    puts "What is your name, player?"
    @name = gets.strip
    puts "What is your age?"
    @age = gets.to_i
    age_verification
    puts 'How much money are you playing with?'
    amount = gets.to_f
    @wallet = Wallet.new(amount)
  end

  def age_verification
    if @age < MIN_AGE 
      # `say GET OUT OF HERE!`
      puts "GET OUT OF HERE!"
      exit
    elsif @age > MAX_AGE
      puts "Sorry, you're not human."
      exit
    end
  end

end
