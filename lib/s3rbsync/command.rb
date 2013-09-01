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

    desc 'hello', "say hello."
    def hello
      puts "hello s3rbsync world"
    end

  end
end
