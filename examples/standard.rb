require 'tty-font'
require 'pastel'

pastel = Pastel.new
font = TTY::Font.new(:standard)

puts pastel.green(font.write('standard'))

puts font.write("ABCDEFGHIJKLMN")
puts font.write("OPQRSTUVWXYZ")

puts font.write("abcdefghijklmnopqrstuvwxyz")

puts font.write("0123456789")

puts font.write("!#\$%^&*()-_+=")

puts font.write("\"',.:;><?@][\\/}{|")
