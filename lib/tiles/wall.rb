require_relative './absolute_tile'

module City
  module Tiles
    class Wall < AbsoluteTile
      def to_s
        '_'
      end
      def collide?
        true
      end
    end
  end
end
