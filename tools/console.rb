require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
startup1 = Startup.new("Startup 1", "Founder 1", "Domain 1")
startup2 = Startup.new("Startup 2", "Founder 2", "Domain 2")
startup3 = Startup.new("Startup 3", "Founder 3", "Domain 3")
startup4 = Startup.new("Startup 4", "Founder 4", "Domain 4")

vc1 = VentureCapitalist.new("VC 1", 10)
vc2 = VentureCapitalist.new("VC 2", 5000)
vc3 = VentureCapitalist.new("VC 3", 1000000001)
vc4 = VentureCapitalist.new("VC 4", 2000000000)

b1 = startup1.sign_contract(vc1, "type 1", 5)

b2a = startup2.sign_contract(vc2, "type 2a", 100)
b2b = vc3.offer_contract(startup2, "type 2b", 550)

b3a = startup3.sign_contract(vc3, "type 3a", 5555)
b3b = vc4.offer_contract(startup3, "type 3b", 100001)
b3c = startup3.sign_contract(vc1, "type 3c", 1)

b4a = startup4.sign_contract(vc2, "type 4a", 1000002)
b4b = vc3.offer_contract(startup4, "type 4b", 100001)
b4c = startup4.sign_contract(vc1, "type 4c", 2)
b4d = vc2.offer_contract(startup4, "type 4d", 1000000)
b4e = vc3.offer_contract(startup4, "type 4d", 8)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line