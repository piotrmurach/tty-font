# frozen_string_literal: true

RSpec.describe TTY::Font, "#write" do
  let(:ascii_chars) { (32..126).map(&:chr).join }

  {
    "standard" => 6
  }.each do |name, height|
    it "writes supported ASCII characters in '#{name}' font" do
      font = described_class.new(name)
      output = font.write(ascii_chars)

      expect(output.lines.size).to eq(height)
    end
  end

  it "writes lowercase letters in 'standard' font" do
    font = described_class.new
    expect(font.write("abcde")).to eq([
      "          _                  _        ",
      "   __ _  | |__     ___    __| |   ___ ",
      "  / _` | | '_ \\   / __|  / _` |  / _ \\",
      " | (_| | | |_) | | (__  | (_| | |  __/",
      "  \\__,_| |_.__/   \\___|  \\__,_|  \\___|",
      "                                      "
    ].join("\n"))
  end

  it "writes uppercase letters in 'standard' font" do
    font = described_class.new
    expect(font.write("ABCDE")).to eq([
      "     _      ____     ____   ____    _____ ",
      "    / \\    | __ )   / ___| |  _ \\  | ____|",
      "   / _ \\   |  _ \\  | |     | | | | |  _|  ",
      "  / ___ \\  | |_) | | |___  | |_| | | |___ ",
      " /_/   \\_\\ |____/   \\____| |____/  |_____|",
      "                                          "
    ].join("\n"))
  end

  it "writes numbers in 'standard' font" do
    font = described_class.new
    expect(font.write("12345")).to eq([
      "  _   ____    _____   _  _     ____  ",
      " / | |___ \\  |___ /  | || |   | ___| ",
      " | |   __) |   |_ \\  | || |_  |___ \\ ",
      " | |  / __/   ___) | |__   _|  ___) |",
      " |_| |_____| |____/     |_|   |____/ ",
      "                                     "
    ].join("\n"))
  end

  it "writes special characters in 'standard' font" do
    font = described_class.new
    expect(font.write("*+,-.")).to eq([
      "                               ",
      " __/\\__    _                   ",
      " \\    /  _| |_       _____     ",
      " /_  _\\ |_   _|  _  |_____|  _ ",
      "   \\/     |_|   ( )         (_)",
      "                |/             "
    ].join("\n"))
  end

  it "writes text with space character in 'standard' font" do
    font = described_class.new
    expect(font.write("a b c d e")).to eq([
      "            _                      _          ",
      "   __ _    | |__       ___      __| |     ___ ",
      "  / _` |   | '_ \\     / __|    / _` |    / _ \\",
      " | (_| |   | |_) |   | (__    | (_| |   |  __/",
      "  \\__,_|   |_.__/     \\___|    \\__,_|    \\___|",
      "                                              "
    ].join("\n"))
  end

  it "writes text with :letter_spacing set at initialisation" do
    font = described_class.new(letter_spacing: 2)
    expect(font.write("abcde")).to eq([
      "            _                      _          ",
      "   __ _    | |__       ___      __| |     ___ ",
      "  / _` |   | '_ \\     / __|    / _` |    / _ \\",
      " | (_| |   | |_) |   | (__    | (_| |   |  __/",
      "  \\__,_|   |_.__/     \\___|    \\__,_|    \\___|",
      "                                              "
    ].join("\n"))
  end

  it "writes text with :letter_spacing set in a method call" do
    font = described_class.new
    expect(font.write("abcde", letter_spacing: 2)).to eq([
      "            _                      _          ",
      "   __ _    | |__       ___      __| |     ___ ",
      "  / _` |   | '_ \\     / __|    / _` |    / _ \\",
      " | (_| |   | |_) |   | (__    | (_| |   |  __/",
      "  \\__,_|   |_.__/     \\___|    \\__,_|    \\___|",
      "                                              "
    ].join("\n"))
  end

  it "writes text with space characters and :letter_spacing set" do
    font = described_class.new
    expect(font.write("ab cd e", letter_spacing: 2)).to eq([
      "            _                        _            ",
      "   __ _    | |__         ___      __| |       ___ ",
      "  / _` |   | '_ \\       / __|    / _` |      / _ \\",
      " | (_| |   | |_) |     | (__    | (_| |     |  __/",
      "  \\__,_|   |_.__/       \\___|    \\__,_|      \\___|",
      "                                                  "
    ].join("\n"))
  end

  it "writes text in 'doom' font" do
    font = described_class.new(:doom)
    expect(font.write("Doom")).to eq([
      "______                          ",
      "|  _  \\                         ",
      "| | | |  ___    ___   _ __ ___  ",
      "| | | | / _ \\  / _ \\ | '_ ` _ \\ ",
      "| |/ / | (_) || (_) || | | | | |",
      "|___/   \\___/  \\___/ |_| |_| |_|",
      "                                ",
      "                                "
    ].join("\n"))
  end

  it "raises when the font doesn't exist" do
    expect {
      described_class.new(:unknown)
    }.to raise_error(ArgumentError, "Font 'unknown.yml' not found")
  end

  it "raises when a character isn't supported" do
    font = described_class.new
    expect {
      font.write("みる")
    }.to raise_error(ArgumentError,
                     "Font standard doesn't support 'み' character")
  end
end
