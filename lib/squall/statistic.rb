module Squall
  # OnApp Statistic
  class Statistic < Base
    # Public: Get usage statistics for virtual machines.
    #
    # Returns an Array.
    def daily_stats
      response = request(:get, "/usage_statistics.json")
      response.collect {|s| s["vm_stat"]}
    end
    
    # Public: Get zone cloud score.
    # https://docs.onapp.com/pages/viewpage.action?pageId=36605060
    
    # Returns an Array.
    def cloud_score(federation_id)
      response = request(:get, "/federation/hypervisor_zones/#{federation_id}/scores.json")
      response.collect {|s| s["hypervisor_zone_score"]}
    end
    
  end
end
