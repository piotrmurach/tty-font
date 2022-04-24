# frozen_string_literal: true

RSpec.describe TTY::Font, "#inspect" do
  it "inspects font instance" do
    font = described_class.new
    id = format("%x", font.object_id << 1)
    expect(font.inspect).to eq("#<TTY::Font:0x#{id} name=:standard, " \
                               "letter_spacing=0, char_height=6>")
  end

  it "aliases #to_s to #inspect" do
    font = described_class.new
    expect(font.method(:to_s)).to eq(font.method(:inspect))
  end
end
