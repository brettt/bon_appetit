require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  attr_reader :pantry

  def setup
    @pantry = Pantry.new
  end

  def test_class_exists
    assert_instance_of Pantry, pantry
  end

  def test_return_stock
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

  def test_restocking_soylent
    pantry.restock("Soylant", 12)
    pantry.restock("Soylant", 12)
    pantry.restock("Soylant", 12)
    result = pantry.stock_check("Soylant")

    assert_equal 36, result
  end

end
