# frozen_string_literal: true

require_relative "lib/cenar/version"

Gem::Specification.new do |spec|
  spec.name          = "cenar"
  spec.version       = Cenar::VERSION
  spec.authors       = ["Reid Jackson"]
  spec.email         = ["rlj0713@gmail.com"]

  spec.summary       = "Generate a recipe and shopping list for your dinner."
  spec.description   = "This app presents users with a list of recipes.  Users can choose a recipe based on the main ingerdient.  Users can also indicate how many people need to eat.  The app will return a recipe and shopping list for that meal."
  spec.homepage      = "https://github.com/rlj0713/cenar"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rlj0713/cenar"
  spec.metadata["changelog_uri"] = "https://github.com/rlj0713/cenar"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "pry"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html

end
