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
      @queue = Queue.new
    rescue => e
      puts "----- Error -----"
      puts e.message
      exit 1
    end

    def connected?
      !!@bucket
    end

    def sync!
      # puts '...call sync!'
      upload_files(@local_dir)
    end


    private

    def upload_files(dir)
      upload_in_directory(dir)
      recursive_upload
    end

    def recursive_upload
      upload_in_directory(@queue.pop, :recursible => true) until @queue.empty?
    end

    def upload_in_directory(dir, options={})
      Dir.entries(dir).each do |file|
        next if file.start_with?('.')

        file_name = options[:recursible] ? File.join(dir, file) : file
        if File.directory?(file_name)
          @queue.push(file_name)
        else
          upload!(file_name)
        end
      end
    end

    def upload!(file_name)
      remote_file = get_remote_file(file_name)
      return if remote_file && (not modified?(file_name, remote_file))
      remote_file.destroy if remote_file && modified?(file_name, remote_file)
      @bucket.files.create(:key => "#{file_name}", :body => open(file_name), :public => false)
      puts "copied #{file_name}"
    end

    def get_remote_file(file_name)
      @bucket.files.get(file_name)
    end

    def modified?(local_file, remote_file)
      # puts "verifying file: #{local_file}"
      return true unless remote_file
      File.mtime(local_file) > remote_file.last_modified
    end

  end
end
