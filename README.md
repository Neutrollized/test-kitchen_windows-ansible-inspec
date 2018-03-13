# test-kitchen_windows-ansible-inspec
How to use the test-kitchen suite with Ansible and InSpec verification on Windows guest

## Requirements

### Host
 Ansible >= 2.4.1 (but I would recommend using the latest as Windows support is constantly improving)

Ruby >= 2.2

need the following gems installed:

 test-kitchen

 kitchen-vagrant

 kitchen-inspec

 kitchen-ansiblepush

 [pywinrm](https://pypi.python.org/pypi/pywinrm)
 
 which (yes, if you're installing it on a small Docker image or something, make sure it has the `which` command)

## (Windows) Guest
Make sure [ConfigureRemotingForAnsible.ps1](https://github.com/ansible/ansible/blob/devel/examples/scripts/ConfigureRemotingForAnsible.ps1) is run on your Windows guest so configure WinRM over SSL

My example uses the Windows 2012R2 Vagrant box I built using [this](https://github.com/Neutrollized/packer-windows)

## How It Works

The problem with Ansible on Windows is that it requires a Linux host to run your playbook from.  One option is to run 2 Vagrant boxes (1 Windows, 1 Linux) and have the Linux host run the playbook/role on your Windows host, but that's not very efficient (not to mention it causes problems when trying to verify because it tries to run verify on every platform you list in your .kitchen.yml).  The method I'm using one needs 1 Windows Vagrant box to be started and you will provision it using [kitchen-ansiblepush](https://github.com/ahelal/kitchen-ansiblepush) which runs the playbook from your localhost.

AnsiblePush will generate an inventory file to use based on your settings that your provide, which is really neat!

### NOTES

You will notice the username is not the default 'vagrant' and that's because it's what I had set it to when I built my image using [Packer](www.packer.io), so you will probably need to change that accordingly.
