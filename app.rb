# User Stories
# ✅ 1. As a user I can list all meals
# ✅ 2. As a user I can add a meal
# ✅ 3. As a user I can list all customers
# ✅ 4. As a user I can add a customer
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'router'

csv_file_path = File.join(__dir__, 'data/meals.csv')
meal_repository = MealRepository.new(csv_file_path)
meals_controller = MealsController.new(meal_repository)

csv_file_path = File.join(__dir__, 'data/customers.csv')
customer_repository = CustomerRepository.new(csv_file_path)
customers_controller = CustomersController.new(customer_repository)

csv_file_path = File.join(__dir__, 'data/employees.csv')
employee_repository = EmployeeRepository.new(csv_file_path)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run
