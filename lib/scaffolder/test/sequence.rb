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
      hash = {'source' => name}.merge stringify_keys(@options)
      if @options[:inserts]
        hash['inserts'] = Array.new
        @options[:inserts].each_with_index do |insert,i|
          hash['inserts'] << {'source' => "insert#{i+1}"}.merge(stringify_keys(insert))
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

    private

    def stringify_keys(hash)
      [:start,:stop,:reverse,:open,:close].inject(Hash.new) do |stringified,key|
        stringified[key.to_s] = hash[key] if hash[key]
        stringified
      end
    end

  end
end
