require 'fog'

module S3rbsync
  class Synchronizer

    def initialize(configure, directory = nil)
      @configure = configure
      @local_dir = directory
      @s3 = Fog::Storage.new(:provider              => 'AWS',
                             :aws_access_key_id     => @configure.access_key,
                             :aws_secret_access_key => @configure.secret_key,
                             :region                => (@configure.region || 'ap-northeast-1'),
                             :persistent            => false )
      @bucket = @s3.directories.get(@configure.bucket_name)
    rescue => e
      puts "----- Error -----"
      puts e.message
      exit 1
    end

    def connected?
      !!@bucket
    end

    def sync!
      # ...
      # puts "sync_dir", @sync_dir
      # puts "cofig---"
      # p @configure
    end
  end
end
