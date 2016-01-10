classdef QtyEvaluator < ExprEvaluator
%
% COPYRIGHT Wolfgang Kuehn 2015-2016 under the MIT License (MIT).
% Origin is https://github.com/decatur/ansatz19.


methods (Access = public)
    
    function this = QtyEvaluator(ast)
        this = this@ExprEvaluator(ast);
    end
    
    function value = qty(this, node)
        value = node.unit;
        value.scalar = this.ast{node.value}.value;
    end

end % methods

end % classdef