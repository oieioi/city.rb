require_relative './tiles'
require_relative './field_reader'
require_relative './movables'

module City
  class Field
    def initialize(player)
      @tiles = init_tiles
      @movables = init_movables
      @player = player[:instance]
      @player_position_x = player[:x]
      @player_position_y = player[:y]
    end

    def init_tiles(path = './lib//data/field.txt')
      FieldReader.read_tiles(path)
    end

    def init_movables(path = './lib/data/field.txt')
      FieldReader.read_movables(path)
    end

    def [](x, y)
      return nil if x.negative? || y.negative?
      return nil if @tiles[x].nil?

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

    def player_move_or_talk(x, y)
      target_tile = self[x, y]
      return if target_tile.nil?
      if target_tile.collide?
        return target_tile.collision_reason
      end

      target_movable = movables(x, y)
      if target_movable
        return target_movable.talk
      end

      # move
      @player_position_x = x
      @player_position_y = y
      nil
    end

    def player_go_down
      player_move_or_talk(@player_position_x + 1, @player_position_y)
    end

    def player_go_up
      player_move_or_talk(@player_position_x - 1, @player_position_y)
    end

    def player_go_right
      player_move_or_talk(@player_position_x, @player_position_y + 1)
    end

    def player_go_left
      player_move_or_talk(@player_position_x, @player_position_y - 1)
    end
    def player_go_up_right
      player_move_or_talk(@player_position_x - 1, @player_position_y + 1)
    end
    def player_go_up_left
      player_move_or_talk(@player_position_x - 1, @player_position_y - 1)
    end
    def player_go_down_right
      player_move_or_talk(@player_position_x + 1, @player_position_y + 1)
    end
    def player_go_down_left
      player_move_or_talk(@player_position_x - 1, @player_position_y + 1)
    end




    def movables(x, y)
      @movables.each do |m|
        if m[:x] == x && m[:y] == y
          return m[:instance]
        end
      end
      nil
    end

    def to_s
      tiles = @tiles.map.with_index {|line, x|
        line.map.with_index { |tile, y|
          if @player_position_y == y && @player_position_x == x
            @player.to_s
          elsif movable = movables(x, y)
            movable.to_s
          else
            tile.to_s
          end
        }.join
      }.join("\n")
      "#{tiles}\n"
    end
  end
end
