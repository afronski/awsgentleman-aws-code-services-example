title '5.2 SSH Server Configuration'

control 'cis-ubuntu-16.04-5.2.1' do
  only_if { os[:name] == "ubuntu" && os[:release] == "16.04" }

  impact  1.0

  title '5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured (Scored)'
  desc  'The /etc/ssh/sshd_config file contains configuration specifications for sshd. The command below sets the owner and group of the file to root.'

  tag cis: 'ubuntu-16.04:5.2.1'

  describe file('/etc/ssh/sshd_config') do
    its('type') { should cmp 'file' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '0600' }
  end
end
