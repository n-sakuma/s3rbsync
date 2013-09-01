require 'fog'

module S3rbsync
  class Synchronizer

    def initialize(configure, directory = nil)
      @configure = configure
      @sync_dir = directory
      @s3= Fog::Storage.new(:provider              => 'AWS',
                            :aws_access_key_id     => @configure.access_key,
                            :aws_secret_access_key => @configure.secret_key,
                            :region                => (@configure.region || 'ap-northeast-1'),
                            :persistent            => false )
    end

    def connected?
      @s3.get_bucket(@configure.bucket_name)
    rescue
      false
    else
      true
    end

    def sync!
      say "Sync start...", :cyan
      # ...
      # puts "sync_dir", @sync_dir
      # puts "cofig---"
      # p @configure
      say "...finish.", :cyan
    end
  end
end
