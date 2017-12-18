require 'pastel'
require 'tty-font'
require 'tty-cursor'
require 'tty-screen'

@pastel   = Pastel.new
@cursor   = TTY::Cursor
@font     = TTY::Font.new(:starwars)
@reg_font = TTY::Font.new(:straight)

def lines_at(lines, x, y)
  lines.each_with_index.reduce([]) do |acc, (line, i)|
    acc << @cursor.move_to(x - line.size/2, y - lines.size/2 + i) + line
    acc
  end
end

def paint_logo
  @size = TTY::Screen.size

  print @cursor.save
  print @cursor.clear_screen
  print @cursor.hide

  # ["2606".to_i(16)].pack("U*")
  stars = ['.', '*']

  (@size[1] + @size[0]).times do |i|
    print @cursor.move_to(rand(@size[1]), rand(@size[0])) + stars[rand(2)]
  end

  center_x = @size[1]/2
  center_y = @size[0]/2

  lines = @font.write('STAR').split("\n")
  print @pastel.red(lines_at(lines, center_x, center_y - 5).join)
  lines = @reg_font.write("THE    LAST    JEDI", space: 1).split("\n")
  print lines_at(lines, center_x, center_y).join
  lines = @font.write('WARS').split("\n")
  print @pastel.red(lines_at(lines, center_x, center_y + 4).join)
end

begin
  Signal.trap('SIGWINCH') { paint_logo }
  paint_logo
  $stdin.getc
ensure
  print @cursor.show
  print @cursor.clear_screen
  print @cursor.restore
end
