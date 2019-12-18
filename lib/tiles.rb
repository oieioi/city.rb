module City
  module Tiles
    def self.factory(char)
      # TODO
      case char
      when '.' then Floor.new
      when '-' then WallUpper.new
      when '|' then WallSider.new
      when ']' then Grave.new
      else Empty.new
      end
    end
  end
end

Dir[File.expand_path('../tiles', __FILE__) << '/*.rb'].each do |file|
  require file
end
