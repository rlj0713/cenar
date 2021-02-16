
class Cenar::API

    @@all = []

    def create_all_meals(protein_number)
        
        protein_options = ['pork', 'chicken', 'beef', 'vegetarian', 'seafood']
          
        protein_number = protein_number.to_i
        protein_number -= 1
        all_meals = HTTParty.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=' + protein_options[protein_number])
        all_meals.each do |meals|
            i = 1
            meals[1].take(15).each do |recipe_hashes|
                puts "#{i}. - #{recipe_hashes.values[0]}"
                i += 1
                @@all << recipe_hashes    
            end
            # binding.pry
        end
    end

    def get_recipe_id(recipe_choice)
        # cenar2 = Cenar::Recipe.new("test1")
        recipe_choice = recipe_choice.to_i
        @@all[recipe_choice].select do |key, value|
            if key == "idMeal"
                @detail = HTTParty.get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + value)
                @detail = @detail.values
                @meal_id = @detail[0][0].select { |k, v| k == "idMeal" }
                @meal_id = @meal_id.values[0].to_i
                return @meal_id  #This returns the meal ID based on the user choice. Also, I know Avi said never do this. How can I change this to be better?
            end
        end
    end
end