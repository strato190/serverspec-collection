require_relative 'spec_helper'

services = [
  "logstash"
]

packages = [
  "logstash"
]


ports = [
  5044,
  5514
]

#ports_udp = [
#  5514
#]


ports.each do |port|
  describe port(port) do
    it { should be_listening }
  end
end

#ports_udp.each do |port|
#  describe port(port) do
#    it { should be_listening.with('udp') }
#  end
#end

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
