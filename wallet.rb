class Wallet
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
    
  end

def self.add(amount)
  @amount += amount
  puts "You have $#{@player.wallet.amount} in your wallet."
end 

def self.subtract(amount)
  @amount -= amount
  puts "You have $#{@player.wallet.amount} in your wallet."  
end

end