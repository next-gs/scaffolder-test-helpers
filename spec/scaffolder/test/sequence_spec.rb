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

end
