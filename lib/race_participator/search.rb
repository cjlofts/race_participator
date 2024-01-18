# frozen_string_literal: true

module RaceParticipator
  class Search

    def initialize(file)
      @file = file
    end

    def call
      return "specify search value" if search_value.nil? 
      return "search key not recognised" unless searchable_keys.include?(search_key)
      
      query_result = file.select do |race_detail|
        race_detail[search_key] == search_value
      end

      query_result.empty? ? "no results for search" : query_result
    end

    private
    
    attr_reader :file

    def search_key
      @search_key ||= ARGV[1]
    end

    def search_value
      @search_value ||= ARGV[2]
    end

    def searchable_keys
      file.first.keys
    end

  end 
end
