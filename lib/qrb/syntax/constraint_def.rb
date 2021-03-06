module Qrb
  module Syntax
    module ConstraintDef

      def compile(factory)
        constraints.compile(var_name.to_s)
      end

      def to_ast
        ast = constraints.to_ast(var_name.to_s)
        ast = [ast] if ast.first.is_a?(Symbol)
        ast
      end

    end # module ConstraintDef
  end # module Syntax
end # module Qrb
