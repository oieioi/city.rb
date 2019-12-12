require_relative './tiles.rb'

module City
  class Field
    def initialize(player, x = 25, y = 25)
      @tiles = x.times.map { [] }
      @tiles.map! { [Tiles::Wall.new] + y.times.map { |y| Tiles::Floor.new } + [Tiles::Wall.new] }
      @tiles.unshift([Tiles::Wall.new] + y.times.map { |y| Tiles::Wall.new } + [Tiles::Wall.new])
      @tiles.push( [Tiles::Wall.new] + y.times.map { |y| Tiles::Wall.new } + [Tiles::Wall.new] )
      @player = player[:instance]
      @player_position_x = player[:x]
      @player_position_y = player[:y]
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

    def move_player(x, y)
      @player_position_x = x
      @player_position_y = y
    end

    def player_go_down
      @player_position_x += 1
    end

    def player_go_up
      @player_position_x -= 1
    end

    def player_go_right
      @player_position_y += 1
    end

    def player_go_left
      @player_position_y -= 1
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
