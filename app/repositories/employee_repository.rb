require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  # employeeRepository.new(csv)
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @employees
  end

  def find_by_username(username) # instance or nil
    @employees.find { |employee| employee.username == username }
  end

  def find(id) # return an instance or nil
    @employees.find { |employee| employee.id == id }
  end

  def all_delivery_guys # array
    @employees.select { |employee| employee.delivery_guy? }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end
end




