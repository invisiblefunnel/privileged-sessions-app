desc "Check for security issues"
task :brakeman do
  sh "brakeman -q -z"
end
