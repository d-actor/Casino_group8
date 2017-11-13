require_relative 'player'

@house_number = *(1..100)

class HighLow
  attr_accessor :player 
  def initialize(player)
    @player = player
  end

  def game
    puts "Please choose a number between 1 and 100."
    gets.to_i
    puts "Casino: I am going to place a concealed number between 1 and 100."
    puts 
    house_number = @house_number.sample
    puts "Please place a bet."
    bet = gets.strip.to_i
    puts "Casino: Is the number I placed higher of lower than your number."

    end
   
  end


player = Player.new
HighLow.new(player)



  #have player choose a number between 1 and 100
  #give a number
  #have player guess if the number you presented is high or low
  #if correct win, if incorrect lose