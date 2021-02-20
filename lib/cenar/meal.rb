
class Cenar::Meal
    attr_reader :recipe_id, :recipe_name
    
    def initialize(recipe_id, recipe_name)
        @recipe_id = recipe_id
        @recipe_name = recipe_name
        @full_hash = {}
        @procedure = nil
        @shopping_list = []
        @cuisine_nationality = nil
    end 

    # Returns the meal procedure
    # @return [String] Meal procedure
    def procedure
        if @procedure == nil
            @procedure = get_hash["strInstructions"]
        end
        @procedure
    end

    # Returns the shopping list
    # @return [Array] Meal shopping_list
    def shopping_list
        if @shopping_list.empty?
            ingredient_names = get_hash.select { |k, v| k.include?("strIngredient")}.values
            ingredient_quantities = get_hash.select { |k, v| k.include?("strMeasure")}.values
            ingredient_quantities.zip(ingredient_names).each do |quantity, name|
                if name != nil && name.empty? == false
                    if quantity != " "
                        @shopping_list << "#{name}: #{quantity}"
                    else
                        @shopping_list << "#{name}"
                    end
                end
            end
        end
        @shopping_list
    end

    # Returns the meal nationality
    # @return [String] Meal nationality
    def cuisine_nationality
        if @cuisine_nationality == nil
            @cuisine_nationality = get_hash["strArea"]
        end
        @cuisine_nationality
    end

    private
    # Returns the meal hash given the recipe_id attr
    # @note Lazily GETs the meal information to reduce calls to the themealdb API which can be slow
    # @return [Hash] A hash containing meal details
    def get_hash
        if @full_hash.empty?
            @full_hash = HTTParty.get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + self.recipe_id.to_s).values[0][0]
        end
        @full_hash
    end
end
