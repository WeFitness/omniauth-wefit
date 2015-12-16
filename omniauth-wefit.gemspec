require File.expand_path('../lib/omniauth/wefit/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors = ['Donald Piret']
  gem.email = ['donald@wefit.io']
  gem.description = %q{An OmniAuth 1.2 strategy for WeFit OAuth2 authentication.}
  gem.summary = %q{An OmniAuth 1.2 strategy for WeFit OAuth2 authentication.}
  gem.homepage = 'https://github.com/wefitness/omniauth-wefit'

  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name = 'omniauth-wefit'
  gem.require_paths = ['lib']
  gem.version = OmniAuth::WeFit::VERSION

  gem.add_dependency 'omniauth', '~> 1.2'
  gem.add_dependency 'omniauth-oauth2', '~> 1.4'

  gem.add_development_dependency 'rspec', '~> 3.4'
  gem.add_development_dependency 'rake'
end