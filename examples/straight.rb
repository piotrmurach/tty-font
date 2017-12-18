require 'tty-font'
require 'pastel'

pastel = Pastel.new
font = TTY::Font.new(:straight)

puts pastel.green(font.write('straight'))

puts font.write("ABCDEFGHIJKLMNOPRSTUVWXYZ")

puts font.write("abcdefghijklmnoprstuvwxyz")

puts font.write("0123456789")

puts font.write("!#\$%^&*()-_+=")

puts font.write("\"',.:;><?][\\/}{|")
