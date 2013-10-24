namespace :db do
  desc "Setup the development and test databases"
  task :setup do
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke
  end

  desc "Tear down the development and test databases"
  task teardown: 'db:drop'
end
