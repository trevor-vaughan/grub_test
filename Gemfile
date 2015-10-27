# Variables:
#
# PUPPET_VERSION   | specifies the version of the puppet gem to load
puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['~>3']

group :test do
  gem 'rake'
  gem 'puppet', puppetversion
  gem 'rspec', '< 3.2.0'
  gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem 'puppetlabs_spec_helper'
  gem 'metadata-json-lint'
end

group :development do
  gem 'travis'
  gem 'travis-lint'
  gem 'vagrant-wrapper'
  gem 'puppet-blacksmith'
  gem 'guard-rake'
  gem 'pry'
  gem 'pry-doc'
end

group :system_tests do
  gem 'beaker'
  gem 'beaker-rspec'
  # NOTE: Workaround because net-ssh 2.10 is busting beaker
  # lib/ruby/1.9.1/socket.rb:251:in `tcp': wrong number of arguments (5 for 4) (ArgumentError)
  gem 'net-ssh', '~> 2.9.0'
  gem 'simp-beaker-helpers'
end
