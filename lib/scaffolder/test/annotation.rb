require 'scaffolder'

module Scaffolder::Test
  class Annotation

    [:seqname,:start,:end,:strand,:phase,:feature].each do |attribute|
      define_method(attribute) do |*arg|
        unless arg.first
          return @options[attribute]
        end
        @options[attribute] = arg.first
        return self
      end
    end

    def initialize(options = Hash.new)
      defaults = {:seqname => 'record', :start => 1, :end     => 10,
                  :strand  => '+',      :phase => 1, :feature => 'CDS'}
      @options = defaults.merge(options)
    end

  end
end
