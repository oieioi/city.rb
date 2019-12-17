require_relative './tiles'

module City
  class FieldReader
    def self.read(file_path)
      result = nil

      File.open(file_path) do |file|
        result = file.each_line.map do |line|
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
