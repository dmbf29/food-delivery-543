require_relative 'base_view'

class MealsView < BaseView
  def display(meals) # array of instances
    if meals.any?
      meals.each_with_index do |meal, index|
        puts "#{index + 1}.) #{meal.name} - ¥#{meal.price}"
      end
    else
      puts "No meals yet 🍽"
    end
  end
end
