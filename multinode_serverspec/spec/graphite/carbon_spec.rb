require 'spec_helper'                                                                                                                                                                                                                                                           


packages_rh = [
  "nginx",
  "python-devel",
  "grafana",
  "graphite-web",
  "python-carbon",
  "net-snmp",
  "perl",
  "gcc-c++",
  "pycairo",
  "mod_wsgi",
]


packages_deb = [
  "nginx",
  "python-dev",
  "grafana",
  "graphite-web",
  "graphite-carbon",
  "libapache2-mod-wsgi",
  "libcairo2-dev",
  "libffi-dev"
]


services = [
  "carbon-cache"
]

ports = [
  2003,
  2004,
  7002,
  5000,
  3000
]

pip_packages = [
  "gunicorn"
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
elsif os[:family] == 'debian'
  packages_deb.each do |package|
    describe package(package) do
      it { should be_installed }
    end
  end
else
  print "Not supported os family: #{os[:family]}"
end


services.each do |service|
  describe service(service) do
      it { should be_running }
  end
end

ports.each do |port|
  describe port(port) do
    it { should be_listening }
  end
end

pip_packages.each do |package|
  describe package(package) do
    it { should be_installed.by('pip') }
  end
end



#print "Var testing: #{local_variables}"

print "All ok"

#print "server-id = #{property[:server_id]}"

