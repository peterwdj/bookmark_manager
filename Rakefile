require 'data_mapper'
require './bookmark_manager.rb'

namespace :db do
  desc "Non-destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (Data was lost)"
  end
end