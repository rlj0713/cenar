
class Cenar::CLI
    def call
        puts " \nGood evening, what do you feel like eating for dinner?\n "
        puts "           _      "
        puts "          / )     "
        puts "    |||| / /      "
        puts "    ||||/ /     1 - Pork  "
        puts "    \\__(_/      2 - Chicken   "
        puts "     ||//       3 - Beef  "
        puts "     ||/        4 - Vegetables  "
        puts "     ||         5 - Seafood  "
        puts "    (||           "
        puts "     ''           \n "


        # User selects a meal category
        while true
            puts "Please enter a number (1 - 5) to make your selection."
            protein_category_choice = gets.chomp.to_i - 1
            protein_category_choice < 0 || protein_category_choice >= 5 ? print_error_message : break
        end

        print_break_space

        # Print meals from that category
        puts "#{Cenar::API.protein_options[protein_category_choice]} dinner options:\n "
        
        # User selects a meal number
        meals = Cenar::API.list_meals(protein_category_choice)
        meals = Cenar::API.list_meals(protein_category_choice)
        
        # A list of meals is printed
        meals.each_with_index do |meal, index|
            puts "#{index + 1}.  #{meal.recipe_name}"
        end
        
        # User selects a meal from the list
        while true
            puts " \nPlease enter a recipe number to view the recipe & shopping list."
            meal_choice = gets.chomp.to_i - 1
            meal_choice < 0 || meal_choice >= 15 ? print_error_message : break
        end

        print_break_space
        
        # Meal header is printed
        puts "You have seleced #{meals[meal_choice].recipe_name}, great choice!"
        puts "Recipe Nationality - #{meals[meal_choice].cuisine_nationality}\n "
        puts "How-to-Video - #{meals[meal_choice].cuisine_video}"
        
        # Shopping list is printed
        puts "Shopping List:"
        meals[meal_choice].shopping_list.each do |item|
            puts "     \u2022 #{item}"
        end
        
        # Recipe procedure is printed
        puts " \n  Recipe Procedure:"
        puts "#{meals[meal_choice].procedure}"
    end
    
    def print_error_message
        puts " \n***Unrecognized input, please try again***"
    end
    
    def print_break_space
        puts " \n------------------------------------------------------------------------------------------------\n "
    end
    
end