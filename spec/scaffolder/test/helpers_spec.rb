require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Scaffolder::Test::Helpers, "#generate_scaffold_files method" do

  describe "#generate_scaffold_files" do

    context "passed an array with a single sequence" do

      before(:all) do
        entries = [Sequence.new(:name => 'c1',:sequence => 'ATG')]
        @scaf_file, @seq_file = described_class.generate_scaffold_files(entries)
      end

      it "should create the corresponding scaffold file" do
        File.exists?(@scaf_file.path).should be_true
        scaffold = YAML.load(File.read(@scaf_file.path))
        scaffold.should == [{'sequence' => {'source' => 'c1'}}]
      end

      it "should create the corresponding sequence file" do
        File.exists?(@seq_file.path).should be_true
        sequence = File.read(@seq_file.path)
        sequence.should == ">c1\nATG\n"
      end

    end

    context "passed an array with two sequences" do

      before(:all) do
        entries = [Sequence.new(:name => 'c1',:sequence => 'ATG'),
                   Sequence.new(:name => 'c2',:sequence => 'ATG')]
        @scaf_file, @seq_file = described_class.generate_scaffold_files(entries)
      end

      it "should create the corresponding scaffold file" do
        File.exists?(@scaf_file.path).should be_true
        scaffold = YAML.load(File.read(@scaf_file.path))
        scaffold.should == [{'sequence' => {'source' => 'c1'}},
          {'sequence' => {'source' => 'c2'}}]
      end

      it "should create the corresponding sequence file" do
        File.exists?(@seq_file.path).should be_true
        sequence = File.read(@seq_file.path)
        sequence.should == ">c1\nATG\n>c2\nATG\n"
      end

    end

    context "passed an array with a sequence and an unresolved region" do

      before(:all) do
        entries = [Sequence.new(:name => 'c1',:sequence => 'ATG'),
                   Unresolved.new(:length => 5)]
        @scaf_file, @seq_file = generate_scaffold_files(entries)
      end

      it "should create the corresponding scaffold file" do
        File.exists?(@scaf_file.path).should be_true
        scaffold = YAML.load(File.read(@scaf_file.path))
        scaffold.should == [{'sequence' => {'source' => 'c1'}},
          {'unresolved' => {'length' => 5}}]
      end

      it "should create the corresponding sequence file" do
        File.exists?(@seq_file.path).should be_true
        sequence = File.read(@seq_file.path)
        sequence.should == ">c1\nATG\n"
      end

    end

  end

  describe "#generate_gff3_file" do

    subject do
      described_class.generate_gff3_file(records)
    end

    context "passed an empty array" do

      let(:records){ [] }

      it "should create a file" do
        File.exists?(subject.path).should be_true
      end

      it "should generate an empty gff3 file" do
        File.read(subject.path).should == "##gff-version 3\n"
      end

    end

    context "passed an array with a single record" do

      let(:records){ [Annotation.new(
        :seqname => 'c1', :start => 4, :end => 6, :strand => '+',:phase => 1)] }

      it "should create a file" do
        File.exists?(subject.path).should be_true
      end

      it "should generate an empty gff3 file" do
        record = "c1\t.\tCDS\t4\t6\t.\t+\t1\t.\n"
        File.read(subject.path).should == "##gff-version 3\n" + record
      end

    end

  end

end
