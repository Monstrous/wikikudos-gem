
namespace :soniverse do
  namespace :artists do
    namespace :candy do
      desc 'Load the seed data from db/seeds.rb'
      task :seed => 'db:abort_if_pending_migrations' do
        seed_file = File.join(File.expand_path(File.join(File.dirname(__FILE__), '..', '..')), 'db', 'seeds.rb')
        load(seed_file) if File.exist?(seed_file)
      end
      
      desc 'print the gem root (helpfulish)' 
      task :print_root => 'db:abort_if_pending_migrations' do
        puts File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
      end
      
      desc 'Update the data from db/updates.rb'
      task :update => 'db:abort_if_pending_migrations' do
        seed_file = File.join(File.expand_path(File.join(File.dirname(__FILE__), '..', '..')), 'db', 'update.rb')
        load(seed_file) if File.exist?(seed_file)
      end
    end
  end
end
