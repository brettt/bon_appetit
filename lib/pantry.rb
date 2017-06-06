require_relative 'recipe'

class Pantry

  attr_accessor :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    stock[item].nil? ? 0 : stock[item]
  end

  def restock(item, quantity)
    stock[item] ||= 0
    stock[item] += quantity
  end

#{"Flour"=>500, "Cheese"=>200, "Love"=>1500}
#needs to be:
#=> {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
  def convert_units(recipe)
    recipe.for_each do |item, quantity|

    end

  end

  def correct_units(quantity)
    if quantity < 1
      "Milli-Units"
    elsif quantity > 1 && quantity < 100
      "Universal Units"
    elsif quantity > 100
      "Centi-Units"
    end
  end
end

#Centi-Units -- Equals 100 Universal Units
#Milli-Units -- Equals 1/1000 Universal Units
=begin
Then, we'll add a new method, `convert_units`, which takes a `Recipe` and outputs updated units for it following these rules:

1. If the recipe calls for more than 100 Units of an ingredient, convert it to Centi-units
2. If the recipe calls for less than 1 Units of an ingredient, convert it to Milli-units

# Convert units for this recipe

pantry.convert_units(r)

=> {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
    "Cheese"         => {quantity: 75, units: "Universal Units"},
    "Flour"          => {quantity: 5, units: "Centi-Units"}}
=end
