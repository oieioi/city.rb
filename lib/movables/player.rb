module City
  module Movables
    class Player

      def initialize name
        @name = name.to_s
      end

      def to_s
        '@'
      end
    end
  end
end
