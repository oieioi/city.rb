require_relative './tiles'
require_relative './field_reader'

module City
  class Field
    def initialize(player)
      @tiles = init_tiles
      @player = player[:instance]
      @player_position_x = player[:x]
      @player_position_y = player[:y]
    end

    def init_tiles(path = './lib//data/field.txt')
      FieldReader.read(path)
    end

    def [](x, y)
      if @tiles[x].nil?
        return nil
      end
      @tiles[x][y]
    end

    def find(instance)
      @tiles.each.with_index { |line, x|
        line.each.with_index {|tile, y|
          if tile == instance
            return { x: x, y: y }
          else
          end
        }
      }
      nil
    end

    def player_move(x, y)
      target_tile = self[x, y]
      return if target_tile.nil?
      return if target_tile.collide?

      @player_position_x = x
      @player_position_y = y
    end

    def player_go_down
      player_move(@player_position_x + 1, @player_position_y)
    end

    def player_go_up
      player_move(@player_position_x - 1, @player_position_y)
    end

    def player_go_right
      player_move(@player_position_x, @player_position_y + 1)
    end

    def player_go_left
      player_move(@player_position_x, @player_position_y - 1)
    end

    def to_s
      tiles = @tiles.map.with_index {|line, x|
        line.map.with_index { |tile, y|
          if @player_position_y == y && @player_position_x == x
            @player.to_s
          else
            tile.to_s
          end
        }.join
      }.join("\n")
      "#{tiles}\n"
    end
  end
end
