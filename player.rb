require_relative 'wallet'
require 'colorize'

class Player
  MIN_AGE = 21
  MAX_AGE = 120
  attr_accessor :name, :age, :wallet

  def initialize
    puts "What is your name, player?".yellow
    @name = gets.strip
    puts "What is your age?".yellow
    @age = gets.to_i
    age_verification
    puts 'How much money are you playing with?'.yellow
    amount = gets.to_f
    if amount > 0
    @wallet = Wallet.new(amount)
    else
      puts "Go get a job."
      Player.new
    end
  end

  def age_verification
    if @age < MIN_AGE
      print `say GET OUT OF HERE!`
      puts "GET OUT OF HERE!"
      exit
    elsif @age > MAX_AGE
      puts "Sorry, you're not human."
      exit
    end
  end

end
