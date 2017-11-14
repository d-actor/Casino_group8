require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'high_low'
require_relative 'blackjack'
require_relative 'slotmachine'

class Casino
  attr_accessor :player, :options


  def initialize
<<<<<<< HEAD
    puts "Welcome to the Ruby Casino!"
    puts "Player info:"
    @player = Player.new
    @options = ["High/Low", "Blackjack", "Slot Machine", "Exit"]
    puts "What game would you like to play?"
=======
    puts "Welcome to the Almost Famous Casino!"    
    @player = Player.new
    puts "What game would you like to play?"
    @options = ["High/Low", "Blackjack", "Slot Machine", "Check your wallet", "Exit"]
>>>>>>> updated slot machine and menus
    menu
  end

  def menu
    puts "=======================".green
    @options.each_with_index { |opt, i| puts "#{i + 1}) #{opt}" }
    puts "=======================".green

    choice = gets.to_i
    case choice
      when 1
        HighLow.new(@player)
      when 2
        Blackjack.new(@player)
      when 3
        SlotMachine.new(@player)
      when 4
        puts "Your wallet has #{player.wallet.amount}."
      when 5
        puts "Thank you come again."
        exit
      else
        puts "Invalid choice."
        menu
      end
      menu
  end

end

Casino.new
