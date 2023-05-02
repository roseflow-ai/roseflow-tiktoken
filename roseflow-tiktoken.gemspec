# frozen_string_literal: true

require_relative "lib/roseflow/tiktoken/version"

Gem::Specification.new do |spec|
  spec.name = "roseflow-tiktoken"
  spec.version = Roseflow::Tiktoken.gem_version
  spec.authors = ["Lauri Jutila"]
  spec.email = ["git@laurijutila.com"]

  spec.summary = "Tiktoken tokenizer for Roseflow."
  spec.description = "Tiktoken tokenizer for Roseflow."
  spec.homepage = "https://github.com/roseflow-ai/roseflow-tiktoken"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/roseflow-ai/roseflow-tiktoken"
  spec.metadata["changelog_uri"] = "https://github.com/roseflow-ai/roseflow-tiktoken/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pycall", "~> 1.4"
end
