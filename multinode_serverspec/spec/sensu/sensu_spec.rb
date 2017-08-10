require 'spec_helper'

services = [
  "sensu-client",
  "sensu-server",
  "sensu-api",
  "uchiwa"
]

packages = [
  "uchiwa",
  "sensu"
]

ports = [
  3000,
  3030,
  4567
]

ports.each do |port|
  describe port(port) do
    it { should be_listening }
  end
end

packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

services.each do |service|
  describe service(service) do
      it { should be_running }
      it { should be_enabled }                                                                                                                                                                                                                                                  
  end
end
