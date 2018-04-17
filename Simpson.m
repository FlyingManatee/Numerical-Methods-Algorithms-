function [I] = Simpson(x, y)
%Summary: This function uses the Simpsons 1/3 Rule to estimate the
%integral over an interval. 
%Inputs: 
%        x = X array of values (Must be evenly spaced)
%        y = Y array of values 
%Outputs: 
%        I = The integral of the given points.
%   

% Do error checks
if nargin < 2
    error('Need at least 2 arguments')
end
%Checks that the lengths are equal
if length(x) ~= length(y)
    error('Not equal number of values in x and y')
end


intervalx = (size(x)-1);
if mod(intervalx,2) == 0
else 
    disp('WARNING! Will use trapezoidal rule')
end

intx = diff(x);
if intx(1)~= intx(1,:)
    error('Not equal intervals on x-axis')
end
Length = length(x);
a = min(x); % Sets a as the lower bound.
b = max(x); % Sets b as the upper bound.
x1 = 0; % Initializes variables
x2 = 0;
x3 = 0;
x4 = 0;
 
% This takes the sum of each segment
for S = 1:2:(Length-1) 
    x1 = (y(:,S)) + 2;
    x2 = x1 + x2;
end
 
% This sums the values for the even segments in the interval
for j = 2:2:(Length-2)
    x3 = (y(:,j));
    x4 =  x3 + x4;
end
 
% Calculatioons for the trapezoidal rule
trapezoid = ((x(1,length(x)))- (x(1,length(x)-1)))*((y(1,length(x)-1)+(y(1,length(y)))))/2;
 
% If there is an odd number of intervals simpsons rule is used
if mod(intervalx,2) == 1 
    %Formula for Simpson's 1/3
    I = (b-a).*((y(1,1)) + 4.*(x2) + 2.*(x4) + y(1,(Length)))/(3.*Length);
% If there is an even number of intervals, both simpsons and trapezoid are used 
else
    %Composite Simpson's 1/3 and Trapezoid rule function
    I = ((b-a).*((y(1,1)) + 4.*(x2) + ((x4/2)) + y(1,(Length)))/(3.*(length(x)))) + trapezoid;
end
 

I
 
end

