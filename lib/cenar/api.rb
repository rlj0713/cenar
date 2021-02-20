
class Cenar::API
    attr_reader :protein_options

    def initialize
        @protein_options = ['Pork', 'Chicken', 'Beef', 'Vegetarian', 'Seafood']
    end

    # This method returns a list of meal instances
    # @ return [Array] of meal instances given a protein choice
    def list_meals(protein_number)
        tmp_meals = []
        HTTParty.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=' + @protein_options[protein_number])["meals"].take(15).each do |meal_info|
            tmp_meals << Cenar::Meal.new(meal_info["idMeal"], meal_info["strMeal"])
        end
        tmp_meals
    end
end