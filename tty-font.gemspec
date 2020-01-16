require File.expand_path("lib/tty/font/version", __dir__)

Gem::Specification.new do |spec|
  spec.name          = "tty-font"
  spec.version       = TTY::Font::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["piotr@piotrmurach.com"]
  spec.summary       = %q{Terminal fonts}
  spec.description   = %q{Write text in large stylized characters using a variety of terminal friendly fonts.}
  spec.homepage      = "https://piotrmurach.github.io/tty"
  spec.license       = "MIT"
  spec.metadata = {
    "allowed_push_host" => "https://rubygems.org",
    "bug_tracker_uri"   => "https://github.com/piotrmurach/tty-font/issues",
    "changelog_uri"     => "https://github.com/piotrmurach/tty-font/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://www.rubydoc.info/gems/tty-font",
    "homepage_uri"      => spec.homepage,
    "source_code_uri"   => "https://github.com/piotrmurach/tty-font"
  }
  spec.files         = Dir["lib/**/*", "{fonts/*.md}"]
  spec.files        += Dir["README.md", "CHANGELOG.md", "LICENSE.txt"]
  spec.extra_rdoc_files = Dir["README.md", "{fonts/*.md}"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.0.0"

  spec.add_development_dependency "bundler", ">= 1.5"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rake"
end
