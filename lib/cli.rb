class CLI
  attr_accessor :user_choice

   def start_program
     puts "Welcome to Kegatron 5000!"
     puts "========================="
     puts "Please enter your first name!"
     name = gets.chomp.downcase.capitalize
     @user = User.find_or_create_by(name: name)
     main_menu
   end

   def main_menu
     puts ""
     puts "Main Menu"
     puts "========================="
     puts "1. View Beer Selection"
     puts "========================="
     puts "2. View My Favorites"
     puts "========================="
     puts "3. Add a Beer"
     puts "========================="
     puts "4. Exit"
     puts "========================="

     input = gets.chomp
     case input
     when '1'
       list_beers
       user_beer_choice
       beer_details
     when '2'
       prompt_selection_of_beer_by_name
       list_favs
       user_favorite_beer_choice
       favorite_beer_details
     when '3'
       add_new_beer
     when '4'
       exit
     else
       select_valid_option
       main_menu
     end
   end

   def list_beers
     prompt_selection_of_beer_by_number
     counter = 0
     Beer.all.each do |beer|
       counter += 1
       puts "#{counter}. #{beer.name}"
     end
   end

   def user_beer_choice
     beer_choice = gets.chomp
     Beer.all.each do |beer|
       if beer_choice.to_i == beer.id
         @user_choice = beer
       end
     end
   end

   def beer_details
     puts ""
     puts "#{@user_choice.name}"
     puts "===================="
     puts "1. Recipe"
     puts "2. Description"
     puts "3. Add to Favorites"
     puts "4. Main Menu"

     beer_details_choice = gets.chomp

     case beer_details_choice
     when '1'
       print_ingredients
       beer_details_or_main_menu
     when '2'
       show_description
       beer_details_or_main_menu
     when '3'
       puts "#{@user.add_beer_to_favorites(@user_choice.name)}"
       main_menu
     when '4'
       main_menu
     else
       select_valid_option
       beer_details
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
     new_beer.save
     main_menu
   end

   def select_valid_option
     puts "Please select a valid option"
   end

   def print_ingredients
     puts ""
     puts "Ingredients"
     puts "============"
     counter = 0
     @user_choice.ingredients.each do |ingredient|
       counter +=1
       puts "#{counter}. #{ingredient.name}"
     end
   end

   def return_to_main_menu
     puts ""
     puts "Press 1 to go back to Main Menu"
     input = gets.chomp
     if input == '1'
       main_menu
     end
   end

   def beer_details_or_main_menu
     puts ""
     puts "Press 1 to go back to Main Menu, or 2 to go back to beer details"
     input = gets.chomp
     case input
     when '1'
       main_menu
     when '2'
       beer_details
     end
   end

   def favorite_details_or_main_menu
     puts ""
     puts "Press 1 to go back to Main Menu, or 2 to go back to beer details"
     input = gets.chomp
     case input
     when '1'
       main_menu
     when '2'
       favorite_beer_details
     end
   end

   def show_description
     puts ""
     puts "Description:"
     puts "#{@user_choice.description}"
   end

   def prompt_selection_of_beer_by_number
     puts ""
     puts "Please select a beer by number"
     puts ""
   end

   def prompt_selection_of_beer_by_name
     puts ""
     puts "Please select a beer by name"
   end

   def favorite_beer_details
     puts ""
     puts "#{@user_choice.name}"
     puts "===================="
     puts "1. Recipe"
     puts "2. Description"
     puts "3. Remove from Favorites"
     puts "4. Main Menu"

     beer_details_choice = gets.chomp

     case beer_details_choice
     when '1'
       print_ingredients
       favorite_details_or_main_menu
     when '2'
       show_description
       favorite_details_or_main_menu
     when '3'
       puts "#{@user.remove_beer_from_favorites(@user_choice.name)}"
       main_menu
     when '4'
       main_menu
     else
       select_valid_option
       favorite_beer_details
     end
   end

   def user_favorite_beer_choice
     beer_choice = gets.chomp
     Beer.all.each do |beer|
       if beer_choice.downcase == beer.name.downcase
         @user_choice = beer
       end
     end
   end

   def list_favs  #REVISIT
     puts "Favorite Beers"
     puts "==============="
     if @user.beers.count > 0
       @user.beers.each do |beer|
         puts "~ #{beer.name} ~"
       end
     elsif @user.beers.count == 0
       puts "You haven't saved any favorites yet!"
       main_menu
     end
   end



end
