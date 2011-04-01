require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Scaffolder::Test::Sequence do
  subject do
    described_class.new(:name => 'contig1',:sequence => 'ATGCCC')
  end

  its(:name)    {should == 'contig1'}
  its(:sequence){should == 'ATGCCC'}

  its(:to_fasta){should == ">contig1\nATGCCC"}
  its(:to_hash) {should == {'sequence' => {'source' => 'contig1'}} }

end
