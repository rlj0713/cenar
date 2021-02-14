
class Cenar::Recipe
    attr_accessor :name, :protein, :procedure, :shopping_list

    @@all = []
    
    def initialize(name)
        @name = name
        @protein = protein
        @procedure = procedure
        @shopping_list = shopping_list
        @@all << self
    end

    def show_recipes_by_protein
        input = gets.chomp
        puts @@all.select { |recipe| recipe.protein == user_input }

        # 1 - Pork https://www.themealdb.com/api/json/v1/1/filter.php?c=pork
        # 2 - Chicken https://www.themealdb.com/api/json/v1/1/filter.php?c=chicken
        # 3 - Beef https://www.themealdb.com/api/json/v1/1/filter.php?c=beef
        # 4 - Vegetarian https://www.themealdb.com/api/json/v1/1/filter.php?c=Vegetarian
        # 5 - Seafood https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood
    end

end