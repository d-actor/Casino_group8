require 'pry'
require 'colorize'

require_relative 'player'
require_relative 'wallet'


class HighLow
  attr_accessor :player
  def initialize(player)
    @player = player
    menu
  end
  

  def menu
    print `clear`
    puts "Welcome to High Low!".yellow
    puts "1) Place Bet".yellow
    puts "2) Return to Casino".yellow
    choice = gets.to_i
    if choice == 1
      place_bet
    elsif choice == 2

    else
      puts "Invalid choice. Choose again.".yellow
      menu
    end
  end

  def place_bet
    puts "How much do you want to bet? ($#{@player.wallet.amount})".yellow
    @bet = gets.to_f
    @player.wallet.amount -= @bet
    puts "You have $#{@player.wallet.amount} left."

    @house_number = [*40..70]
    puts "The Casino will choose a number between 40 and 70.".yellow
    @player_number = @house_number.sample

    puts @player_number
    @house_number2 = [*1..100]
    puts "The Casino is going to place a concealed number between 1 and 100.".yellow
    puts "Place concealed number."
      @concealed_number = @house_number2.sample

    puts "Is the first number higher or lower than the concealed number?".yellow
    puts "Please enter 'high' or 'low'.".yellow
       answer = gets.strip.downcase
       odds(answer)
  end

      def odds(answer)
        case answer
        when "high"
          if @concealed_number > @player_number
            puts "The second number is: #{@concealed_number}"
            puts "YOU LOSE!".red
            `say you lose`
          elsif @concealed_number == @player_number
            puts "Your bet $#{@bet} is returned!"
            @player.wallet.amount += @bet
            puts "You now have $#{@player.wallet.amount}."
          else
            puts "The second number is: #{@concealed_number}"
            puts "YOU WIN!".green
            `say you win`
            puts "You won $#{@bet*2}!"
            @player.wallet.amount += @bet*2
            puts "You now have $#{@player.wallet.amount}."
           end
        when "low"
          if @concealed_number > @player_number
            puts "The second number is: #{@concealed_number}"
            puts "YOU WIN!".green
            `say you win`
            puts "You won $#{@bet*2}!"
          elsif @concealed_number == @player_number
            puts "Your bet is returned!"
            puts "Your bet $#{@bet} is returned!"
          else
            puts "The second number is: #{@concealed_number}"
            puts "YOU LOSE!".red
            `say you lose`
          end
        else
          puts "Invalid. Please try again."
          place_bet
        end
      menu
      end


end
