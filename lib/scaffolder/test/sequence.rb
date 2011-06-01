require 'scaffolder'

module Scaffolder::Test
  class Sequence

    def initialize(options = {})
      @options = options
    end

    def initialize_copy(source)
      super
      @options = @options.dup
    end

    [:name,:sequence,:reverse,:start,:stop,:inserts].each do |attribute|
      define_method(attribute) do |*arg|
        unless arg.first
          return @options[attribute]
        end
        @options[attribute] = arg.first
        return self
      end
    end

    def to_hash
      hash = {'source' => name}
      [:start,:stop,:reverse].each do |attribute|
        hash[attribute.to_s] = @options[attribute] if @options[attribute]
      end
      if @options[:inserts]
        hash['inserts'] = Array.new
        @options[:inserts].each_with_index do |insert,i|
          hash['inserts'] << {'open' => insert[:open], 'close' => insert[:close],
            'source' => "insert#{i+1}"}
        end
      end
      {'sequence' => hash}
    end

    def to_fasta
      fasta = Bio::Sequence.new(sequence).output(:fasta,:header => name)
      inserts.each_with_index do |insert,i|
        fasta << Bio::Sequence.new(insert[:sequence]).output(:fasta,:header => "insert#{i+1}")
      end if inserts
      fasta.strip
    end

  end
end
