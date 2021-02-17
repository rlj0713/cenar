
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

        user_choice_1                                                               # User chooses their protein
        @api1 = Cenar::API.new                                                      # A new instance of the API class is created
        break_space

        puts "#{get_meals_by_protein(@choice1)} dinner options:\n "                 # The user's choice is confirmed
        @api1.create_all_meals(@choice1)                                            # Print a list of recipes for the protein chosen
                                                                                  
        recipe1 = Cenar::Recipe.new(@api1.get_recipe_id(user_choice_2))             # User chooses a recipe and that recipe is converted into an id number                      
        break_space
        
        puts "You have chosen #{recipe1.name}, great choice!\n Shopping List:\n "   # The user's choice is confirmed
        recipe1.shopping_list                                                       # The appropriate shopping list & procedure are printed
        puts " \nCooking Instructions:\n "
        recipe1.procedure
        
        exit_pattern        
    end
    
    def user_choice_1
        puts "Please enter a number (1 - 5) to make your selection."
        @choice1 = gets.chomp
        get_meals_by_protein(@choice1)
        puts ""
    end
    
    def user_choice_2
        puts " \nPlease enter a recipe number to view the recipe & shopping list."
        @choice2 = gets.chomp                                                       # Returns the number chosen by user as a string.
        get_recipe_by_number(@choice2)                                              # Returns the number chosen by the user -1 as an integer.
    end

    def proteins
        @proteins = ['Pork', 'Chicken', 'Beef', 'Vegetables', 'Seafood']
    end
    
    def get_meals_by_protein(user_choice)
        user_choice = user_choice.to_i
        if user_choice > 0 && user_choice <= 5
            user_choice -= 1
            selection = self.proteins[user_choice]                                  # Can I make this refer to the api class and keep one array of proteins?
        else
            error_message
            user_choice_1
        end
    end
    
    def get_recipe_by_number(user_choice2)
        user_choice2 = user_choice2.to_i
        if user_choice2 > 0 && user_choice2 <= 15
            user_choice2 -= 1
        else
            error_message
            user_choice_2
        end
    end

    def error_message
        puts " \n***Unrecognized input, please try again***"
    end
    
    def break_space
        puts " \n------------------------------------------------------------------------------------------------\n "
    end
    
    def exit_pattern
        puts " \nWould you like look up another recipe? (yes / no)"
        yes_options = ["yes", "Yes", "y", "Y", "si", "Si"]
        if yes_options.include?(gets.chomp)
            @api1.clear                                                         # This bug took a while, I wasn't clearing the array api.all and when I made
            call                                                                # multiple queries, the array was appended, which caused a my code to return 
        else                                                                    # recipes that I was not asking for.
            puts " \nEnjoy your meal!"
        end
    end
end