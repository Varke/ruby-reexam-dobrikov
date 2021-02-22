# frozen_string_literal: true

require 'json'

# The module parsing json file
module ParseJsonFile
  def self.parsed_data
    string_info = File.read(File.expand_path('../Romanov.json', __dir__))
    JSON.parse(string_info)
  end
end
