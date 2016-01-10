classdef QtyExprParser < FuncExprParser
%
%Usage:
%   p = QtyExprParser();
%   [ast, parseError] = p.parse('2kg + 1kg');
%   qty = QtyEvaluator(ast).exec()    % qty = 3 kilogram
%
%   ast = p.parse('(2m) / delay s');
%   etor = QtyEvaluator(ast);
%   scope = struct('delay', 5);
%   qty = etor.exec(scope)            % qty = 0.4 meter/second
%
% COPYRIGHT Wolfgang Kühn 2015-2016 under the MIT License (MIT).
% Origin is https://github.com/decatur/ansatz19.


    methods
        
        function node = parseUnits(this, node)
            if ~(strcmp(this.token.type, 'identifier') || (strcmp(this.token.type, 'numerical') && this.token.value == '1'))
                return
            end

            qty = Qty(1);
            qty.numerator = {this.token.value};
            this.next();

            while this.token.type == '/' || this.token.type == '*'
                type = this.token.type;
                this.next();
                
                if ~strcmp(this.token.type, 'identifier')
                    this.previous();
                    break;
                end

                if type == '*'
                    qty.numerator{end+1} = this.token.value;
                else
                    qty.denominator{end+1} = this.token.value;
                end

                this.next();
            end

            node = struct('type', 'qty', 'value', this.astNode(node), 'unit', qty);
        end

        function node = numericalNode(this, value)
        % Overloads function in ExprParser class.
            node = struct('type', 'numerical');
            node.value = str2double(value);

            node = this.parseUnits(node);
        end

        function node = identifierNode(this, value)
        % Overloads function in ExprParser class.
            node = struct('type', 'identifier');
            node.value = value;

            node = this.parseUnits(node);
        end

    end
end
