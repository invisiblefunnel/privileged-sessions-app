desc "Setup the development environment"
task :setup do
  Rake::Task['db:setup'].invoke
  # Add any additional setup steps
end

desc "Teardown the development environment"
task :teardown do
  Rake::Task['db:teardown'].invoke
  # Add any additional teardown steps
end
