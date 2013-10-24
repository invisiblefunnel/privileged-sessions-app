require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

desc "Run the entire test suite"
task :test do
  Rake::Task[:spec].invoke
  # Add any additional test steps
end
