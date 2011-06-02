require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Scaffolder::Test::Sequence do

  describe "basic instance" do
    subject do
      described_class.new(:name => 'contig1',:sequence => 'ATGCCC')
    end

    its(:name)    {should == 'contig1'}
    its(:sequence){should == 'ATGCCC'}

    its(:to_fasta){should == ">contig1\nATGCCC"}
    its(:to_hash) {should == {'sequence' => {'source' => 'contig1'}} }
  end

  describe "with an insert" do

    describe "added as a hash at initialisation" do

      subject do
        described_class.new(:name => 'contig1',:sequence => 'ATGCCC',:inserts =>[{
          :open => 3, :close => 4, :sequence => 'TTT'}])
      end

      its(:name)    {should == 'contig1'}
      its(:sequence){should == 'ATGCCC'}

      its(:to_fasta){should == ">contig1\nATGCCC\n>insert1\nTTT"}
      its(:to_hash) {should == {'sequence' => {'source' => 'contig1','inserts' => [{
        'open' => 3, 'close' => 4, 'source' => 'insert1'}]}} }

    end

    describe "added singularly to an existing contig" do

      subject do
        contig = described_class.new(:name => 'contig1',:sequence => 'ATGCCC')
        contig.inserts({:open => 3, :close => 4, :sequence => 'TTT'})
      end

      its(:name)    {should == 'contig1'}
      its(:sequence){should == 'ATGCCC'}

      its(:to_fasta){should == ">contig1\nATGCCC\n>insert1\nTTT"}
      its(:to_hash) {should == {'sequence' => {'source' => 'contig1','inserts' => [{
        'open' => 3, 'close' => 4, 'source' => 'insert1'}]}} }

    end

    describe "added singularly to an existing contig" do

      subject do
        contig = described_class.new(:name => 'contig1',:sequence => 'ATGCCC')
        contig.inserts({:open => 3, :close => 4, :sequence => 'TTT'})
      end

      its(:name)    {should == 'contig1'}
      its(:sequence){should == 'ATGCCC'}

      its(:to_fasta){should == ">contig1\nATGCCC\n>insert1\nTTT"}
      its(:to_hash) {should == {'sequence' => {'source' => 'contig1','inserts' => [{
        'open' => 3, 'close' => 4, 'source' => 'insert1'}]}} }

    end

    describe "added as an array to an existing contig" do

      subject do
        contig = described_class.new(:name => 'contig1',:sequence => 'ATGCCC')
        contig.inserts([{:open => 3, :close => 4, :sequence => 'TTT'}])
      end

      its(:name)    {should == 'contig1'}
      its(:sequence){should == 'ATGCCC'}

      its(:to_fasta){should == ">contig1\nATGCCC\n>insert1\nTTT"}
      its(:to_hash) {should == {'sequence' => {'source' => 'contig1','inserts' => [{
        'open' => 3, 'close' => 4, 'source' => 'insert1'}]}} }

    end
  end

  [:start,:stop,:reverse].each do |attribute|

    describe "instance with #{attribute} attribute" do

      let(:value){:value}
      subject do
        described_class.new(:name => 'contig1',:sequence => 'ATGCCC',
                            attribute => value)
      end

      its(:name)    {should == 'contig1'}
      its(:sequence){should == 'ATGCCC'}
      its(attribute){should == value}

      its(:to_fasta){should == ">contig1\nATGCCC"}
      its(:to_hash) do
        should == {'sequence' => {'source' => 'contig1', attribute.to_s => value}}
      end

    end

    describe "chaining instance attributes" do

      let(:value){:value}
      subject do
        instance = described_class.new(:name => 'contig1',:sequence => 'ATGCCC')
        instance.send(attribute,value)
      end

      its(attribute){should == value}

    end

  end

  describe "#clone" do

    it "should also duplicate the internal options state" do
      a = described_class.new(:name => 'contig1',:sequence => 'ATGCCC')
      b = a.clone

      a.instance_variable_get("@options").
        should_not equal(b.instance_variable_get("@options"))
    end

  end
end
