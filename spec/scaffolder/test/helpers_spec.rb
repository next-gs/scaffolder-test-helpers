require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Scaffolder::Test::Helpers, "#generate_scaffold_files method" do
  
  describe "pass an array with a single sequence" do

    before(:all) do
      entries = [Scaffolder::Test::Sequence.new(:name => 'c1',:sequence => 'ATG')]
      @scaffold_file, @sequence_file = generate_scaffold_files(entries)
    end

    it "should create a scaffold file" do
      File.exists?(@scaffold_file).should be_true
    end

    it "should create a sequence file" do
      File.exists?(@sequence_file).should be_true
    end

  end

end
