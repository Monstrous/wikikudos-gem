require 'wikikudos-gem'
require 'rails'

module MyPlugin
  class Railtie < Rails::Railtie
    railtie_name :wikikudos

    rake_tasks do
      load "lib/tasks/wikikudos.rake"
    end
  end
end
