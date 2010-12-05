module Scaffolder::Test::Helpers

  def write_sequence_file(*sequences)
    file = Tempfile.new("sequence").path
    File.open(file,'w') do |tmp|
      sequences.flatten.each do |sequence|
        seq = Bio::Sequence.new(sequence[:sequence])
        tmp.print(seq.output(:fasta,:header => sequence[:name]))
      end
    end
    file
  end

  def write_scaffold_file(scaffold)
    file = Tempfile.new("scaffold").path
    File.open(file,'w'){|tmp| tmp.print(YAML.dump(scaffold))}
    file
  end

end
