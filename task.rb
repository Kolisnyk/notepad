require 'date'

class Task < Post

  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts "Что запланировано сделать?"
    @text = STDIN.gets.chomp

    puts "Укажите срок выполнения задачи. (в формате ДД.ММ.ГГГГ, например 01.01.2017"
    input = STDIN.gets.chomp
    @due_date = Date.parse(input)

  end

  def to_strings
    time_string = "Запись создана: #{@created_at.strftime("%Y,%m,%d, %H:%M:%S")} \n\r \n\r"
    deadline = "Крайний срок: #{@due_date}"
    return [deadline, @text, time_string]
  end
end