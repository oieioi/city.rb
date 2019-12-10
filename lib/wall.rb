require_relative './tile'

module City
  class Wall < Tile
    def to_s
      '_'
    end
  end
end
