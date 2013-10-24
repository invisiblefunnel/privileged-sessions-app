desc "Run the entire test suite"
task :test do
  Rake::Task[:spec].invoke
  # Add any additional test steps
end
