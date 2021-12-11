function ave = average(x)
% Define a function in a file named average.m that 
% accepts an input vector, 
% calculates the average of the values, 
% and returns a single result.

ave = sum(x(:))/numel(x); 
end