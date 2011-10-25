
Dir["lib/tasks/**/*.rake"].each { |ext| load ext } if defined?(Rake)
require "candy-gem/artist_policy"

module Candy
  class Engine < Rails::Engine
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
