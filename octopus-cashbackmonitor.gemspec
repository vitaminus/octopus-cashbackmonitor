Gem::Specification.new do |spec|
  spec.name          = 'octopus-cashbackmonitor'
  spec.version       = '0.0.1'
  spec.authors       = ['vitaminus']
  spec.email         = ['partadw@gmail.com']
  spec.description   = 'Scrap for Rewardexpert'
  spec.summary       = 'Scrap cashbackmonitor for Rewardexpert'
  # spec.homepage      = 'TODO: Add a homepage'
  spec.license       = 'MIT'
  spec.metadata      = { 'octopus_plugin_type' => 'scrap' }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'octopus', '>= 0.1'

  spec.add_runtime_dependency 'nokogiri'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry-byebug' if RUBY_PLATFORM != 'java'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
