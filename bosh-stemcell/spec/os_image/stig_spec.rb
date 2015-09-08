require 'spec_helper'

describe 'Stig test case verification', {os_image: true, stig_test: true} do
  it "confirms all stig test cases ran" do
    expected_stig_test_cases = ["stig: V-38491", "stig: V-38497"]
    # expected_stig_test_cases = [
    #   "stig: V-38682",
    #   "stig: V-38691",
    #   "stig: V-38497",
    #   "stig: V-38491",
    #   "stig: V-38617",
    #   "stig: V-38462",
    #   "stig: V-38614",
    #   "stig: V-38612",
    #   "stig: V-38615",
    #   "stig: V-38611",
    #   "stig: V-38608",
    #   "stig: V-38616",
    #   "stig: V-38610",
    #   "stig: V-38607",
    #   "stig: V-38701",
    #   "stig: V-38587",
    #   "stig: V-38598",
    #   "stig: V-38450",
    #   "stig: V-38451",
    #   "stig: V-38499",
    #   "stig: V-38458",
    #   "stig: V-38459",
    #   "stig: V-38461",
    #   "stig: V-38443",
    #   "stig: V-38448",
    #   "stig: V-38449",
    #   "stig: V-38643",
    #   "stig: V-38586",
    #   "stig: V-38617",
    #   "stig: V-38668",
    #   "stig: V-38462",
    #   "stig: V-38476",
    #   "stig: V-38668",
    #   "stig: V-38476"
    # ]

    expect($stig_test_cases.to_a).to contain_exactly(expected_stig_test_cases)
  end
end
