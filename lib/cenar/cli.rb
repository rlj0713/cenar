
class Cenar::CLI
    def call
        puts ""
        puts "Good evening, what do you feel like eating for dinner?"
        puts "           _      "
        puts "          / )     "
        puts "    |||| / /      "
        puts "    ||||/ /     1 - Pork  "
        puts "    \\__(_/      2 - Chicken   "
        puts "     ||//       3 - Beef  "
        puts "     ||/        4 - Vegetables  "
        puts "     ||         5 - Seafood  "
        puts "    (||           "
        puts "     ''           "
        puts ""
        get_user_choice1                                                # User chooses their protein
        @api1 = Cenar::API.new                                          # A new instance of the API class is created
        break_space
        puts "#{get_meals_by_protein(@choice1)} dinner options:"        # The user's choice is confirmed
        puts ""
        @api1.create_all_meals(@choice1)                                # Print a list of recipes for the protein chosen
        @choice2 = get_user_choice2                                     # User chooses a recipe                                           
        recipe_number = @api1.get_recipe_id(@choice2)                   # User choice is converted into a recipe id number
        recipe1 = Cenar::Recipe.new(recipe_number)                      
        break_space
        puts "You have chosen #{recipe1.name}, great choice!"           # The user's choice is confirmed
        puts ""
        puts "Shopping List:"
        puts ""
        puts recipe1.shopping_list                                      # The appropriate shopping list is printed
        puts ""
        puts "Cooking Instructions:"
        puts ""
        puts recipe1.procedure                                          # The appropriate procedure is printed
        puts ""
        exit_pattern        
    end
    
    def get_user_choice1
        puts "Please enter a number (1 - 5) to make your selection."
        @choice1 = gets.chomp
        # binding.pry
        get_meals_by_protein(@choice1)
        puts ""
        @choice1
    end

    def break_space
        puts ""
        puts "------------------------------------------------------------------------------------------------"
        puts ""
    end

    def get_user_choice2
        puts ""
        puts "Please enter a recipe number to view the recipe & shopping list."
        @choice2 = gets.chomp               # Returns the number chosen by user as a string.    Ex. "11"
        # binding.pry
        @final = get_recipe_by_number(@choice2)     # Returns the number chosen by the user -1 as an integer.   Ex. 10
    end

    def get_meals_by_protein(user_choice) # list recipes_by_protein // Seems to be returning the correct string (when given a number in string format)
        user_choice = user_choice.to_i
        if user_choice > 0 && user_choice <= 5
            user_choice -= 1
            @proteins = ['Pork', 'Chicken', 'Beef', 'Vegetables', 'Seafood']    # Why is this needed in my code, but not referenced?
            selection = @proteins[user_choice]
            # binding.pry
        else
            get_user_choice1
        end
    end

    def get_recipe_by_number(user_choice2)
        user_choice2 = user_choice2.to_i
        if user_choice2 > 0 && user_choice2 <= 15
            user_choice2 -= 1
        else
            get_user_choice2
        end
    end

    def exit_pattern
        puts "Would you like look up another recipe? (yes / no)"
        again = gets.chomp
        if again == "yes" || again == "Yes" || again == "y" || again == "Y"
            @api1.clear                                           # <--------     This bug took a while, I wasn't clearing the array api.all and when I made
            call                                                                # multiple queries, the array was appended, which caused a my code to return 
        else                                                                    # recipes that I was not asking for.
            puts ""
            puts "Enjoy your meal!"
        end
    end
end