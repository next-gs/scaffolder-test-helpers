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

    [:name,:sequence,:reverse,:start,:stop].each do |attribute|
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
      {'sequence' => hash}
    end

    def to_fasta
      Bio::Sequence.new(sequence).output(:fasta,:header => name).strip
    end

  end
end
