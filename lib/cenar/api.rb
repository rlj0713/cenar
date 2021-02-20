
class Cenar::API
    @@url = "https://www.themealdb.com/api/json/v1/1/"
    @@protein_options = ['Pork', 'Chicken', 'Beef', 'Vegetarian', 'Seafood']

    def self.protein_options
        @@protein_options
    end

    # This method returns a list of meal instances
    # @param [Numeric] protein_number is the index value of @protein_options
    # @return [Array] of meal instances given a protein choice
    def self.list_meals(protein_number)
        tmp_meals = []
        HTTParty.get("#{@@url}filter.php?c=" + protein_options[protein_number])["meals"].take(15).each do |meal_info|
            tmp_meals << Cenar::Meal.new(meal_info["idMeal"], meal_info["strMeal"])
        end
        tmp_meals
    end

    # Returns a hash for the meal_id
    # @param [Numeric] meal_choice is the id number for a specific recipe
    # @return [Hash] of details for the meal chosen
    def self.get_meal_info(meal_id)
        HTTParty.get("#{@@url}lookup.php?i=" + meal_id.to_s).values[0][0]
    end
end