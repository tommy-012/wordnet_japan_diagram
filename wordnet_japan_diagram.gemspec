# frozen_string_literal: true

require_relative "lib/wordnet_japan_diagram/version"

Gem::Specification.new do |spec|
  spec.name = "wordnet_japan_diagram"
  spec.version = WordnetJapanDiagram::VERSION
  spec.authors = ["tommy-012"]
  spec.email = ["lonnlilonn@googlemail.com"]

  spec.summary = "Draw a diagram of Japanese WordNet."
  spec.description = "Draw a diagram of Japanese WordNet about the hypernyms and hyponyms of the search word."
  spec.homepage = "https://github.com/tommy-012/wordnet_japan_diagram"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tommy-012/wordnet_japan_diagram"
  spec.metadata["changelog_uri"] = "https://github.com/tommy-012/wordnet_japan_diagram/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_dependency "activerecord", "~> 7.0.4"
  spec.add_dependency "sqlite3", "~> 1.5.4"
  spec.add_dependency "ruby-graphviz", "~> 1.2.5"
  spec.add_dependency "choice", "~> 0.2.0"
end
