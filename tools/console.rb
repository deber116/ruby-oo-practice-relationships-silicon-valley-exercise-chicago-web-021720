require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

better = Startup.new("Better.com", "Vishal", "www.better.com")
roofstock = Startup.new("Roofstock", "Jeff", "www.roofstock.com")

vc1 = VentureCapitalist.new("Bob", 2000000000)
vc2 = VentureCapitalist.new("Steve", 1000000)

#funding1 = FundingRound.new(better,vc1,"Series A",100.0)

roofstock_funding = roofstock.sign_contract(vc2,"Series C", 100000.0)
roofstock_funding2 = roofstock.sign_contract(vc1,"Series D", 2000000.0)
roofstock_funding3 = roofstock.sign_contract(vc1,"Series E", 5000000.0)

better_funding1 = better.sign_contract(vc2,"Series C", 1000000.0)
better_funding2 = better.sign_contract(vc2,"Series D", 1000000.0)

vc1.offer_contract(better,"Series A",20000000000000.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line