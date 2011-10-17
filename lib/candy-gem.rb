Dir["lib/tasks/**/*.rake"].each { |ext| load ext } if defined?(Rake)

module Candy
  class Engine < Rails::Engine
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end