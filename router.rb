class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    puts "Welcome to the Restaurant!"
    puts "           --           "

    while @running
      @employee = @sessions_controller.create
      while @employee
        if @employee.manager?
          display_manager_tasks
          action = gets.chomp.to_i
          print `clear`
          route_manager_action(action)
        else
          display_delivery_tasks
          action = gets.chomp.to_i
          print `clear`
          route_delivery_action(action)
        end
      end
    end
  end

  private

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then logout
    when 0 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def route_delivery_action(action)
    case action
    when 9 then logout
    when 0 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def logout
    @employee = nil
  end

  def stop
    @running = false
    @employee = nil
  end

  def display_manager_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Add a new meal"
    puts "3 - List all customers"
    puts "4 - Add a new customer"
    puts "9 - Logout"
    puts "0 - Stop and exit the program"
  end

  def display_delivery_tasks
    puts ""
    puts "What do you want to do next?"
    puts "9 - Logout"
    puts "0 - Stop and exit the program"
  end
end
