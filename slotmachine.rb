require_relative 'player'
require 'pry'

class SlotMachine
  attr_accessor :player
  def initialize(player)
    @player = player
  puts "You are about to play the slot machine #{player.name}"
  menu
  end

end

def menu
  puts "1) Place Bet"
  puts "2) Return to Casino"
  choice = gets.to_i
  if choice == 1
    place_bet
  end
end

def place_bet
  puts "How much do you want to bet? ($#{@player.wallet.amount})"
  @bet = gets.to_f
  @player.wallet.amount -= @bet
  puts "You have #{@player.wallet.amount} left."
  play
end

def play
  @arr1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @arr2 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @arr3 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  number1 = @arr1.sample
  number2 = @arr2.sample
  number3 = @arr3.sample

  puts "You got: #{number1} #{number2} #{number3}."
  if number1 == number2 && number2 == number3 
    puts "You Win!!"
    winnings = @player.wallet.add(@bet*2)
    puts "You won #{winnings}. You now have #{@player.wallet.amount}."
    menu
  else 
    puts "Try again."
    menu
  end
end
