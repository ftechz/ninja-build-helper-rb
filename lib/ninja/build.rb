module Ninja
  class Build
    attr_reader :rule,
                :inputs,
                :implicit_inputs,
                :output,
                :variables

    def initialize(desc={})
      Description.validate!(desc)

      @rule = desc[:rule]
      @inputs = [*desc[:inputs]]
      @implicit_inputs = [*desc[:implicit_inputs]]
      @output = desc[:output]
      @variables = desc[:variables]
    end

    module Description #:nodoc:
      def self.validate!(desc)
        # This might be overkill, but we want this to be idiot-proof.
        raise "Rule not specified." unless desc.include?(:rule)
         raise "Expected rule to be a string composed of [a-Z,0-9,-,_] characters." unless /\A([-\w]+?)+\z/.match(desc[:rule])

        raise "Inputs not specified." unless desc.include?(:inputs)
         # TODO(mtwilliams): Check type of elements.
         raise "Expected inputs to be an array of paths." unless desc[:inputs].is_a?(Array)
        raise "Output not specified." unless desc.include?(:output)
         # TODO(mtwilliams): Check if paths exist.
         raise "Expected output to be a path." unless desc[:output].is_a?(String)
        raise "Variables not specified." unless desc.include?(:variables)
         raise "Expected variables to be an array of variables." unless desc[:variables].is_a?(Array)
      end
    end
  end
end
