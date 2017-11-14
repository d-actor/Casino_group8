require_relative 'card'

class Deck
 # Getter and Setter methods for rank, suit and color
 attr_accessor :cards

 # Gets called when you call the new method to create an instance
 # deck = Deck.new
 def initialize
   @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
   @suits = %w(Spades Diamonds Clubs Hearts)
   @value = [
     {"A" => 1},
     {"2" => 2},
     {"3" => 3},
     {"4" => 4},
     {"5" => 5},
     {"6" => 6},
     {"7" => 7},
     {"8" => 8},
     {"9" => 9},
     {"10" => 10},
     {"J" => 10},
     {"Q" => 10},
     {"K" => 10},
   ]
   @cards = []
   generate_deck
 end

 def shuffle_cards
  @cards.shuffle
 end

 def generate_deck
   @suits.each do |suit|
     @ranks.size.times do |i|
       # Ternary Operator
       color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red'
       @cards << Card.new(@ranks[i], suit, color)
     end
   end
 end
end
