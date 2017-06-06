require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  attr_reader :pantry, :recipe

  def setup
    @pantry = Pantry.new
    @recipe = Recipe.new("Cheese Pizza")
  end

  def test_class_exists
    assert_instance_of Pantry, pantry
  end

  def test_empty_stock
    result = pantry.stock
    pantry_hash = {}

    assert_equal pantry_hash, result
  end

  def test_stock_check_soylant
    result = pantry.stock_check("Soylant")

    assert_equal 0, result
  end

  def test_stock_check_cheese
    result = pantry.stock_check("Cheese")

    assert_equal 0, result
  end

  def test_restock_cheese
    pantry.restock("Cheese", 20)
    result = pantry.stock_check("Cheese")

    assert_equal 20, result
  end

  def test_restock_more_cheese
    pantry.restock("Cheese", 50)
    result = pantry.stock_check("Cheese")

    assert_equal 50, result
  end

  def test_restocking_lots_of_cheese
    pantry.restock("Cheese", 5)
    pantry.restock("Cheese", 2)
    pantry.restock("Cheese", 1)
    result = pantry.stock_check("Cheese")

    assert_equal 8, result

  end

  def test_restocking_delicious_soylent
    pantry.restock("Soylant", 12)
    pantry.restock("Soylant", 12)
    pantry.restock("Soylant", 12)
    result = pantry.stock_check("Soylant")

    assert_equal 36, result
  end

  def test_recipe_is_working_with_pantry
    recipe.add_ingredient("Flour", 500)

    assert_equal 500, recipe.amount_required("Flour")
  end

  def test_recipe_format_before_conversation
    recipe.add_ingredient("Flour", 500)
    ingredients = {"Flour"=>500}

    assert_equal ingredients, recipe.ingredients
  end

  def test_recipe_format_many_items
    recipe.add_ingredient("Flour", 500)
    recipe.add_ingredient("Cheese", 200)
    recipe.add_ingredient("Love", 1500)
    ingredients = {"Flour"=>500, "Cheese"=>200, "Love"=>1500}

    assert_equal ingredients, recipe.ingredients
  end

  def test_correct_units_milli
    result = pantry.correct_units(0.005)

    assert_equal "Milli-Units", result
  end

  def test_correct_units_universal
    result = pantry.correct_units(5)

    assert_equal "Universal Units", result
  end

  def test_correct_units_centi
    result = pantry.correct_units(150)

    assert_equal "Centi-Units", result
  end

  def test_example_in_spec
    r = Recipe.new("Spicy Cheese Pizza")
    r.add_ingredient("Cayenne Pepper", 0.025)
    r.add_ingredient("Cheese", 75)
    r.add_ingredient("Flour", 500)
    result = pantry.convert_units(r)
    correct_output = {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
    "Cheese"         => {quantity: 75, units: "Universal Units"},
    "Flour"          => {quantity: 5, units: "Centi-Units"}}

    assert_equal correct_output, result

  end

  def test_different_conversion_example
    r = Recipe.new("Navy Food")
    r.add_ingredient("Glass", 0.025)
    r.add_ingredient("Dried Vomit", 75)
    r.add_ingredient("Vegemite", 500)
    result = pantry.convert_units(r)
    correct_output = {"Glass" => {quantity: 25, units: "Milli-Units"},
    "Dried Vomit"         => {quantity: 75, units: "Universal Units"},
    "Vegemite"          => {quantity: 5, units: "Centi-Units"}}

    assert_equal correct_output, result
  end
end
