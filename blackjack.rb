require_relative 'player'
require_relative 'card'
require_relative 'deck'

class Blackjack
  attr_accessor :player

  def initialize(player)
    @player = player
    puts "Welcome to Blackjack #{player.name}!"
    menu
  end

  def menu
    puts "1) Place Bet"
    puts "2) Casino main menu"
    puts "Please make a selection: "
    choice = gets.strip.to_i
    if choice = 1
      place_bet
    end
  end

  def place_bet
    puts "How much do you want to bet on this hand?"
    bet = gets.strip.to_f
    Deck.new
    binding.pry
  end

end

player = Player.new
Blackjack.new(player)
