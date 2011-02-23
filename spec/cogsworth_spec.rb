require "spec_helper"

describe Cogsworth do
  it { should respond_to(:parse).with(1).argument }
  it { should respond_to(:unparse).with(1).argument }
    
  describe "parsing a string into seconds" do
    
    it "parses '1m' to 60 seconds" do
      Cogsworth.parse("1m").should be(60)
    end
    
    it "parses '1 min' to 60 seconds" do
      Cogsworth.parse("1 min").should be(60)
    end
    
    it "parses '2m' to 120 seconds" do
      Cogsworth.parse("2m").should be(120)
    end
    
    it "parses '2 minutes' to 120 seconds" do
      Cogsworth.parse("2 minutes").should be(120)
    end
    
    it "parses '2 mins' to 120 seconds" do
      Cogsworth.parse("2 mins").should be(120)
    end
    
    it "parses '1h' to 3600 seconds" do
      Cogsworth.parse("1h").should be(3600)
    end
    
    it "parses '1h 20m' to 4800 seconds" do
      Cogsworth.parse("1h 20m").should be(4800)
    end
    
    it "parses '2 days' to 172800 seconds" do
      Cogsworth.parse("2 days").should be(172800)
    end

    it "parses '1d15h35m10s' to 142510 seconds" do
      Cogsworth.parse("1d15h35m10s").should be(142510)
    end
    
    it "parses '1H10M' to 4200 seconds" do
      Cogsworth.parse("1H10M").should be(4200)
    end
  end
  
  describe "converting seconds into a formatted string" do
    it "converts 30 seconds to 30s'" do
      Cogsworth.unparse(30).should == '30s'
    end
    
    it "converts 60 seconds to '1m'" do
      Cogsworth.unparse(60).should == '1m'
    end
    
    it "converts 120 seconds to '2m'" do
      Cogsworth.unparse(120).should == '2m'
    end
    
    it "converts 150 seconds to '2m 30s'" do
      Cogsworth.unparse(150).should == '2m 30s'
    end
    
    it "converts 156 seconds to '2m 36s'" do
       Cogsworth.unparse(156).should == '2m 36s'
     end
    
    it "converts 3600 seconds to '1h'" do
      Cogsworth.unparse(3600).should == '1h'
    end
    
    it "converts 86400 seconds to '1d'" do
      Cogsworth.unparse(86400).should == '1d'
    end
    
    it "converts 142510 seconds to '1d 15h 35m 10s'" do
      Cogsworth.unparse(142510).should == '1d 15h 35m 10s'
    end
  end
end