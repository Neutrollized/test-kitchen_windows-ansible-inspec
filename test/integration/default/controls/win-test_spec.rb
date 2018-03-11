title 'WIN-TEST_ANSIBLE_ROLE'

control 'win-test-ansible-01' do
  impact 1.0
  title 'Validate test-kitchen for windows works correctly'
  desc 'Ansible should run the win-test role correctly.'

  describe os[:family] do
    it { should eq 'windows' }
  end

  describe file('C:/Windows/explorer.exe') do
    it { should exist }
    it { should be_file }
  end

  describe directory('C:\temp\test_dir') do
    it { should exist }
  end

 # More testing resources can be located at: http://inspec.io/docs/reference/resources/

end
