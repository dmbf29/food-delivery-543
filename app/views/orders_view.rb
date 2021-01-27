require_relative 'base_view'

class OrdersView < BaseView
  def display(orders) # array of instances
    if orders.any?
      orders.each_with_index do |order, index|
        puts "#{index + 1}.) Meal: #{order.meal.name} - Customer: #{order.customer.name} Driver: #{order.employee.username}"
      end
    else
      puts "No orders yet 🚚"
    end
  end
end
