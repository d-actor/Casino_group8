class Wallet
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

end


def add(amount)
  @amount += amount
  puts "You have $#{@player.wallet.amount} in your wallet."
  
end 

def subtract(amount)
  @amount -= amount
  puts "You have $#{@player.wallet.amount} in your wallet."  
end




  #want a method to add/subtract from wallet amount
  #subtract bet amount from wallet total 
  #add winnings to wallet 
  #this can be used to add or remove bet amounts