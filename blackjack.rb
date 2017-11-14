require_relative 'player'
require_relative 'card'
require_relative 'deck'
require 'pry'
require 'colorize'

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
    print `clear`
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
    print `clear`
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
    @player_total = 0
    @player_hand.each do |card|
      if card.rank == "J" || card.rank == "Q" || card.rank == "K"
        card.rank = 10
      end
      if card.rank == 'A'
        puts "Ace -- 1 or 11?"
        puts "1) 1"
        puts "2) 11"
        puts "Selection: "
        selection = gets.strip.to_i
        case selection
          when 1
            card.rank = 1
          when 2
            card.rank = 11
          else
            puts "Invalid choice"
            puts "Selection: "
            selection = gets.strip.to_i
        end
      end
      @player_total += card.rank.to_i
    end

    print "Your total score: "
    print @player_total
    puts "\n\nDealer total: "
    @dealer_total = 0
    @dealer_hand.each do |card|
      puts "#{card.rank} - #{card.suit}"
      if card.rank == "J" || card.rank == "Q" || card.rank == "K"
        card.rank = 10
      end
      if card.rank == "A"
        card.rank = 11
      end
      @dealer_total += card.rank.to_i
    end
    print @dealer_total
    puts "\n\n"

    if @player_total == 21
      puts "You win!"
    elsif @player_total > 21
      puts "You bust!"
      puts "Dealer wins!"
    elsif @dealer_total > @player_total
      puts "Dealer wins"
    elsif @player_total > @dealer_total
      puts "You win!"
    end
  end

end
