
Dir["lib/tasks/**/*.rake"].each { |ext| load ext } if defined?(Rake)
require "wikikudos-gem/artist_policy"

module Wikikudos
  class Engine < Rails::Engine
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
