
namespace :soniverse_artists
  namespace :candy do
    desc 'Load the seed data from db/seeds.rb'
    task :seed => 'db:abort_if_pending_migrations' do
      seed_file = File.join(#{root}, 'db', 'seeds.rb')
      load(seed_file) if File.exist?(seed_file)
    end
  end
end