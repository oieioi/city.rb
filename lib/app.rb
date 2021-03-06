require 'io/console'
require_relative './movables/player'
require_relative './field'

module City
  class App
    INITIAL_TEXT = 'h: left, j: down, k: up, l: right, q: quit'.freeze

    def initialize
      @times = 0
      @player = Movables::Player.new('you')
      @field = Field.new({ x: 2, y: 2, instance: @player })

      disp

      loop {
        message = next_turn(input_command)
        disp(message)
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
      when :u then @field.player_go_up_right
      when :y then @field.player_go_up_left
      when :n then @field.player_go_down_right
      when :b then @field.player_go_down_left
      when :x then @field.player_do
      when :q then raise Interrupt
      else "#{command} is not valid command."
      end
    end

    def disp(message = nil)
      field = @field.to_s

      if message
        disp_message(message, field)
      end

      clean_console
      print field
      print INITIAL_TEXT
    end

    def clean_console
      puts "\e[H\e[2J"
    end

    def disp_message(message, field)
      lines = message.split("\n")
      lines << ""
      lines.each_cons(2) { |line, next_line|
        clean_console
        print field
        if next_line.empty?
          print "#{line} -- press any key --"
        else
          print "#{line} -- continue --"
        end
        input_command
      }
    end
  end
end
