# frozen_string_literal: true

# The class describing what a tree node looks like
class Node
  attr_accessor :title, :description, :children, :parent

  def initialize(title, description, children, parent)
    @title = title
    @description = description
    @children = children
    @parent = parent
  end

  def print
    gav = ''
    children.each do |sam|
      gav.concat(sam.title)
    end
    puts "#{@title}. Мои дети #{gav}"
  end

  def add_children(node)
    children.append(node)
  end
end
