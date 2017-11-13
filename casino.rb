require 'pry'
require 'colorize'

class Casino
  def initialize
    puts "Welcome to the Ruby Casino!"
    puts "What is your name, player?"
    name = gets.strip
    # create a new player instance and probably get the name
    # in the players initialize
  end
end

Casino.new
