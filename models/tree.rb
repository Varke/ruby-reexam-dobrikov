# frozen_string_literal: true

require_relative 'node'
require_relative 'great_console_output'

# The class describes as a tree looks like
class Tree
  def initialize
    @root = nil
  end

  def insert_root(node)
    @root = node if @root.nil?
  end

  def find_node(node_title, start_node)
    if @root.nil?
      puts 'The tree is empty'
    elsif start_node.title != node_title
      start_node.children.each do |value|
        find_node(node_title, value)
      end
    else start_node.print
    end
  end

  def print_tree(node, level)
    if @root.nil?
      puts 'The tree is empty'
    elsif level >= 0 && !@root.nil?
      level += 1
      node.print
      node.children.each do |value|
        GreatConsoleOutput.make_space(level)
        print_tree(value, level)
      end
    end
  end
end
