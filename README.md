A simple Quantity and its Parser implementation for GNU Octave and MATLAB®.

# Requirements
GNU Octave version minimum 4.0 or MATLAB about version 2008 (verified for 2013b).

# Dependencies
You must add these files from https://github.com/decatur/ansatz17:
* Parser.m
* examples/ExprParser.m
* examples/FuncExprParser.m
* examples/ExprEvaluator.m

# Quantity

## Usage
```
mass = Qty(81, 'kg')        % 81 kg
mass.to('g')                % 81000 g

height = Qty('1.88 m')      % 1.88 m
height.to('cm')             % 188 cm
bmi = mass/height^2         % 22.9176 kilogram/meter/meter

2/height                    % 1.06383 1/m
mass.to('m')                % error: Cannot onvert kg to m
mass + height               % Arguments 81 kg and 1.88 m are not compatible by unit
```

# Quantity Parser

The Quantity Parser extends FuncExprParser, see ...

## Usage
```
addpath('../ansatz17', '../ansatz17/examples')
p = QtyExprParser();
[ast, parseError] = p.parse('2kg + 1kg');
etor = QtyEvaluator(ast);
qty = etor.exec()                 % qty = 3 kilogram

[ast, parseError] = p.parse('(2m) / delay s');
etor = QtyEvaluator(ast);
scope = struct('delay', 5);
qty = etor.exec(scope)            % qty = 0.4 meter/second
```