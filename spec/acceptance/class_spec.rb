require 'spec_helper_acceptance'

test_name 'Augeasproviders Grub'

describe 'grub_test class' do
  manifests = [
    "class { 'grub_test::working': }",
    "class { 'grub_test::failing': }"
  ]

  manifests.each do |manifest|
    let(:manifest){ manifest }

    context "default parameters for #{manifest}" do
      hosts.each do |host|
        # Using puppet_apply as a helper
        it 'should work with no errors' do
          apply_manifest_on(host, manifest, :catch_failures => true)
        end
    
        it 'should be idempotent' do
          apply_manifest_on(host, manifest, {:catch_changes => true})
        end
    
        it 'is expected to have auditing enabled at boot time' do
          host.reboot
          on(host, 'grep "audit=1" /proc/cmdline')
        end
      end
    end
  end
end
