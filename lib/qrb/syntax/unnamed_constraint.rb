module Qrb
  module Syntax
    module UnnamedConstraint

      def compile(var_name)
        { predicate: expression.compile(var_name) }
      end

      def to_ast(var_name)
        [ :constraint,
          "default",
          [:fn, [:parameters, var_name], [:source, expression.to_s.strip]] ]
      end

    end # module UnnamedConstraint
  end # module Syntax
end # module Qrb
