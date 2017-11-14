require 'pry'
require_relative 'player'
require_relative 'wallet'




class HighLow
  attr_accessor :player 
  def initialize(player)
    @player = player
    menu
  end

  def menu
    puts "1) Place Bet"
    puts "2) Return to Casino"
    choice = gets.to_i
    if choice == 1
      place_bet
    elsif choice == 2
      
    else 
      puts "Invalid choice. Choose again."
      menu
    end
  end

  def place_bet
    puts "How much do you want to bet? ($#{@player.wallet.amount})"
    @bet = gets.to_f
    @player.wallet.amount -= @bet
    puts "You have ($#{@player.wallet.amount}) left."

    @house_number = [*1..100]
    puts "The Casino will choose a number between 1 and 100."
    @player_number = @house_number.sample
    
    puts @player_number
    puts "The Casino is going to place a concealed number between 1 and 100."
    puts "Place concealed number."
      @concealed_number = @house_number.sample
     
    puts "Is the first number higher or lower than the concealed number?"
    puts "Please enter 'high' or 'low'."
       answer = gets.strip.downcase
       odds(answer)
  end

      def odds(answer)
        case answer
        when "high" 
          if @concealed_number > @player_number
            puts "The second number is: #{@concealed_number}" 
            puts "YOU LOSE!"
          elsif @concealed_number == @player_number
            puts "Your bet ($#{@bet}) is returned!"
            @player.wallet.amount += @bet
            puts "You now have ($#{@player.wallet.amount})."
          else
            puts "The second number is: #{@concealed_number}"  
            puts "YOU WIN!"
            puts "You won ($#{@bet*2})!"
            @player.wallet.amount += @bet*2
            puts "You now have ($#{@player.wallet.amount})."
           end
        when "low" 
          if @concealed_number > @player_number
            puts "The second number is: #{@concealed_number}"
            puts "YOU WIN!"
            puts "You won ($#{@bet*2})!"
          elsif @concealed_number == @player_number
            puts "Your bet is returned!"
            puts "Your bet ($#{@bet}) is returned!"
          else
            puts "The second number is: #{@concealed_number}"  
            puts "YOU LOSE!"
          end
        else 
          puts "Invalid. Please try again."
          place_bet
        end
      menu
      end
    
  
end
 
player = Player.new
HighLow.new(player)