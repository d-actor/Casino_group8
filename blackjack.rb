require_relative 'player'
require_relative 'card'
require_relative 'deck'
require 'pry'

class Blackjack
  attr_accessor :player, :deck, :card
  def initialize(player)
    @player = player
    @cards = Deck.new
    @player_hand = []
    @dealer_hand = []
    puts "Welcome to Blackjack #{player.name}!"
    menu
  end

  def menu
    puts "1) Place Bet"
    puts "2) Casino main menu"
    puts "Please make a selection: "
    choice = gets.strip.to_i
    if choice == 1
      place_bet
    end
  end

  def place_bet
    puts "How much do you want to bet on this hand?"
    @bet = gets.strip.to_f
    puts `clear`
    puts "Current bet: $#{@bet}"

    @player_card1 = @cards.cards.sample
    @player_card2 = @cards.cards.sample
    @player_hand << @player_card1
    @player_hand << @player_card2

    @dealer_card1 = @cards.cards.sample
    @dealer_card2 = @cards.cards.sample
    @dealer_hand << @dealer_card1
    @dealer_hand << @dealer_card2

    puts "Your hand: "
    @player_hand.each do |card|
      puts "#{card.rank} - #{card.suit}"
    end
    puts "\nDealer shows: "
    puts "#{@dealer_card1.rank} - #{@dealer_card1.suit}"
    puts "\nHit or stay?"
    puts "1) Hit"
    puts "2) Stay"
    puts "Selection: "
    selection = gets.strip.to_i
    case selection
      when 1
        hit
      when 2
        end_hand
      else
        puts "Invalid choice"
        puts "Selection: "
        selection = gets.strip.to_i
    end
  end

  def hit
    puts `clear`
    puts "Current bet: $#{@bet}"
    puts "hit"
    @player_card3 = @cards.cards.sample
    @player_hand << @player_card3
    @player_hand.each do |card|
      puts "#{card.rank} - #{card.suit}"
    end
    puts "\nDealer shows: "
    puts "#{@dealer_card1.rank} - #{@dealer_card1.suit}"
    puts "\nHit or stay?"
    puts "1) Hit"
    puts "2) Stay"
    puts "Selection: "
    selection = gets.strip.to_i
    case selection
      when 1
        hit
      when 2
        end_hand
      else
        puts "Invalid choice"
        puts "Selection: "
        selection = gets.strip.to_i
    end
  end

  def end_hand
    # @player_hand.each do |card|
    #   card.rank.to_i += player_total
    # end

    @player_card1.rank.to_i + @player_card2.rank.to_i = player_total

    @dealer_card1.rank.to_i + @dealer_card2.rank.to_i = dealer_total

    if 21 >= player_total > dealer_total
      puts "You win!"
    else
      puts "You lose!"
    end
  end

end

player = Player.new
Blackjack.new(player)
