require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'high_low'

class Casino
  attr_accessor :player, :options
 
  def initialize
    puts "Welcome to the Ruby Casino!"
    @player = Player.new
    @options = ["High/Low", "Exit"]
    menu
  end

  def menu
    @options.each_with_index { |opt, i| puts "#{i + 1}) #{opt}" }
    choice = gets.to_i - 1 
    case choice
      when 0 
        HighLow.new(@player)
      when 1
        puts "Come again."
        exit 
      else
        puts "Invalid choice."
        menu
      end
      menu
  end
end

Casino.new
