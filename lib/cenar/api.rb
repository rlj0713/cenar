
class Cenar::API
    @@url = "https://www.themealdb.com/api/json/v1/1/"
    @@protein_options = ['Pork', 'Chicken', 'Beef', 'Vegetarian', 'Seafood']

    def self.protein_options
        @@protein_options
    end

    # Given a protein_number, this returns an array of meal instances
    def self.list_meals(protein_number)
        tmp_meals = []
        HTTParty.get("#{@@url}filter.php?c=" + protein_options[protein_number])["meals"].take(15).each do |meal_info|
            tmp_meals << Cenar::Meal.new(meal_info["idMeal"], meal_info["strMeal"])
        end
        tmp_meals
    end

    # Given a meal_choice, this returns a meal_id hash
    def self.get_meal_info(meal_id)
        HTTParty.get("#{@@url}lookup.php?i=" + meal_id.to_s).values[0][0]
    end
end