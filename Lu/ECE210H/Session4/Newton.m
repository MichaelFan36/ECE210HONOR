function [ root ] = Newton( x1, f, df )
% % Calculates the root using Newton's Method
% % x1 is the initial guess
% % f is the function for which the root is to be found
% % df is the derivative of the function
% 
Tol = 10^(-5) %set a tolerance here
xnew = 1000; % This will be the variable used to store the new guess
x = x1; % Initialize the old guess to x1 in the beginning
x_diff = abs(xnew - x); % This variable will hold the difference between
%                           % new guess and old guess
% 
% <------------------Complete while loop-------------------------->
i = 0;
while(x_diff > Tol && i < 10000)
    xnew = x - f(x)/df(x);
    x_diff = abs(xnew - x);
    x = xnew;
    i = i + 1;
end
if i >= 10000
    print('the initial guess is not right')
end
root = x;
end