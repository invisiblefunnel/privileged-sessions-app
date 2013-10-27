desc "Setup the development environment"
task :setup do
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
  Rake::Task['db:test:load'].invoke
end

desc "Teardown the development environment"
task :teardown do
  Rake::Task['db:drop'].invoke
end
