require 'open-url'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'
data = JSON.parse(open(url).read)

data['drinks'].each do |drink|
    cocktail = Cocktail.create(name: drink['strDrink'])
    cocktail.save
    (0..15).each do |num|
      next if drink["strIngredient#{num}"].nil?

      ingredient_name = drink["strIngredient#{num}"]
      dose_description = drink["strMeasure#{num}"]

      ingredient = Ingredient.new(name: ingredient_name)
      ingredient.saveing
      ingredient = Ingredient.find_by(name: ingredient_name)

      dose = Dose.new(description: dose_description)

      dose.ingredient = ingredient
      dose.cocktail = cocktail
      dose.save
    end
  end

