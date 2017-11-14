require_relative 'player'
require 'pry'
require 'colorize'
require_relative 'wallet'

class SlotMachine
  attr_accessor :player
  def initialize(player)
    @player = player
  print `clear`
  puts "You are about to play the slot machine #{player.name}.".yellow
  puts "This machine only accepts fives."
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
  @bet = gets.to_f
  if @bet == 5
    if @bet < @player.wallet.amount
      @player.wallet.amount -= @bet
    puts "You have $#{@player.wallet.amount} left.".yellow
    play
     else 
    puts "You don't have enough to bet that much.".yellow
      menu
     end
    else
     puts "That's not a valid bet. This machine only accepts fives."
     menu
  end
end


def play
  @arr1 = ["\u{1F34a}", "\u{1F34b}", "\u{1F34c}", "\u{1F349}",  "\u{1F34d}"]
  @arr2 = ["\u{1F34a}", "\u{1F34b}", "\u{1F34c}", "\u{1F349}", "\u{1F34d}" ]
  @arr3 = ["\u{1F34a}", "\u{1F34b}", "\u{1F34c}", "\u{1F349}", "\u{1F34d}" ]
  @arr4 = ["\u{1F34a}", "\u{1F34b}", "\u{1F34c}", "\u{1F349}",  "\u{1F34d}"]
  @arr5 = ["\u{1F34a}", "\u{1F34b}", "\u{1F34c}", "\u{1F349}", "\u{1F34d}" ]
  @arr6 = ["\u{1F34a}", "\u{1F34b}", "\u{1F34c}", "\u{1F349}", "\u{1F34d}" ]
  @arr7 = ["\u{1F34a}", "\u{1F34b}", "\u{1F34c}", "\u{1F349}",  "\u{1F34d}"]
  @arr8 = ["\u{1F34a}", "\u{1F34b}", "\u{1F34c}", "\u{1F349}", "\u{1F34d}" ]
  @arr9 = ["\u{1F34a}", "\u{1F34b}", "\u{1F34c}", "\u{1F349}", "\u{1F34d}" ]

  

  number1 = @arr1.sample
  number2 = @arr2.sample
  number3 = @arr3.sample
  number4 = @arr1.sample
  number5 = @arr2.sample
  number6 = @arr3.sample
  number7 = @arr1.sample
  number8 = @arr2.sample
  number9 = @arr3.sample

  puts "You got:"
  print "#{number1} |" ; sleep (1)
  print " #{number2} |"; sleep (1)
  print " #{number3}" ; sleep (1)
  puts ""
  print "#{number4} |" ; sleep (1)
  print " #{number5} |"; sleep (1)
  print " #{number6}" ; sleep (1)
  puts ""
  print "#{number7} |" ; sleep (1)
  print " #{number8} |"; sleep (1)
  print " #{number9}" ; sleep (1)
  puts ""

  if number4 == number5 && number5 == number6 
    `say you win`
    puts "You Win!!".green
    @player.wallet.amount += @bet*3
    puts "You won $#{@bet*3}. You now have $#{@player.wallet.amount}."
    menu
    elsif number1 == number5 && number5 == number9
    `say you win`
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


