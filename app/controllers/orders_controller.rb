require_relative '../views/employees_view'
require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    # multiple views
    @meals_view = MealsView.new # already required in other controller
    @customers_view = CustomersView.new # already required in other controller
    @employees_view = EmployeesView.new
    @orders_view = OrdersView.new
  end

  def add
    meal = select_meal # returns a meal
    customer = select_customer
    employee = select_employee

    # create an instance of an order
    order = Order.new(
      meal: meal,
      customer: customer,
      employee: employee
    )
    # give to the order repository
    @order_repository.create(order)
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @orders_view.display(orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.my_undelivered_orders(employee)
    @orders_view.display(orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    index = @orders_view.ask_for('number').to_i - 1
    orders = @order_repository.my_undelivered_orders(employee)
    order = orders[index]
    @order_repository.mark_as_delivered(order)
  end

  private

  def select_meal
    # get the meals from the meal repository
    meals = @meal_repository.all
    # display the meals
    @meals_view.display(meals)
    # ask user for index of the meal
    index = @meals_view.ask_for('number').to_i - 1
    # get the meal from meals array using the index
    return meals[index]
  end

  def select_customer
    # get the customers from the customer repository
    # display the customers
    # ask user for index of the customer
    # get the customer from customers array using the index
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @customers_view.ask_for('number').to_i - 1
    return customers[index]
  end

  def select_employee
    # get the delivery_guys from the employee repository
    employees = @employee_repository.all_delivery_guys
    # display the delivery_guys
    @employees_view.display(employees)
    # ask user for index of the DG
    index = @employees_view.ask_for('number').to_i - 1
    # get the DG from DG array using the index
    return employees[index]
  end

end
