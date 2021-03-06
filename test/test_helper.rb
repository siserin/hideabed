ENV['RAILS_ENV'] = 'test'
require File.expand_path(File.dirname(__FILE__) + '/../config/environment')
require 'test_help'
require Rails.root.join('test', 'blueprints')

if $stdin.tty?
  begin
    gem 'redgreen'
  rescue Gem::LoadError
  else
    require 'redgreen'
  end
end

class ActiveSupport::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
end
