require 'spec_helper'                                                                                                                                                                                                                                                           

packages_rh = [
  "pcs"
]


packages_deb = [
  "cluster-glue",
  "corosync",
  "crmsh",
  "pacemaker",
  "resource-agents",
]


services_deb = [
  "pacemaker",
  "corosync"
]

services_rh = [
  "pcsd",
  "pacemaker",
  "corosync"
]

ports = [
  5405,
  2224
]

yumrepos = [
  "epel"
]


if os[:family] == 'redhat'
  yumrepos.each do |yumrepository|
    describe yumrepo(yumrepository) do
      it { should exist }
      it { should be_enabled }
    end
  end

  packages_rh.each do |package|
    describe package(package) do
      it { should be_installed }
    end
  end

  describe user('hacluster') do
    it { should exist }
  end

  services_rh.each do |service|
    describe service(service) do
      it { should be_running }
    end
  end

elsif os[:family] == 'debian'
  packages_deb.each do |package|
    describe package(package) do
      it { should be_installed }
    end
  end

  services_deb.each do |service|
    describe service(service) do
        it { should be_running }
    end
  end

else
  print "Not supported os family: #{os[:family]}"
end


ports.each do |port|
  describe port(port) do
    it { should be_listening }
  end
end

