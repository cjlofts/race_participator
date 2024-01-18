# frozen_string_literal: true

require_relative "race_participator/version"
require_relative "race_participator/search"
require 'json'

module RaceParticipator

  file = File.read("lib/race_data/startlists.json")
  parsed_file = JSON.parse(file)

  case ARGV[0]
  when nil
    puts "specify 'all' or a search parameter"
  when 'all'
    puts parsed_file
  when 'search'
    puts RaceParticipator::Search.new(parsed_file).call
  else
    puts 'argument not recognised'
  end
      
end
