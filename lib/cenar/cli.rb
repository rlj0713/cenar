
class Cenar::CLI
    
    def call
        puts "                  "
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
        puts "                  "
        puts "Good evening, what do you feel like eating for dinner?"
        puts ""
        
        make_choice1        #User chooses their protein
        
        exit_pattern        
    end
    
    def make_choice1
        puts "Please enter a number (1 - 5) to make your selection."
        get_meals_by_protein(gets.chomp)
    end


    def get_meals_by_protein(user_choice) # list recipes_by_protein
        user_choice = user_choice.to_i
        if user_choice > 0 && user_choice <= 5
            user_choice -= 1
            @proteins = ['pork', 'chicken', 'beef', 'vegetables', 'seafood']    # @proteins is an instance variable (available in any method but only for this instance).
            selection = @proteins[user_choice]
            puts "You have selected #{selection}, excellent choice!"
        else
            make_choice1
        end
    end 

    def exit_pattern
        puts "Would you like look up another recipe? (yes / no)"
        again = gets.chomp
        if again == "yes" || again == "Yes" || again == "y" || again == "Y"
            call
        else
            puts "Enjoy your meal!"
        end
    end
end