# frozen_string_literal: true

# Helper module for formatting tree output to the console
module GreatConsoleOutput
  def self.make_space(count)
    (count * 3).times do
      print ' '
    end
  end
end
