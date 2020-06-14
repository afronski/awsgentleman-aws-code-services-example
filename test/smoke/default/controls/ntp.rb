# encoding: utf-8

control 'ntp-service-at-ubuntu' do
  only_if { os[:name] == 'ubuntu' }

  describe service('ntp') do
    it { should be_enabled }
  end

  describe service('ntp') do
    it { should be_running }
  end
end

control 'ntp-service-at-centos' do
  only_if { os[:name] == 'centos' }

  describe service('ntpd') do
    it { should be_enabled }
  end

  describe service('ntpd') do
    it { should be_running }
  end
end

describe timezone do
  it { should be_utc }
end
