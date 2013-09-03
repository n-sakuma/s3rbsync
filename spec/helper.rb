$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "s3rbsync/version"
require "s3rbsync/command"
require "s3rbsync/configure"
require "s3rbsync/synchronizer"
require "s3rbsync/region"

require 'rspec'

Dir["spec/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
end

