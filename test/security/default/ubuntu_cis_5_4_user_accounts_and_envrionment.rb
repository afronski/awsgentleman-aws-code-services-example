title '5.4 User Accounts and Environment'

control 'cis-ubuntu-16.04-5.4.4' do
  only_if { os[:name] == "ubuntu" && os[:release] == "16.04" }

  impact 0.7

  title '5.4.4 Ensure default user umask is 027 or more restrictive'
  desc  'The default umask determines the permissions of files created by users.'

  tag cis: 'ubuntu-16.04:5.4.4'

  describe file('/etc/bash.bashrc') do
    its('content') { should match /^umask 027/ }
  end

  describe file('/etc/profile') do
    its('content') { should match /^umask 027/ }
  end
end
