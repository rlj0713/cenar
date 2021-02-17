
class Cenar::Recipe
    attr_accessor :recipe_id, :full_hash
    
    def initialize(recipe_id)
        @recipe_id = recipe_id
        @full_hash = HTTParty.get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + self.recipe_id.to_s).values[0][0]
    end

    def name                                                                                            #Returns the recipe name
        @name = @full_hash.select { |k, v| k == "strMeal" }.values[0]
    end

    def procedure                                                                                       #Prints a recipe procedure
        @instructions = @full_hash.select { |k, v| k == "strInstructions" }
        puts @instructions.values[0]
    end

    def shopping_list                                                                                   #Prints a shopping list
        @list = @full_hash.select { |k, v| k.include?("strIngredient") && v != "" && v != nil}.values
        @quantity = @full_hash.select { |k, v| k.include?("strMeasure") && v != " " && v != nil}.values
        Hash[@list.zip(@quantity)].each { |k, v| puts "     \u2022 #{v} #{k}" }
    end
end