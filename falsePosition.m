function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
%The flasePosition function uses the false position method to find accurate
%approximations for function values (dependent variables)
%Inputs:
%   func - The function to be approximated
%   x_l - The lower guess
%   x_u - The upper guess
%   es - Relative error (the default error is set to 0.0001%)
%   maxiter - Numeber of iterations (the default is set to 200)
%Outputs:
%   root - Apprximated root location on function
%   fx - Function value at location of root
%   ea - Approximate relative error in %
%   iter - Number of iterations performed


if nargin < 3 %This checks to see if too few variables were entered
    error('Come on, stop being so stingy. Give me 3 at least')
elseif nargin == 3 %This makes sure that 3 variables have been entered
    %and then assigns es and MaxIter
    es = 0.0001;
    maxiter = 200;
elseif nargin == 4 %If 4 variables are entered, the function assigns MaxIter
    maxiter = 200;
elseif nargin > 5 %If more than 5 variables are assigned throw an error
    error('Dont be too generous with those variables now')
end


RootTest = func(xl) * func(xu); %The purpose of this segment of code is to
%test and see if the guesses entered are the root or if the guess can be
%used in the false position function to find the root.
if RootTest == 0
    error('SWEET, YOU GUESSED THE ROOT! Most Triumphant dude!')
elseif RootTest > 0 
    error('There is no root between the guesses. Try again, nerd')
end


FirstRoot = 0; %Initiating values
iter = 0;
while iter<= maxiter %While the iteration value is less or equal
    %to the MaxIter
    iter = iter+1; %This adds an iteration every time the code runs through
    %the loop 
    root = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu))); %This is the root
    %equation 
    fx = func(root); %This outputs a value for the y-axis once the root
    %equation is evaluated
    
    
    if root ~= 0 %This nested if statement evaluates the approx. relative
        ea = abs((root - FirstRoot)/root)*100; %Equation to evaluate error 
        FirstRoot = root;
    end
    
    if func(xu)*func(root) < 0 %This if-loop multiplies the guesses with
        %the root and then evaluates the error to see if the root has been
        %found
        xl = root;
    elseif func(xl)*func(root) < 0
        xu = root;
    end
    
    if ea < es || iter >= maxiter %Evaluates the approx. relative error to
        %the relative error to test if the minimum has been reached. Also
        %makes sure the number if iterations has not exceeded max
        %iterations
        break
    end
end

fprintf('Approx. Relative Error %f\n',ea)
fprintf('Number of Iterations: %f\n', iter)
fprintf('Root %f\n', root)
end

