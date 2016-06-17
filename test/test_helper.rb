require 'rubygems'
require 'bundler'
Bundler.setup

require 'minitest/autorun'
require 'active_support/test_case'

require 'action_mailer'
require 'rails/railtie'
require 'rails/generators'
require 'rails/generators/test_case'

# require "minitest/reporters"
# Minitest::Reporters.use!

$:.unshift File.expand_path('../../lib', __FILE__)

require 'inky'

Inky::Railtie.run_initializers

if ActiveSupport::TestCase.respond_to? :test_order=
  ActiveSupport::TestCase.test_order = :sorted
end

# Avoid annoying warning from I18n.
I18n.enforce_available_locales = false

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
