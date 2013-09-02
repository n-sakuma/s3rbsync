# s3rbsync

このライブラリを使うことで、特定のディレクトリをS3に同期させることができます。
This library save to S3 in the AWS file in the directory specific.

## Installation

Add this line to your application's Gemfile:

    gem 's3rbsync'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install s3rbsync

## Usage

### Overview

```bash
$ s3rbsync
Commands:
  s3rbsync help [COMMAND]  # Describe available commands or one specific command
  s3rbsync init            # Set up S3rbsync. (ganerate configure)
  s3rbsync sync            # Synchronize files to S3.
  s3rbsync test            # The connection test to AWS.
```

### First step

```bash
$ s3rbsync init
```

### Connection Test

```bash
$ s3rbsync test
```

### Sync

```bash
ex.)
$ s3rbsync sync -d /var/backups

# Options:
#   -d, [--directory=DIRECTORY]  # Default: ./   (current directory)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
