require_relative './absolute_tile'

module City
  module Tiles
    class Floor < AbsoluteTile
      def to_s
        '.'
      end
      def collide?
        false
      end
    end
  end
end
