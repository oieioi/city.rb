require 'io/console'
require_relative './player'
require_relative './field'

module City
  class App
    def initialize
      @times = 0
      @player = Player.new('oieioi')
      @field = Field.new({ x: 2, y: 2, instance: @player })

      print @field.to_s

      loop {
        next_turn input_command
        field_string = @field.to_s
        # clean console
        puts "\e[H\e[2J"
        print field_string
      }
    rescue Interrupt
      puts 'end'
    end

    def input_command
      STDIN.getch
    end

    def next_turn(command)
      case command.to_sym
      when :h then @field.player_go_left
      when :j then @field.player_go_down
      when :k then @field.player_go_up
      when :l then @field.player_go_right
      when :q then raise Interrupt
      #when :a then @player.action(@field)
      else puts 'not!'
      end
    end
  end
end
