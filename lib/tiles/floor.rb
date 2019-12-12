require_relative './tile'

module City
  module Tiles
    class Floor < Tile

      def to_s
        '.'
      end
    end
  end
end
