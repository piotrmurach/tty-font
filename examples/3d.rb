require 'pastel'
require_relative '../lib/tty-font'

pastel = Pastel.new
font = TTY::Font.new("3d")

puts pastel.green(font.write('3d'))

puts font.write("ABCDEFGHIJKLMN")
puts font.write("OPQRSTUVWXYZ")

puts font.write("abcdefghijklmn")
puts font.write("opqrstuvwxyz")

puts font.write("0123456789")

puts font.write("!#\$%^&*()-_+=")

puts font.write("\"',.:;><?@][\\/}{|")
