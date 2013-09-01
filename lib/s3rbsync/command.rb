require 'thor'

module S3rbsync
  class Command < Thor
    include Thor::Actions

    desc 'init', "Set up S3rbsync. (ganerate configure)"
    def init
      if yes? "Do you wish to continue [yes(y) / no(n)] ?", :cyan
        access_key = ask("aws_access_key:")
        secret_key = ask("aws_secret_access_key:")
        create_file "~/.aws.yml" do
          <<-"STR"
aws_access_key:         #{access_key}
aws_secret_access_key:  #{secret_key}
          STR
        end
      else
        puts "...exit"
      end
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
    end

    desc 'hello', "say hello."
    def hello
      puts "hello s3rbsync world"
    end

  end
end
