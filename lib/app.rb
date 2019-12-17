require 'io/console'
require_relative './movables/player'
require_relative './field'

module City
  class App
    INITIAL_TEXT = 'h: left, j: down, k: up, l: right, q: quit'.freeze
    def initialize
      @times = 0
      @player = Movables::Player.new('oieioi')
      @field = Field.new({ x: 2, y: 2, instance: @player })
      @text = INITIAL_TEXT

      disp

      loop {
        message = next_turn(input_command)
        @text = if message
                  message
                else
                  INITIAL_TEXT
                end
        disp
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
      else "#{command} is not valid command."
      end
    end

    def disp
      field = @field.to_s
      text = @text

      # clean console
      puts "\e[H\e[2J"

      print field
      print text
    end
  end
end
