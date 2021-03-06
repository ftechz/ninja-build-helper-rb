module Ninja
  module VERSION #:nodoc:
    MAJOR, MINOR, PATCH, PRE = [0, 2, 0, 0]
    STRING = [MAJOR, MINOR, PATCH, PRE].compact.join('.')
  end

  # Returns the semantic version of Ninja.
  def self.version
    Ninja::VERSION::STRING
  end
end
