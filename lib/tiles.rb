module City
  module Tiles
  end
end

Dir[File.expand_path('../tiles', __FILE__) << '/*.rb'].each do |file|
  require file
end
