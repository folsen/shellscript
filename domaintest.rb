#!/usr/bin/env ruby
class DomainTest
 chars = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
 puts "What domain? (.se/.com)"
 top = gets.chomp!
 
 if top == ".se" then
  looking_for = "state"	#om det är .se ska den försöka hitta state raden
 elsif top == ".com" then 	#om det är .com ska den försöka hitta Domain Name raden
  looking_for = "Domain\ Name"
 else
  top = ".se"
  looking_for = "state"	#om inte .com eller .se är angivet ska den automatiskt leta efter .se
 end
 
 k = 0
 while k < chars.length do
  i = 0
  while i < chars.length do
   domain = chars[k] + chars[i] + top
   if %x{whois #{domain} | grep "#{looking_for}" } == "" then
    puts domain + " is available!"		#om den inte hittade någon info är den ledig
   end
   i = i + 1
  end
  k = k + 1
 end
end