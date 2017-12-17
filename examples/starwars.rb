require 'tty-font'
require 'pastel'

pastel = Pastel.new
font = TTY::Font.new(:starwars)

puts pastel.red(font.write('starwars'))

puts font.write("ABCDEFGHIJKLMN")
puts font.write("OPRSTUVWXYZ")

puts font.write("abcdefghijklmn")
puts font.write("oprstuvwxyz")

puts font.write("0123456789")

puts font.write("!#\$%^&*()-_+=")

puts font.write("\"',.:;><?@][\\/}{|")
