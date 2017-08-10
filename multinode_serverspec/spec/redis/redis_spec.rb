require 'spec_helper'                                                                                                                                                                                                                                                           


services = [
  "redis_6379"
]


ports = [
  6379
]

ports.each do |port|
  describe port(port) do
	  it { should be_listening.on('127.0.0.1').with('tcp') }
  end
end

services.each do |service|
  describe service(service) do
      it { should be_running }
      it { should be_enabled }                                                                                                                                                                                                                                                  
  end
end
