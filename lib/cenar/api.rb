
class Cenar::API
    attr_accessor :protein_options

    @@all = []

    def initialize
        @protein_options = ['Pork', 'Chicken', 'Beef', 'Vegetarian', 'Seafood']
    end

    def all
        @@all
    end

    def clear
        @@all = []
    end

    def create_all_meals(protein_number)
        protein_number = protein_number.to_i
        protein_number -= 1
        all_meals = HTTParty.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=' + @protein_options[protein_number])
        all_meals.take(15).each do |meals|
            i = 1
            meals[1].take(15).each do |recipe_hashes|
                puts "#{i}. - #{recipe_hashes.values[0]}"
                i += 1
                @@all << recipe_hashes
            end
        end
    end

    def get_recipe_id(recipe_choice)
        @@all[recipe_choice].select do |key, value|
            if key == "idMeal"
                @detail = HTTParty.get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + value)
                @detail = @detail.values
                @meal_id = @detail[0][0].select { |k, v| k == "idMeal" }
                @meal_id = @meal_id.values[0].to_i
                return @meal_id                                                     # This returns the meal ID based on the user choice. Also, I know
            end                                                                     # Avi said never do this. How can I change this to be better?
        end
    end
end