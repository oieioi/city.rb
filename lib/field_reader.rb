require_relative './tiles'

module City
  class FieldReader
    def self.read_tiles(file_path)
      result = nil

      File.open(file_path) do |file|
        result = file.each_line.map do |line|
          break if line == 'END'
          line.each_char.map { |char| make_tile(char)}
        end
      end

      result
    end

    def self.read_movables(file_path)
      result = nil

      File.open(file_path) do |file|
        result = file.each_line.map do |line|
          break if line == 'TILES_END'
          break if line == 'TILES_END'
          line.each_char.map { |char| make_tile(char)}
        end
      end

      result
    end

    def self.make_tile(char)
      Tiles.factory(char)
    end
  end
end
