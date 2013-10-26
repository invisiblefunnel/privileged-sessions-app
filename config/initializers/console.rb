# Define helper methods for `rails console`
module Rails
  module ConsoleMethods
    require 'factory_girl'
    include FactoryGirl::Syntax::Methods
  end
end if Rails.env.development?
