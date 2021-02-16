
class Cenar::Recipe
    attr_accessor :recipe_id, :full_hash

    @@all = []
    
    def initialize(recipe_id)
        @recipe_id = recipe_id
        @full_hash = HTTParty.get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + self.recipe_id.to_s).values[0][0]
        @@all << self
    end

    def name
        @full_hash
        @name = @full_hash.select { |k, v| k == "strMeal" }
        @name = @name.values[0]
    end

    def procedure
        @instructions = @full_hash.select { |k, v| k == "strInstructions" }
        @instructions =  @instructions.values[0]
    end

    def shopping_list
        @list = @full_hash.select { |k, v| k.include?("strIngredient") && v != "" && v != nil}
        @list = @list.values
        
        @quantity = @full_hash.select { |k, v| k.include?("strMeasure") && v != "" && v != nil}
        @quantity = @quantity.values
        
        @merged = Hash[@list.zip(@quantity)]
        ap @merged, :indent => -2
    end

end