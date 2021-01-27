require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def create
    # ask the user for username
    username = @sessions_view.ask_for('username')
    # ask the user for password
    password = @sessions_view.ask_for('password')
    # if username and password are correct
    # find the user from the repo with the given usename
    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      # do something
      @sessions_view.welcome_message(employee)
      return employee
    else
      # try signing in again
      # tell the user wrong credentials
      @sessions_view.wrong_credentials
      create
    end
  end
end
