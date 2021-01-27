class Employee
  attr_reader :role, :username, :password

  def initialize(attributes = {})
    @id = attributes[:id]
    @role = attributes[:role]
    @username = attributes[:username]
    @password = attributes[:password]
  end

  def manager?
    @role == 'manager'
  end
end
