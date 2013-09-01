require 'fog'

module S3rbsync
  class Synchronizer

    def initialize(configure)
      @configure = configure
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
  end
end
