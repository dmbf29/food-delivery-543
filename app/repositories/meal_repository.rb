require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

# borrows some methods from the base
class MealRepository < BaseRepository
  # MealRepository.new(csv)
  def build_element(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end

end




