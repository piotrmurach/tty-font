# frozen_string_literal: true

module TTY
  class Font
    # Represents font rendering result. It provides more
    # convenient interface for using the output.
    class Result
      include Enumerable

      def initialize
        @output = []
      end

      def each(&block)
        return to_enum(:each) unless block
        @output.each(&block)
      end

      def add(line)
        @output << line
      end
      alias << add

      def lines
        @output
      end

      def to_s
        @output.join("\n")
      end
    end
  end # Font
end # TTY
