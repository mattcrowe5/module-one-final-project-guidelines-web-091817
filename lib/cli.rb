class CLI

   def start_program
     puts "Welcome to Kegatron 5000!"
     puts "========================="
     puts "Please enter your name!"
     name = gets.chomp
     @user = User.find_or_create_by(name: name)
     main_menu
   end

   def main_menu
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
     when '1'
       list_beers
       user_beer_choice
       beer_details
     when '2'
       @user.list_favs
     when '3'
       add_new_beer
     when '4'
       exit
     else
       select_valid_option
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

   def user_beer_choice
     beer_choice = gets.chomp
     Beer.all.each do |beer|
       if beer_choice == beer.id
         @user_choice = beer
       end
     end
   end

   def beer_details
     puts "#{@user_choice.name}"
     puts "===================="
     puts "1. Recipe"
     puts "2. Description"
     puts "3. Add to Favorites"
     puts "4. Main Menu"

     beer_details_choice = gets.chomp

     case beer
     when 1
       puts "#{@user_choice.ingredients}"
     when 2
       puts "#{@user_choice.description}"
     when 3
       puts "#{@user.add_beer_to_favorites(@user_choice)}"
     when 4
       main_menu
     else
       select_valid_option
     end

   end


   def add_new_beer
     puts "Whats the name of your new beer?"
     beer_name = gets.chomp
     if Beer.list_beer_names.include?(beer_name)
       puts "That beer already exists!"
     else
       new_beer = Beer.create(name: beer_name)
     end
     puts "Please add description of new beer"
     response = gets.chomp
     new_beer.description = response
     main_menu
   end

   def select_valid_option
     puts "Please select a valid option"
   end





end
