# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'inky/version'

Gem::Specification.new do |s|
  s.name        = 'inky-rails'
  s.version     = Inky::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Inky + ERb templates'
  s.email       = 'rafael@whitesmith.co'
  s.homepage    = 'https://github.com/whitesmith/inky-rails'
  s.description = 'Render Inky + ERb template views in Rails'
  s.authors     = ['Rafael Jegundo']
  s.license     = 'MIT'

  s.files         = Dir['MIT-LICENSE', 'README.md', 'lib/**/*']
  s.test_files    = Dir['test/**/*.rb']
  s.require_paths = ['lib']
  s.post_install_message = "Don't forget to install Inky e.g. \n\
                            $ npm install -g inky-cli"
end
