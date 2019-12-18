require_relative './absolute_tile'

module City
  module Tiles
    class Exit < AbsoluteTile
      def to_s
        '*'
      end
      def collide?
        false
      end
    end
  end
end
