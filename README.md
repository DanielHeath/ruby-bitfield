# Bitfield

A pure-ruby bitfield extracted from a bloom filter implementation

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-bitfield'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-bitfield

## Usage

```
filter = Bitfield.new(2**16)
filter.set(3005)
filter.unset(3006)
filter.get(3004) # false
filter.get(3005) # true
filter.get(3006) # false
filter.serialize('path.bin')
reloaded = Bitfield.new(2**16, File.binread('path.bin'))
filter.get(3004) # false
filter.get(3005) # true
filter.get(3006) # false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DanielHeath/ruby-bitfield. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bitfield project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Danielheath/ruby-bitfield/blob/master/CODE_OF_CONDUCT.md).
