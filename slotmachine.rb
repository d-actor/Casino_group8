require_relative 'player'
require 'pry'
require 'colorize'
require_relative 'wallet'

class SlotMachine
  attr_accessor :player
  def initialize(player)
    @player = player
  puts "You are about to play the slot machine #{player.name}.".yellow
  menu
  end

end

def menu
  puts "1) Place Bet".yellow
  puts "2) Return to Casino".yellow
  choice = gets.to_i
  if choice == 1
    place_bet
  elsif choice == 2
  else 
    "Not a valid option"
    menu
  end
end

def place_bet
  puts "How much do you want to bet? ($#{@player.wallet.amount})".yellow
  print `clear`
  @bet = gets.to_f
  if @bet > 0 && @bet < @player.wallet.amount 
  @player.wallet.amount -= @bet
  puts "You have $#{@player.wallet.amount} left.".yellow
  play
  else 
    puts "You don't have enough to bet that much.".yellow
    place_bet
  end
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
    puts "You Win!!".green
    `say you win`
    @player.wallet.amount += @bet*3
    puts "You won $#{@bet*3}. You now have $#{@player.wallet.amount}."
    menu
    elsif number1 == number2 || number2 == number3
    puts "You Win!!".green
    @player.wallet.amount += @bet*2
    puts "You won $#{@bet}. You now have $#{@player.wallet.amount}."
    menu
    else 
    puts "Try again.".red
    `say you lose`
    menu
  end
end

