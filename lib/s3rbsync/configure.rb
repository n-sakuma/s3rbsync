require 'yaml'

module S3rbsync
  class Configure
    CONF_FILE = "#{ENV["HOME"]}/.aws.yml"
    attr_accessor :access_key, :secret_key, :bucket_name

    def initialize
      @access_key = @secret_key = @bucket_name = @error_message = nil
      begin
        @conf = YAML.load_file CONF_FILE
      rescue => e
        @error_message = "Error: #{e.message}"
      else
        @access_key  = @conf[:aws_access_key]
        @secret_key  = @conf[:aws_secret_access_key]
        @bucket_name = @conf[:bucket_name]
      end
    end

    def valid_yaml_file?
      @error_message.nil? and @access_key and @secret_key and @bucket_name
    end

    def connected?
      s3 = S3rbsync::Synchronizer.new(self)
      s3.connected?
    end
  end
end
