% COPYRIGHT Wolfgang Kuehn 2015-2016 under the MIT License (MIT).
% Origin is https://github.com/decatur/ansatz19.

q = Qty(1, 'Hz');
q = q*Qty(3,'s');
assert(strcmp(q.toString(), '3'));

q = Qty(3,'percent').to('1');
assert(strcmp(q.toString(), '0.03'));

% Note that a (astronomical) year has more than 365 days.
assert(fix(Qty('1 year').to('days').scalar) == 365);

assert(strcmp(Qty('1').toString(), Qty('1 1').toString()));
