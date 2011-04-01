require 'scaffolder'

module Scaffolder::Test
  class Sequence

    attr_reader :name
    attr_reader :sequence

    def initialize(opts = {})
      @name     = opts[:name]
      @sequence = opts[:sequence]
    end

    def to_hash
      {'sequence' => {'source' => name}}
    end

    def to_fasta
      Bio::Sequence.new(sequence).output(:fasta,:header => name).strip
    end

  end
end
