require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Scaffolder::Test::Helpers, "#generate_scaffold_files method" do

  describe "pass an array with a single sequence" do

    before(:all) do
      entries = [Scaffolder::Test::Sequence.new(:name => 'c1',:sequence => 'ATG')]
      @scaf_file, @seq_file = described_class.generate_scaffold_files(entries)
    end

    it "should create the corresponding scaffold file" do
      File.exists?(@scaf_file).should be_true
      scaffold = YAML.load(File.read(@scaf_file))
      scaffold.should == [{'sequence' => {'source' => 'c1'}}]
    end

    it "should create the corresponding sequence file" do
      File.exists?(@seq_file).should be_true
      sequence = File.read(@seq_file)
      sequence.should == ">c1\nATG\n"
    end

  end

  describe "pass an array with two sequences" do

    before(:all) do
      entries = [Scaffolder::Test::Sequence.new(:name => 'c1',:sequence => 'ATG'),
                 Scaffolder::Test::Sequence.new(:name => 'c2',:sequence => 'ATG')]
      @scaf_file, @seq_file = described_class.generate_scaffold_files(entries)
    end

    it "should create the corresponding scaffold file" do
      File.exists?(@scaf_file).should be_true
      scaffold = YAML.load(File.read(@scaf_file))
      scaffold.should == [{'sequence' => {'source' => 'c1'}},
        {'sequence' => {'source' => 'c2'}}]
    end

    it "should create the corresponding sequence file" do
      File.exists?(@seq_file).should be_true
      sequence = File.read(@seq_file)
      sequence.should == ">c1\nATG\n>c2\nATG\n"
    end

  end

  describe "pass an array with a sequence and an unresolved region" do

    before(:all) do
      entries = [Scaffolder::Test::Sequence.new(:name => 'c1',:sequence => 'ATG'),
                 Scaffolder::Test::Unresolved.new(:length => 5)]
      @scaf_file, @seq_file = generate_scaffold_files(entries)
    end

    it "should create the corresponding scaffold file" do
      File.exists?(@scaf_file).should be_true
      scaffold = YAML.load(File.read(@scaf_file))
      scaffold.should == [{'sequence' => {'source' => 'c1'}},
        {'unresolved' => {'length' => 5}}]
    end

    it "should create the corresponding sequence file" do
      File.exists?(@seq_file).should be_true
      sequence = File.read(@seq_file)
      sequence.should == ">c1\nATG\n"
    end

  end
end
