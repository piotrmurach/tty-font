require 'tty-font'
require 'pastel'

pastel = Pastel.new
font = TTY::Font.new(:doom)

puts pastel.yellow(font.write("DOOM"))

puts font.write("ABCDEFGHIJKLMN")
puts font.write("OPQRSTUVWXYZ")

puts font.write("abcdefghijklmn")
puts font.write("opqrstuvwxyz")

puts font.write("0123456789")

puts font.write("!#\$%^&*()-_+=")

puts font.write("\"',.:;><?@][\\/")
