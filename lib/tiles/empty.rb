require_relative './absolute_tile'

module City
  module Tiles
    class Empty < AbsoluteTile
      def to_s
        ' '
      end
      def collide?
        false
      end
    end
  end
end
