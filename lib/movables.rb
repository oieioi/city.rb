module City
  module Movables
  end
end

Dir[File.expand_path('../movables', __FILE__) << '/*.rb'].each do |file|
  require file
end
