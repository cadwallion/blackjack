# Blackjack

The classic card game written using Gosu.

## Installation

Add this line to your application's Gemfile:

    gem 'Blackjack'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Blackjack

## Usage

Blackjack contains a blackjack executable in the bin directory.

## Testing

There is currently a bug with rspec and gosu.  In the meantime, I have modified
`rake test` to take a parameter output.  Therefore:

`rake test` is equivalent ot `rake test spec/**_spec.rb`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
