# frozen_string_literal: true

require 'pathname'
require 'yaml'

require_relative 'font/version'

module TTY
  class Font
    FONTS_PATH = Pathname.new(::File.join(__dir__, 'font'))

    def initialize(font = :standard, **options)
      @font  = font
      @data  = load_font(FONTS_PATH.join("#{font}.yml"))
      @space = options.fetch(:letter_spacing) { 0 }
    end

    # Write text in a font format
    #
    # @param [String] text
    #   the text to convert to font format
    #
    # @api public
    def write(text, **options)
      output = []
      chars = text.chars
      space = options.fetch(:letter_spacing) { @space }
      indexes = words_boundary_indexes(text)

      @data['char_height'].times do |line|
        output << add_line(chars, indexes, line, space)
      end

      output.join("\n")
    end

    # Inspect font attributes
    #
    # @api public
    def inspect
      vars = [
        "name=#{@font.inspect}",
        "letter_spacing=#{@space}",
        "char_height=#{@data['char_height']}"
      ]
      '#<%s:0x%x %s>' % [self.class, (object_id << 1), vars.join(', ')]
    end
    alias to_s inspect

    private

    # Add new line to output
    #
    # @api private
    def add_line(chars, indexes, line, space)
      chars.each_with_index.reduce([]) do |acc, (char, indx)|
        if @data['chars'].key?(char)
          acc << @data['chars'][char][line]
          acc << ' ' * space if space > 0 && !indexes.include?(indx)
        else
          raise ArgumentError, "Font #{@font} doesn't support '#{char}' character"
        end
        acc
      end.join
    end

    # Search for all word right boundary indexes
    #
    # @return [Array[Integer]]
    #
    # @api private
    def words_boundary_indexes(str)
      str.scan(/\b\w+\b/).map { |w| str.index(w) + w.size - 1 }
    end

    # Load font if present
    #
    # @param [String] font_path
    #   The path to font location
    #
    # @api private
    def load_font(font_path)
      YAML.load_file(font_path)
    rescue Errno::ENOENT
      raise ArgumentError, "Font '#{File.basename(font_path)}' not found"
    end
  end # Font
end # TTY
