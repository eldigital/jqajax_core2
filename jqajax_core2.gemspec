Gem::Specification.new do |spec|
  spec.name          = "jqajax_core2"
  spec.version       = "0.0.82"
  spec.authors       = ["Florian Eck"]
  spec.email         = ["it-support@friends-systems.de"]
  spec.description   = "Designed to provide an easy, clean and flexible solution to keep Rails 3+ AJAX handling as simple as possible, if you dont want to use somehing like the bootstrap js library..."
  spec.summary       = "Makes Rails Ajax easy"
  spec.homepage      = "https://github.com/friendssystems/jqajax_core2"
  spec.license       = "MIT"

  spec.files        = [Dir.glob("lib/**/*"), Dir.glob("app/**/*"), Dir.glob("config/**/*")].flatten

  # dependencies
  spec.add_runtime_dependency 'jquery-rails'
  spec.add_runtime_dependency 'jquery-ui-rails'
  spec.add_runtime_dependency 'coffee-rails'
  spec.add_runtime_dependency  'sass-rails'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
