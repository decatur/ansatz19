% COPYRIGHT Wolfgang Kuehn 2015-2016 under the MIT License (MIT).
% Origin is https://github.com/decatur/ansatz19.

addpath('../ansatz17', '../ansatz17/examples');
clear classes; p = QtyExprParser();

[ast, pe] = p.parse('1m');
assert(length(ast), 2);
assert(strcmp(ast{1}.type, 'numerical'));
assert(strcmp(ast{2}.type, 'qty'));

[ast, pe] = p.parse('a m');
assert(length(ast), 2);
assert(strcmp(ast{1}.type, 'identifier'));
assert(strcmp(ast{2}.type, 'qty'));

[ast, pe] = p.parse('1 1/m');
assert(length(ast), 2);
assert(strcmp(ast{1}.type, 'numerical'));
assert(strcmp(ast{2}.type, 'qty'));
assert(strcmp(ast{2}.unit.toString(), '1 1/m'));

[ast, pe] = p.parse('2m/3');
assert(length(ast), 4);
assert(strcmp(ast{2}.type, 'qty'));
assert(strcmp(ast{4}.type, 'divide'));

[ast, pe] = p.parse('2kg + 1kg');
qty = QtyEvaluator(ast).exec();
assert(strcmp(qty.toString(), '3 kilogram'))

[ast, pe] = p.parse('(2m) / delay s');
etor = QtyEvaluator(ast);
scope = struct('delay', 5);
qty = etor.exec(scope);
assert(strcmp(qty.toString(), '0.4 meter/second'));


