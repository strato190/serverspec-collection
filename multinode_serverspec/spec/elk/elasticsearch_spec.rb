require_relative 'spec_helper'

services = [
  "elasticsearch"
]

packages = [
  "elasticsearch"
]


ports = [
  9200,
  9300
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
