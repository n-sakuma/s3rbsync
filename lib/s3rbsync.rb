require "s3rbsync/version"
require "s3rbsync/command"
require "s3rbsync/configure"
require "s3rbsync/synchronizer"
require "s3rbsync/region"

module S3rbsync
  def self.cli_start
    S3rbsync::Command.start
  end
end
