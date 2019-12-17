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

      disp

      loop {
        message = next_turn(input_command)
        disp(message)
      }
    rescue Interrupt
      puts 'end'
    end

    def disp_message
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

    def disp(message = nil)
      field = @field.to_s


      if message
        message.split("\n").each { |line|
          clean_console
          print field
          print "#{line} (enter some key)"
          input_command
        }
      end

      clean_console
      print field
      print INITIAL_TEXT
    end

    def clean_console
      puts "\e[H\e[2J"
    end
  end
end
