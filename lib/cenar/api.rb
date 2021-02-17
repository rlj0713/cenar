
class Cenar::API
    attr_accessor :protein_options

    @@all = []

    def initialize
        @protein_options = ['Pork', 'Chicken', 'Beef', 'Vegetarian', 'Seafood']
    end

    def create_all_meals(protein_number)
        protein_number = (protein_number.to_i) - 1
        HTTParty.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=' + @protein_options[protein_number]).take(15).each do |meals|
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
                @recipe_id = HTTParty.get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + value).values[0][0].select { |k, v| k == "idMeal" }.values[0].to_i
            end
        end
        @recipe_id
    end

    def all
        @@all
    end

    def clear
        @@all = []
    end
end