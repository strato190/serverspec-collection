require_relative 'spec_helper'

services = [
  "nginx"
]

packages = [
  "nginx"
]


ports = [
  80,
  8080
]


files = [
  "/etc/nginx/sites-enabled/grafana-vhost.conf",
  "/etc/nginx/sites-enabled/grafana-vhost-ssl.conf",
  "/etc/nginx/sites-enabled/graphite-vhost.conf",
  "/etc/nginx/sites-enabled/graphite-vhost-ssl.conf",
  "/etc/nginx/sites-enabled/kibana-vhost.conf",
  "/etc/nginx/sites-enabled/kibana-vhost-ssl.conf",
  "/etc/nginx/sites-enabled/sensu-vhost.conf",
  "/etc/nginx/sites-enabled/sensu-vhost-ssl.conf",
  "/etc/nginx/nginx.conf"
]

files_content = [
  "/etc/nginx/nginx.conf"
]

files.each do |fl|
  describe file(fl) do
    it { should be_file }
  end
end

files_content.each do |fl|
  describe file(fl) do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match /include \/etc\/nginx\/sites-enabled\/\*;/ }
    its(:content) { should match /listen       8080 default_server;/ }
  end
end


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
