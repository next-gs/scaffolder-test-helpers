require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Scaffolder::Test::Helpers do

  it{ described_class.class.should == Module }

  describe "namespace loading" do

    it{ Scaffolder.class.should == Class }
    it{ Scaffolder.methods.should include("update_with_sequence") }

  end

end
