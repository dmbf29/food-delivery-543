require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # get all the customers from the repo
    customers = @customer_repository.all # array of instances
    # tell the view diplay the customers
    @customers_view.display(customers)
  end

  def add
    # tell the view to ask for the name
    name = @customers_view.ask_for('name')
    # tell the view to ask for the address
    address = @customers_view.ask_for('address')
    # create a new customer instance
    customer = Customer.new(name: name, address: address)
    # give the customer to the repository
    @customer_repository.create(customer)
  end
end
