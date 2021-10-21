source "https://rubygems.org"

gemspec

gem "pastel"
gem "tty-cursor"
gem "tty-screen"
gem "json", "2.4.1" if RUBY_VERSION == "2.0.0"

group :test do
  gem "benchmark-ips", "~> 2.0.0"
  if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.5.0")
    gem "coveralls_reborn", "~> 0.23.0"
    gem "simplecov", "~> 0.21.0"
  end
end
