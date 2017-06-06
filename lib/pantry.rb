require_relative 'recipe'

class Pantry

  attr_accessor :stock, :shopping_list

  def initialize
    @stock = {}
    @shopping_list = {}
  end

  def stock_check(item)
    stock[item].nil? ? 0 : stock[item]
  end

  def restock(item, quantity)
    stock[item] ||= 0
    stock[item] += quantity
  end

  def convert_units(recipe)
    recipe.ingredients.each_pair do |item, quantity|
      recipe.ingredients[item] = {quantity: correct_quantity(quantity), units: correct_units(quantity)}
    end
  end

  def correct_quantity(quantity)
    if quantity < 1
      quantity.to_f * 1000
    elsif quantity > 1 && quantity < 100
      quantity
    elsif quantity > 100
      quantity / 100
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

#not adding values
  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |item, quantity|
      shopping_list[item] ||= 0
      shopping_list[item] += quantity
    end
  end

  def print_shopping_list
    shopping_list.each {|item, quantity| puts "* #{item}: #{quantity}"}
  end
end
