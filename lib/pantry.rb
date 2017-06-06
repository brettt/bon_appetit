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
end

# pantry = Pantry.new
# # => <Pantry...>
#
# # Checking and adding stock
# pantry.stock
# # => {}
#
# pantry.stock_check("Cheese")
# # => 0
#
# pantry.restock("Cheese", 10)
# pantry.stock_check("Cheese")
# # => 10
#
# pantry.restock("Cheese", 20)
# pantry.stock_check("Cheese")
# # => 30
