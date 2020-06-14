control 'apache2-service-at-ubuntu' do
  only_if { os[:name] == 'ubuntu' }

  describe service('apache2') do
    it { should be_enabled }
  end

  describe service('apache2') do
    it { should be_running }
  end
end

control 'httpd-service-at-centos' do
  only_if { os[:name] == 'centos' }

  describe service('httpd') do
    it { should be_enabled }
  end

  describe service('httpd') do
    it { should be_running }
  end
end

control 'port-80-apache2-service-at-ubuntu' do
  only_if { os[:name] == 'ubuntu' }

  describe port(80) do
    it { should be_listening }

    its('processes') { should include 'apache2' }
  end
end

control 'port-80-apache2-service-at-centos' do
  only_if { os[:name] == 'centos' }

  describe port(80) do
    it { should be_listening }

    its('processes') { should include 'httpd' }
  end
end

index_file = '/var/www/html/index.html'

describe file(index_file) do
  it { should be_file }

  its('mode') { should cmp '0644' }

  its('content') { should match /AWS Gentleman/ }
end

control 'ownership-of-var-www-html-index-at-ubuntu' do
  only_if { os[:name] == 'ubuntu' }

  describe file(index_file) do
    it { should be_owned_by "www-data" }
    it { should be_grouped_into "www-data" }
  end
end

control 'ownership-of-var-www-html-index-at-centos' do
  only_if { os[:name] == 'centos' }

  describe file(index_file) do
    it { should be_owned_by "apache" }
    it { should be_grouped_into "apache" }
  end
end
