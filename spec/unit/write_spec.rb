RSpec.describe TTY::Font, '#write' do
  it "writes font lowercase characters out" do
    font = TTY::Font.new(:doom)
    expect(font.write('abcde')).to eq([
      "        _                _       ",
      "       | |              | |      ",
      "  __ _ | |__    ___   __| |  ___ ",
      " / _` || '_ \\  / __| / _` | / _ \\",
      "| (_| || |_) || (__ | (_| ||  __/",
      " \\__,_||_.__/  \\___| \\__,_| \\___|",
      "                                 ",
      "                                 ",
    ].join("\n"))
  end

  it "writes doom font digit characters out" do
    font = TTY::Font.new(:doom)
    expect(font.write('12345')).to eq([
      " __   _____  _____    ___  _____ ",
      "/  | / __  \\|____ |  /   ||  ___|",
      "`| | `' / /'    / / / /| ||___ \\ ",
      " | |   / /      \\ \\/ /_| |    \\ \\",
      "_| |_./ /___.___/ /\\___  |/\\__/ /",
      "\\___/\\_____/\\____/     |_/\\____/ ",
      "                                 ",
      "                                 ",
    ].join("\n"))
  end

  it "writes text with space in between letters" do
    font = TTY::Font.new(:doom)
    expect(font.write('ABC', letter_spacing: 2)).to eq([
     "  ___     ______    _____ ",
     " / _ \\    | ___ \\  /  __ \\",
     "/ /_\\ \\   | |_/ /  | /  \\/",
     "|  _  |   | ___ \\  | |    ",
     "| | | |   | |_/ /  | \\__/\\",
     "\\_| |_/   \\____/    \\____/",
     "                          ",
     "                          ",
    ].join("\n"))
  end

  it "allows for space character" do
    font = TTY::Font.new(:doom)
    expect(font.write('a b')).to eq([
      "         _     ",
      "        | |    ",
      "  __ _  | |__  ",
      " / _` | | '_ \\ ",
      "| (_| | | |_) |",
      " \\__,_| |_.__/ ",
      "               ",
      "               ",
    ].join("\n"))
  end

  it "raises when font doesn't exist" do
    expect {
      TTY::Font.new(:unknown)
    }.to raise_error(ArgumentError, /Font 'unknown.yml' not found/)
  end

  it "raises when character doesn't exist" do
    font = TTY::Font.new(:doom)
    expect {
      font.write("みる")
    }.to raise_error(ArgumentError, /Font doom doesn't support 'み' character/)
  end
end
