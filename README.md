# TTY::Font [![Gitter](https://badges.gitter.im/Join%20Chat.svg)][gitter]

[![Gem Version](https://badge.fury.io/rb/tty-font.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/tty-font.svg?branch=master)][travis]
[![Build status](https://ci.appveyor.com/api/projects/status/cj4owy2vlty2q1ko?svg=true)][appveyor]
[![Maintainability](https://api.codeclimate.com/v1/badges/b0d6263bd34e1c0cae74/maintainability)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/github/piotrmurach/tty-font/badge.svg)][coverage]
[![Inline docs](http://inch-ci.org/github/piotrmurach/tty-font.svg?branch=master)][inchpages]

[gitter]: https://gitter.im/piotrmurach/tty
[gem]: http://badge.fury.io/rb/tty-font
[travis]: http://travis-ci.org/piotrmurach/tty-font
[appveyor]: https://ci.appveyor.com/project/piotrmurach/tty-font
[codeclimate]: https://codeclimate.com/github/piotrmurach/tty-font/maintainability
[coverage]: https://coveralls.io/github/piotrmurach/tty-font
[inchpages]: http://inch-ci.org/github/piotrmurach/tty-font

> Write text in large stylized characters using a variety of terminal friendly fonts.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tty-font'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tty-font

## Usage

```ruby
font = TTY::Font.new(:doom)

puts font.write("DOOM")
# =>
# ______  _____  _____ ___  ___
# |  _  \|  _  ||  _  ||  \/  |
# | | | || | | || | | || .  . |
# | | | || | | || | | || |\/| |
# | |/ / \ \_/ /\ \_/ /| |  | |
# |___/   \___/  \___/ \_|  |_/
#
```

## Fonts

The list of the available fonts:

* [doom](fonts/doom.md)
* [standard](fonts/standard.md)
* [starwars](fonts/starwars.md)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tty-font. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tty::Font project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tty-font/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) 2017 Piotr Murach. See LICENSE for further details.
