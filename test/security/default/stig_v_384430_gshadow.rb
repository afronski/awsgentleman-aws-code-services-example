title 'Security Technical Implementation Guide'

control 'v-38443-gshadow' do
  impact 0.5

  title 'v-38443: verify gshadow is owned by root'

  tag stig: 'linux:v-38443'

  describe file('/etc/gshadow') do
    it { should be_owned_by 'root' }
  end
end
