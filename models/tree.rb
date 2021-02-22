# frozen_string_literal: true

require_relative 'node'
require_relative 'great_console_output'

# The class describes as a tree looks like
class Tree
  attr_accessor :root

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

  def init_from_parsed_file(data_from_file, parent)
    if @root.nil?
      insert_root(Node.new(data_from_file['title'], data_from_file['description'], [], nil))
      unless data_from_file['children'].nil?
        data_from_file['children'].each do |dat|
          init_from_parsed_file(dat, @root)
        end
      end
    else
      temp = Node.new(data_from_file['title'], data_from_file['description'], [], parent)
      parent.add_children(temp)
      unless data_from_file['children'].nil?
        data_from_file['children'].each do |dat|
          init_from_parsed_file(dat, temp)
        end
      end
    end
  end
end
