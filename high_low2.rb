require 'pry'
require_relative 'player'




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
      Casino
    else 
      puts "Invalid choice. Choose again."
      menu
    end
  end

  def place_bet
    @house_number = [*1..100]
    puts "The Casino will choose a number between 1 and 100."
    @player_number = @house_number.sample
    
    puts @player_number
    puts "The Casino is going to place a concealed number between 1 and 100."
    puts "Place concealed number."
      @concealed_number = @house_number.sample
    #puts "Please place a bet."
      #bet = gets.to_i
    puts "Is the concealed number is higher or lower than the first number."
    puts "Please enter 'high' or 'low'."
       @answer = gets.strip.downcase
       odds(@answer)
       
       
      # odds(answer)
      #  if answer.downcase == "high"
      #   odds
      #  elsif answer.downcase == "low"
      #   odds
      #  else 
      #   puts "Invalid answer. Please try again."
      #   place_bet
      #  end

      def odds
        puts @answer
        case @answer
        when  'high' && @concealed_number > @player_number
          puts "YOU LOSE!"
        when  'high' && @concealed_number < @player_number 
          puts "YOU WIN!"
        when  'low' && @concealed_number > @player_number
          puts "YOU WIN!"
        when 'low' && @concealed_number < @player_number
          puts "YOU LOSE!"
        else 
          puts "Invalid. Please try again."
        game
      end
      game
    end
    
  end
end
 


  player = Player.new
  HighLow.new(player)


  
  