class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def build_csv_row
    [@id, @name, @price]
  end

  def self.headers
    ['id', 'name', 'price']
  end
end

# meal.build_csv_row
