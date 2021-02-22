# frozen_string_literal: true

require_relative 'node'

# The class describes as a tree looks like
class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert_root(node)
    @root = node if @root.nil?
  end

  def find_node(key, start_node = @root)
    return start_node if key == start_node.title

    start_node.children.each do |value|
      node = find_node(key, value)
      return node unless node.nil?
    end
    nil
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
      data_from_file['children']&.each do |dat|
        init_from_parsed_file(dat, @root)
      end
    else
      temp = Node.new(data_from_file['title'], data_from_file['description'], [], parent)
      parent.add_children(temp)
      data_from_file['children']&.each do |dat|
        init_from_parsed_file(dat, temp)
      end
    end
  end
end
