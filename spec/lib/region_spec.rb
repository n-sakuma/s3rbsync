require_relative "../helper"

describe Region do
  describe ".printable_list" do
    before :all do
      @regions = Region.printable_list.first
      @describes = Region.printable_list.last
    end

    it 'title pair' do [@regions[0], @describes[0]].should == ["Region Name:",   "Location Name:"]; end
    it 'Virginia' do   [@regions[1], @describes[1]].should == ["us-east-1",      "Virginia"]; end
    it 'California' do [@regions[2], @describes[2]].should == ["us-west-1",      "California"]; end
    it 'Oregon' do     [@regions[3], @describes[3]].should == ["us-west-2",      "Oregon"]; end
    it 'Ireland' do    [@regions[4], @describes[4]].should == ["eu-west-1",      "Ireland"]; end
    it 'Tokyo' do      [@regions[5], @describes[5]].should == ["ap-northeast-1", "Tokyo"]; end
    it 'Singapore' do  [@regions[6], @describes[6]].should == ["ap-southeast-1", "Singapore"]; end
    it 'Sydney' do     [@regions[7], @describes[7]].should == ["ap-southeast-2", "Sydney"]; end
    it 'Sao Paulo' do  [@regions[8], @describes[8]].should == ["sa-east-1",      "Sao Paulo"]; end
  end

  describe ".names " do
    subject {Region.names}
    it { should be_include "us-east-1"}
    it { should be_include "us-west-1"}
    it { should be_include "us-west-2"}
    it { should be_include "eu-west-1"}
    it { should be_include "ap-northeast-1"}
    it { should be_include "ap-southeast-1"}
    it { should be_include "ap-southeast-2"}
    it { should be_include "sa-east-1"}

    # To actually exist, but it does not display. Because it is not use it.
    it { should_not be_include "us-gov-west-1"}
  end
end
