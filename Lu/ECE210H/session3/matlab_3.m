 %{
    Welcome to ECE210 Honors Section: Session #3. 
    Last session we learnt about control flow and plotting with subplots.
    Today we will continue to work with looping constructs and start
    defining out own functions.
 %}

%%

%{
    To get help on a function, type the keyword, highlight it, right click
    and select "Help on Selection". If nothing shows up, try googling the
    keyword and Matlab.
%}

%%

%{
    Schedule:

    [Done] Week1: Matlab: Mathematical functions, Graphing tools, Vector and Matrix arithmetic
    [Done] Week2: Matlab: Control flow, iterative and vectorized solution
    Week3: Matlab: Control flow, iterative and vectorized solution
%}


%% 02/20/2018: Matlab: Control flow, iterative and vectorized solution

%% Syntax:

%{
    if expression
       statements
    elseif expression
       statements
    else
       statements
    end

    ---
%
    for index = values
       program statements
              :
    end
 
    ---
%
    while expression
       statements
    end
%}

%% Exercise 1

% Exercise 1: Referring to the attached .jpg document, make a plot of
% current i versus time t. Give appropriate axis labels and title. In
% addition, verify that your plot is correct by checking for the value of
% i(2)=1-exp(-2) and i(6)=(1-exp(-2))*exp(-1). Your figure should be
% similar to the one on Piazza.

% Note that i(2) refers to the value of current at t = 2 seconds.

% the switch goes from position A to position B at time = 0
% the switch goes from position B to position A at time = 2

% general guide:
% define circuit parameters
% define initial conditions
% step through in time
% plot the results

%% Start by defining your circuit parameters R and L:
clc, close all, clear all
R=1;
R2=0.25;
L=1;

% Initialize your variables
% initialize i(0), di/dt(0)
% di/dt is labeled as di in the code
% delta is labeled as h in the code
% use a step size of 0.001
i=0;
di=1/L;
h=0.001;

% Stepping through time

index = 1;

for t = 0:h:10
    
    % update variable i with di
    % specifically, i(t+h) = i(t) + h * di/dt(t)
    % You cannot type the above line below. All comments similar to
    % the previous line are mathematical expressions. 
    
    % <----- Here is space for you to complete this section ----->
    i = i + h*di;
    
    % update variable di with i
    % specifically, di/dt(t+h) = (1-i)/L if 0<t<2, 
    %                            (-iR)/L if t>2
    if t > 0 && t < 2
        di = (1-i)/L;
    elseif t>=2
        di = (-i*R)/L;
    end
    % <----- Here is space for you to complete this section ----->

    
    
    % saving the variables
    tout(index) = t;
    iout(index) = i;
    di_out(index) = di;
    index = index + 1;
end

% Plot the results

% Plot a graph of iout vs tout. Label your graph appropriately.
% Mark the values at t = 2 seconds and t = 6 seconds on your plot.
% Find the index for t = 2 and 6 seconds and plot horizontal and vertical
% lines to mark the point on the graph.
% Verify your results with the expected plot on Piazza.

% <----- Here is space for you to complete this section ----->



% Plot a graph of di_out vs tout. Label your graph appropriately.
% Verify your results with the expected plot on Piazza.

% <----- Here is space for you to complete this section ----->
subplot(2,1,1)
plot(tout,iout);
xlabel('tout');
ylabel('iout');
hold on
plot(tout(2000), iout(2000), 'r*')
hold on
plot(tout(6000), iout(6000), 'b*')

subplot(2,1,2)
plot(tout, di_out);
xlabel('tout');
ylabel('di_out');



%% Exercise 2: Approximate the value of pi
clc, clear all, close all
format long g

% Task 1:   Find a Converging Infinite Series that sums to pi 
%           https://en.wikipedia.org/wiki/List_of_formulae_involving_%CF%80#Other_infinite_series
% Task 2:   Find the sum using a for loop for N=1:100, plot the error of the 
%           summation, (pi-estimate) against N (number of iterations)
% Task 3:   Find the number of iterations such that error < 1e-6, 
%           (hint: use a while loop and use a counter). Repeat for 1e-9

% <----- Here is space for you to complete this section ----->

N=1:100
pi_estimate=zeros(1,length(N));
sum = 0;
error = 1:100;

for i=N 
    sum = sum + (-1)^(i+1)/(2*i-1);
    pi_estimate(i)=(sum*4);
    error(i) = pi - pi_estimate(i); 
end
subplot(2,1,1)
plot(N, pi_estimate)
xlabel('N');
ylabel('pi_estimate')
title('pi-estimate against N')
subplot(2,1,2)
plot(N, error)
xlabel('N');
ylabel('error');
title('error against N')

j = 1;
counter_1=0;
ocunter_2=0;
sum = 0;
error_1=0;
while (j <= 1000)
    sum = sum + (-1).^(j+1)/(2*j-1);
    error_1 = abs(pi - sum*4);
    if error_1 < 10^(-6)
        counter_1 = j;
        break;
    end
    j=j+1;
end
sum=0;
k = 1;
error_2=0;
while (k <= 10000)
    sum = sum + (-1).^(k+1)/(2*k-1);
    error_1 = abs(pi - sum*4);
    if error_1 < 10^(-9)
        counter_2 = k;
        break;
    end
    k=k+1;
end
       

%% What is a function?

%{
    A function has a name so that you can call it by its name
    A function may take some inputs in the parenthesis on the right
    A function may give some outputs before the equality sign on the left
    It is like one of the black boxes that you define in ECE210

    Please read the following very carefully:

    Syntax: 
    function [y1,...,yN] = myfun(x1,...,xM)

    Description:
    function [y1,...,yN] = myfun(x1,...,xM) declares a function named myfun
    that accepts inputs x1,...,xM and returns outputs y1,...,yN. This
    declaration statement must be the first executable line of the
    function.

    Save the function code in a text file with a .m extension. The name of
    the file should match the name of the first function in the file. Valid
    function names begin with an alphabetic character, and can contain
    letters, numbers, or underscores.

    You can declare multiple local functions within the same file, or nest
    functions. If any function in a file contains a nested function, all
    functions in the file must use the end keyword to indicate the end of
    the function. Otherwise, the end keyword is optional.
%}

%% Example: Function Definition

%  Create a new function file, save it as myphase.m

%  Copy the following definition into the file:
%{
    function [ z_phase ] = myphase( z )
    % This function returns the phase of the complex number z

    z_phase = angle(z);

    end
%}

%   Save the file and execute the following commands:
%{
    z = 1+j;
    z_phase = myphase(z)
%}

%% Exercise 3: Function that sorts a vector

% Write a function SortVec, that sort a given vector of numbers in
% ascending order. You guys can use any algorithm you want to solve this
% problem. I would recommend looking at selection, bubble or merge sort.

% You will need to use atleast two looping structures to solve this
% problem. Be prepared to explain how the algorithm works during the demo
% next week.

% <----- Here is space for you to complete this section ----->

input = [1 0 -1 2 7 4];
sort = SortVec(input)

