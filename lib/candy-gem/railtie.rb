require 'candy-gem'
require 'rails'

module MyPlugin
  class Railtie < Rails::Railtie
    railtie_name :candy

    rake_tasks do
      load "lib/tasks/candy.rake"
    end
  end
end
