# Helper methods for writing Rspec request tests with Devise
include Devise::TestHelpers

module DeviseRequestHelper
end

RSpec.configure do |config|
  config.include DeviseRequestHelper, :type => :request
  config.include DeviseRequestHelper, :type => :helper
  config.include DeviseRequestHelper, :type => :controller
end