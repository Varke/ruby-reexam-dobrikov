# frozen_string_literal: true

require_relative 'tree'
require_relative 'node'

# Checker params from form
module InputValidators
  def self.check_key(raw_key)
    key = raw_key || ''
    {
      key: key
    }
  end
end
