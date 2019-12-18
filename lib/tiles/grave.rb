require_relative './absolute_tile'

module City
  module Tiles
    class Grave < AbsoluteTile
      def initialize
      end

      def to_s
        ']'
      end

      def collide?
        true
      end

      def collision_reason
        '墓だ'
      end
    end
  end
end
