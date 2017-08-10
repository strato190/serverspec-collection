require 'serverspec'
require 'net/ssh'


#require 'rubygems'
#require 'bundler/setup'

#require 'pathname'
require 'yaml'



if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

set :backend, :ssh

properties = YAML.load_file('properties.yml')

RSpec.configure do |c|
    ssh_user = ENV['SSH_USER']
    set :ssh_options, Net::SSH::Config.for(ENV['TARGET_HOST']).merge(user: ENV['SSH_USER'])
    c.host  = ENV['TARGET_HOST']
    set_property properties[c.host]
end
