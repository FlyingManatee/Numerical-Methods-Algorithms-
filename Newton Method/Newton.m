function [root, ea, iter] = Newton(f, df, xr, es, maxiter)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 3
    error('Need more')
elseif nargin < 4
    es = 0.001;
end
if nargin < 5
    maxiter = 20;
end

iter = 0;
ea = 100*es;

x = linspace(0, 10);
hold on
refline(0,0)
plot(x, f(x))
plot(xr, f(xr), 'x')
hold off

while (ea >= es) && (iter < maxiter)
    xr_new = xr - (f(xr)/df(xr));
    if xr ~= 0
    ea = abs((xr_new - xr)/xr)*100;
    end
    iter = iter + 1;
%     hold on
%     refline(0,0)
%     plot(x, f(x))
%     plot(xr, f(xr), 'x')
%     title('iteration')
%     hold off

    xr = xr_new;
    
    data(iter, 1) = xr_new;
    data(iter, 2) = ea;
    
   fprintf('root = %.16e \t iteration = %i \t error = %e \n', xr_new, iter, ea)
   
   plot(xr, f(xr), 'x')
end
root = xr_new;
plot(root, f(root), 'o')

end

