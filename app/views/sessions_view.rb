require_relative 'base_view'

class SessionsView < BaseView
  def wrong_credentials
    puts "Wrong username or password ⛔️"
  end

  def welcome_message(employee)
    puts "Welcome #{employee.username.capitalize}!"
  end
end
