
class Cenar::Meal
    attr_reader :recipe_id, :recipe_name
    
    def initialize(recipe_id, recipe_name)
        @recipe_id = recipe_id
        @recipe_name = recipe_name
        @full_hash = {}
        @procedure = nil
        @shopping_list = []
        @cuisine_nationality = nil
        @cuisine_video = nil
    end 

    # Returns the meal procedure as a string
    def procedure
        if @procedure == nil
            @procedure = get_hash["strInstructions"]
        end
        @procedure
    end

    # Returns the shopping list as an array
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

    # Returns the meal nationality as a string
    def cuisine_nationality
        if @cuisine_nationality == nil
            @cuisine_nationality = get_hash["strArea"]
        end
        @cuisine_nationality
    end

    # Returns the YouTube instructional link
    def cuisine_video
        if @cuisine_video == nil
            @cuisine_video = get_hash["strYoutube"]
        end
        @cuisine_video
    end

    # Returns the full hash of information for a meal
    def get_hash
        if @full_hash == {}
            @full_hash = Cenar::API.get_meal_info(@recipe_id)
        end
        @full_hash
    end
end
