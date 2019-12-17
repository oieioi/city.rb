module City
  module Movables
    class Dead
      def initialize(name, words)
        @name = name
        @words = words
      end

      def talk
        "#{@name}「#{@words}"
      end

      def to_s
        '&'
      end
    end
  end
end
