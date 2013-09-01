require 'thor'

module S3rbsync
  class Command < Thor
    include Thor::Actions

    desc 'init', "Set up S3rbsync. (ganerate configure)"
    def init
      if yes? "Do you wish to continue [yes(y) / no(n)] ?"
        puts "continue"
      else
        puts "finish"
      end
    end

    desc 'hello', "say hello."
    def hello
      puts "hello s3rbsync world"
    end

  end
end
