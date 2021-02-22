# frozen_string_literal: true

# a temporary file for debugging purposes only

require_relative 'tree'
require_relative 'node'
require 'json'
require_relative 'parse_json_file'

puts 'START'
test_tree = Tree.new

test_tree.init_from_parsed_file(ParseJsonFile.parsed_data, nil)
# test_tree.print_tree(test_tree.root, 0)
