require 'yaml'

module S3rbsync
  class Configure
    CONF_FILE = "#{ENV["HOME"]}/.aws.yml"
    attr_accessor :access_key, :secret_key

    def initialize
      @access_key = @secret_key = @error_message = nil
      begin
        @conf = YAML.load_file CONF_FILE
      rescue => e
        @error_message = "Error: #{e.message}"
      else
        # require 'pry'; binding.pry
        @access_key = @conf["aws_access_key"]
        @secret_key = @conf["aws_secret_access_key"]
      end
    end

    def valid_yaml_file?
      @error_message.nil? and @access_key and @secret_key
    end
  end
end
