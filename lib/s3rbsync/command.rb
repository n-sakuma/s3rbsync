require 'thor'

module S3rbsync
  class Command < Thor
    include Thor::Actions

    desc 'init', "Set up S3rbsync. (ganerate configure)"
    def init
      if yes? "Do you wish to continue [yes(y) / no(n)] ?", :cyan
        access_key  = ask("aws_access_key:")
        secret_key  = ask("aws_secret_access_key:")
        region      = ask("regin:")
        bucket_name = ask("bucket_name:")
        create_file "~/.aws.yml" do
          <<-"YAML"
:aws_access_key:         #{access_key}
:aws_secret_access_key:  #{secret_key}
:regin:                  #{region}
:bucket_name:            #{bucket_name}
          YAML
        end
      else
        puts "...exit"
      end
    end

    desc 'sync', "Synchronize files to S3."
    method_option :directory, :type => :string, :aliases => "-d", :default => "./"
    def sync
      conf = S3rbsync::Configure.new
      unless conf.valid?
        say "Sync failed!: configure is invalid.", :red
        exit 1
      end
      synchronizer = S3rbsync::Synchronizer.new(conf, options[:directory])
      say "Sync start...", :cyan
      synchronizer.sync!
      say "...finish.", :cyan
    end

    desc 'test', "The connection test to AWS."
    def test
      say "\nChecking config...\n", :cyan
      conf = S3rbsync::Configure.new
      print "Config file: "
      if conf.valid_yaml_file?
        say "OK\n", :green
      else
        say "NG\n", :red
        say "\n...Done\n", :cyan
        exit 1
      end

      print "Test connection: "
      if conf.connected?
        say "OK", :green
        #]...
      else
        say "NG", :red
        say "  -> Connection falid: Chack config file, or 's3rbsync init'", :yellow
      end
      say "\n...Done\n", :cyan
    end

  end
end
