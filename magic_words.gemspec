require_relative 'lib/magic_words/version'

Gem::Specification.new do |spec|
  spec.name          = "magic_words"
  spec.version       = MagicWords::VERSION
  spec.authors       = ["Aidan Coyle"]
  spec.email         = ["packrat386@gmail.com"]

  spec.summary       = %q{avoid those messy string literals}
  spec.homepage      = "https://github.com/packrat386/magic_words"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/packrat386/magic_words"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
