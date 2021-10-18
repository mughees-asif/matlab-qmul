% Define a function in a file named average.m that 
% accepts an input vector, 
% calculates the average of the values, 
% and returns a single result.

function ave = average(x)
    ave = sum(x(:))/numel(x); 
end