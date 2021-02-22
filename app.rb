# frozen_string_literal: true

require 'roda'
require_relative 'models'

# The core class
class App < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  route do |r|
    r.public if opts[:serve_static]
    @my_tree = Tree.new
    @my_tree.init_from_parsed_file(ParseJsonFile.parsed_data, nil)

    r.root do
      'Hello World'
    end

    r.on 'treenode' do
      view('treenode')
    end
  end
end
