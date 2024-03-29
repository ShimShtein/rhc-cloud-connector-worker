# frozen_string_literal: true

require_relative 'lib/rhc_cloud_connector_worker/version'

Gem::Specification.new do |spec|
  spec.name          = 'rhc-cloud-connector-worker'
  spec.version       = RhcCloudConnectorWorker::VERSION
  spec.authors       = ['Shimon Shtein']
  spec.email         = ['sshtein@redhat.com']

  spec.summary       = 'RHC worker responsible for communication between RH cloud and Foreman'
  # spec.description   = 'TODO: Write a longer description or delete this line.'
  spec.homepage      = 'https://github.com/theforeman/rhc-cloud-connector-worker'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/theforeman/rhc-cloud-connector-worker'
  spec.metadata['rubygems_mfa_required'] = 'true'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'config'
  spec.add_dependency 'grpc'

  spec.add_development_dependency 'grpc-tools'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'pry-doc'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.7'
  spec.add_development_dependency 'rubocop-minitest'
  spec.add_development_dependency 'rubocop-rake'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
