clear; 

f = @(x) (-1.5*x^6-2*x^4+12*x);  %equation in question
g = (((5)^(1/2))-1)/2;   %golden ratio
iter = 1;   %initial iteratipn number
prompt = 'please enter the lower initial guess\n';
xl = input(prompt); %lower initial guess input 
prompt = 'please enter the higher initial guess\n';
xu = input(prompt); %upper initial guess input
prompt = 'please enter the N value\n';
N = input(prompt);  %maximum iteration repatition
xi = xu-xl; %initial guess difference for error calculation
prompt = 'please enter the max error\n';
es = input(prompt); %acceptable error margin
prompt = 'positive number for max or negative number for min\n';
a = input(prompt);  %an number to decide finding maximum or mininmum

%For finding maximum

if a > 0    %inititating maximum algortihm 

    for t=1:N   %opens a loop that repeats itself N times if conditions not met
        d = g*(xu-xl);  %change ratio
        x1 = xl+d;  %changed lower x value
        x2 = xu-d;  %changed upper x value
        f1 = f(x1); %function value for x2
        f2 = f(x2); %function value for x1

            if f1>f2   %compares f(x1) and f(x2) values 
                xl = x2;    %selecting new lower limit
                xopt = x1;  %setting optimized x for error calculation
            end
            if f2>f1   %compares f(x1) and f(x2) values
                xu = x1; %setting a new upper value
                xopt = x2; %setting optimized x for error calculation
            end
            fx = f(xopt)    %calculates optimized f(x) a.k.a maximum
            e = (1-g)*(abs((xu-xl)/xopt))*100;   %error defiinition in the book
            iter = iter+1;  %increases the iteration number to see which iteration conditions are met       
if e<es     %if in iteration conditions are met
                break   %extermiantes the process if conditions are met
            end

    end
end

%for finding minimum
if a < 0    %initiating minimum algorithm
for t=1:N
    d = g*(xu-xl);  %change ratio
    x1 = xl+d;  %changed lower x value
    x2 = xu-d;  %changed upper x value
    f1 = f(x1); %function value for x2
    f2 = f(x2); %function value for x1

    if f1>f2    %compares f1 and f2 values
        xu = x1;    %setting new upper limit
        xopt = x2;  %setting optimized x for error calculation
    end
    if f2>f1    %compares f2 and f1 values
        xl = x2;    %setting new lower limit
        xopt = x1;  %setting optimized x for error calculation
    end
    fx = f(xopt);   %calculates founded maximum in the loop
    e = (1-g)*(abs((xu-xl)/xopt))*100; %error definition in the book
    iter = iter+1;  %increses iteration number 
    if e<es     %compares acceptable error and found error
    break   %if conditions are met breaks out from the loop
end

end
end