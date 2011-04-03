require 'scaffolder'

module Scaffolder::Test
  class Unresolved

    attr_reader :length

    def initialize(options = {})
      @length = options[:length]
    end

    def to_hash
      {'unresolved' => {'length' => length}}
    end

  end
end
