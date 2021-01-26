class BaseView
  def ask_for(thing)
    puts "What's the #{thing}?"
    gets.chomp
  end
end
