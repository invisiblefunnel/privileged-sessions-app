namespace :sessions do
  namespace :reap do
    desc "Remove inactive sessions"
    task inactive: :environment do
      count = PrivilegedSession.inactive.count

      puts "Reaping #{count} inactive sessions..."
      PrivilegedSession.inactive.destroy_all
      puts "Finished."
    end
  end
end
