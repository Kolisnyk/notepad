#encoding UTF-8 for using russian letters with Windows

if (Gem.win_platform?)
  Encoding.default.external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'post.rb'
require_relative 'link.rb'
require_relative 'memo.rb'
require_relative 'task.rb'

puts "Добрый день! Добро  пожаловать в приложение \"Блокнот\""
puts "Что Вы хотите записать в блокнот?"

choices = Post.post_types
choice = -1
until choice>=0 && choice < choices.size

  choices.each_with_index do |type, index|
    puts "\t#{index}/ #{type}"
  end
  choice = STDIN.gets.chomp.to_i
end

entry = Post.create(choice)

entry.read_from_console

entry.save

puts "Ваша запись сохранена."

