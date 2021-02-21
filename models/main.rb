# frozen_string_literal: true

# a temporary file for debugging purposes only

require_relative 'tree'
require_relative 'node'

puts 'START'
my_node1 = Node.new('First son of Root', 'some description', [], nil)
my_node2 = Node.new('Second son of Root', 'some description', [], nil)
my_node3 = Node.new('Third son of Root', 'some description', [], nil)
my_node4 = Node.new('First son of Four node', 'some description', [], nil)
my_node5 = Node.new('Fourth son of Root', 'some description', [my_node4], nil)
my_node = Node.new('Must be root', 'Description test', [my_node1, my_node2, my_node3, my_node5], nil)
my_tree = Tree.new
my_tree.insert_root(my_node)
my_tree.print_tree(my_node, 0)
my_tree.find_node('Must be root', my_node)
