require_relative './tile'

module City
  module Tiles
    class Wall < Tile
      def to_s
        '_'
      end
    end
  end
end
