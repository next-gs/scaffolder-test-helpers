require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Scaffolder::Test::Unresolved do

  describe "basic instance" do
    subject do
      described_class.new(:length => 5)
    end

    its(:length) {should == 5}
    its(:to_hash){should == {'unresolved' => {'length' => 5}} }
  end

end
