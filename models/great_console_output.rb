# frozen_string_literal: true

# Helper module for formatting tree output to the console
module GreatConsoleOutput
  def self.make_space(count)
    i = 0
    while i < count * 3
      i += 1
      print ' '
    end
  end
end
