require 'spec_helper'

describe Squall::Statistic do
  
  let(:federation_id) {"resource:compute:onapp-R1"}
    
  before(:each) do
    @statistic = Squall::Statistic.new
  end

  describe "#usage_statistic" do
    use_vcr_cassette "statistic/usage_statistics"

    it "returns the daily statistics" do
      result = @statistic.daily_stats
      result.should be_an(Array)
    end
    
    it "contains the statistic data" do
      result = @statistic.daily_stats
      result.all?.should be_true
    end
  end
  
  describe "#zone_cloud_score" do
    use_vcr_cassette "statistic/zone_cloud_score"
    
    it "returns cloud scores" do
      result = @statistic.cloud_score(federation_id)
      result.should be_an(Array)
    end
    
    it "contains the statistic data" do
      result = @statistic.cloud_score(federation_id)
      binding.pry
      result.all?.should be_true
    end
  end
end
