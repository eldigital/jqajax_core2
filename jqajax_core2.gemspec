Gem::Specification.new do |spec|
  spec.name          = "jqajax_core2"
  spec.version       = "0.0.8"
  spec.authors       = ["Florian Eck"]
  spec.email         = ["it-support@friends-systems.de"]
  spec.description   = "This is the new version of friends_ajax_core, optimizied and added flexibility."
  spec.summary       = "Makes Rails Ajax easy"
  spec.homepage      = ""
  spec.license       = "MIT"
  
  spec.files        = [Dir.glob("lib/**/*"), Dir.glob("app/**/*"), Dir.glob("config/**/*")].flatten

  # dependencies
  spec.add_dependency "jquery-rails"
  spec.add_dependency "jquery-ui-rails"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
