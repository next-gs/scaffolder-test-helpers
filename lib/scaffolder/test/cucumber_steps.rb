require 'scaffolder/test/helpers'
require 'cucumber'

World(Scaffolder::Test::Helpers)

Given /^the scaffold is composed of the sequences:$/ do |sequences|
  @entries = sequences.hashes.map do |seq|
    {'sequence' => {'source' => seq['name']}}
  end
  @sequences = sequences.hashes.map do |seq|
    {:name => seq['name'], :sequence => seq['nucleotides']}
  end

  @sequence_file = write_sequence_file(@sequences)
  @scaffold_file = write_scaffold_file(@entries)
end

Given /^the scaffold file is called "([^"]*)"$/ do |file|
  FileUtils.mv(@scaffold_file,file)
end

Given /^the sequence file is called "([^"]*)"$/ do |file|
  FileUtils.mv(@sequence_file,file)
end
