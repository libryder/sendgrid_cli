# SendgridCli

[![Build Status](https://secure.travis-ci.org/libryder/sendgrid_cli.png)](http://travis-ci.org/libryder/sendgrid_cli)

This is a basic implementation for a command line interface to the Sendgrid API. It is currently limited
to the Spam Reports function. 

## Installation

Add this line to your application's Gemfile:

    gem 'sendgrid_cli'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sendgrid_cli

## Usage

Sendgrid spam reports utility. 

Allows you to manage and view your list of spam reports.

```
sendgrid config user <api_username>    :: Configure api username for gem use
sendgrid config pass <api_secret>      :: Configure api password for gem use
sendgrid get [<email>]                 :: Get entire list or single blocked recipient.
sendgrid delete <email>                :: Delete single recipient from blocked recipient list.
```

####Note
 ```config``` is required to be run before API will work. Config is stored in

```
~/.sendgrid_cli.yaml
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
