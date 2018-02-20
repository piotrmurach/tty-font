require 'pastel'
require_relative '../lib/tty-font'

pastel = Pastel.new
font = TTY::Font.new(:straight)

puts pastel.green(font.write('straight'))

puts font.write("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

puts font.write("abcdefghijklmnopqrstuvwxyz")

puts font.write("0123456789")

puts font.write("!#\$%^&*()-_+=")

puts font.write("\"',.:;><?][\\/}{|")
