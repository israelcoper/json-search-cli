require "json/search/cli/version"
require 'json'
require 'pry'

module Json
  module Search
    class Cli
      class Error < StandardError; end

      def search(keyword)
        collection = parsed_json

        collection.select {|hash| hash["full_name"]&.downcase =~ /#{keyword}/}
      end

      private

      def parsed_json
        @parsed_json ||= begin
          path = File.join(File.join(Dir.pwd, '/data/clients.json'))
          file = File.read path
          json = JSON.parse file

          json["data"]
        end
      end
    end
  end
end
