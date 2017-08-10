require 'spec_helper'                                                                                                                                                                                                                                                           

packages = [
  "keepalived"
]


services = [
  "keepalived"
]


ports = [
  5405,
  2224
]

yumrepos = [
  "epel"
]


sysctl_values = [
	"net.ipv4.ip_nonlocal_bind = 1",
#	"net.ipv4.ip_forward=1"
]



describe selinux_module('keepalived'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_installed }
end


describe ppa('keepalived/stable'), :if => os[:family] == 'ubuntu' do
  it { should exist }
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


#ports.each do |port|
#  describe port(port) do
#    it { should be_listening }
#  end
#end


sysctl_values.each do |svalue|
  describe file('/etc/sysctl.conf') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should contain svalue }
  end

end
