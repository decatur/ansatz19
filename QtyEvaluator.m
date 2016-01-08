classdef QtyEvaluator < Evaluator
% COPYRIGHT Wolfgang Kuehn 2016 under the MIT License (MIT).
% Origin is https://github.com/decatur/ansatz19.


methods (Access = public)

    function value = qty(this, node)
        value = node.unit;
        value.scalar = this.ast{node.value}.value;
    end

end % methods

end % classdef