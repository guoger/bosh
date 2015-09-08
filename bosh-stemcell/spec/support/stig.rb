require 'set'

$stig_test_cases = Set.new

RSpec.configure do |config|
  config.before(:each) do |example|
    if stig_test_case = example.full_description[/stig: V-\d*/]
      $stig_test_cases << stig_test_case
    end
  end

  config.register_ordering(:global) do |list|
    # make sure that stig test case check will be run at last
    list.each do |example_group|
      if example_group.metadata[:stig_test]
        list.delete example_group
        list.push example_group
        break
      end
    end

    list
  end
end