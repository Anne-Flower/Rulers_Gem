# frozen_string_literal: true

require_relative "lib/rulers/version"

Gem::Specification.new do |spec|
  spec.name = "rulers"
  spec.version = Rulers::VERSION
  spec.authors = ["Anne-Flore Bernard"]
  spec.email = ["139115974+Anne-Flower@users.noreply.github.com"]

  spec.summary = "A Rack-based Web Framework"
  spec.description = "A Rack-based Web Framework, but with extra awesome."
  spec.homepage = "https://github.com/Anne-Flower/Rulers.git"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Anne-Flower/Rulers.git"
  spec.metadata["changelog_uri"] = "https://github.com/Anne-Flower/Rulers/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) || f.end_with?(".gem")
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_runtime_dependency "rack", "~> 2.2"
  spec.add_runtime_dependency "webrick", "~> 1.0"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "minitest"


  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
