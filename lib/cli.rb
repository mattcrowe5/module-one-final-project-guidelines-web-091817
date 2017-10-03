class CLI

   def start_program
     puts "Welcome to Kegatron 5000!"
     puts "========================="
     puts "Main Menu"
     puts "========================="
     puts "1. View Beer Selection"
     puts "========================="
     puts "2. View My Favorites"
     puts "========================="
     puts "3. Add a Beer"
     puts "========================="
     puts "4. Exit"

     input = gets.chomp
     case input
     when 1
       #Call method to provide list of beers
     when 2
       #call method to view list of favorite beers
     when 3
       #Call method to add a beer
     when 4
       #Call method to end program
     end
   end

   def list_beers
     puts "Please select a beer by number"
     counter = 0
     Beer.all.each do |beer|
       counter += 1
       puts "#{counter}. #{beer.name}"
     end
   end




end
