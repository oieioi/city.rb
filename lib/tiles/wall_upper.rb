require_relative './absolute_tile'

module City
  module Tiles
    class WallUpper < AbsoluteTile
      def initialize
      end

      def to_s
        '-'
      end

      def collide?
        true
      end

      def collision_reason
        '壁だ'
      end
    end
  end
end
