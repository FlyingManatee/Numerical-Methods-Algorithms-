function [L, U, P] = luFactor(A)
%Summary: This function is used to pivot and find the [L], [U] and [P]
%matrix from a given coefficient matrix.
%Input:
%   A = coefficient matrix
%Output:
%   L = Lower Triangular Matrix
%   U = Upper Triangular Matrix
%   P = Pivot Matrix
%Instructions:
%   Enter the [A] matrix of coefficients. 

if nargin > 1 %These arguments check that there is one input
    error('Too many inputs')
elseif nargin < 1
    error('Please input matrix')
end

[r,col]=size(A); %This If loop checks to make sure the matrix is square
if r~=col
    error('Matrix isnt square')
end

d = length(A); %Sets the lenght of matrix A equalt to d
U = A; %Sets U equal to A
L = eye(d); %Creates an Identity matrix of 'd' dimensions and is then set equal to L
P = eye(d); %Creates an Identity matrix of 'd' dimensions and is then set equal to P
for g = 1:d %This sets 'g' equal to an array that goes from 1 to 'd'
    [~,mx] = max(abs(U(g:d,g))); %This scans through the matrix U and find the maximum
    %magnitude in the matrix
    mx = mx+(g-1); %This sets 'max' equal to the the row that is being operated on
    
    temp = P(:,1); %This rearranges the 'P' matrix by setting first row as temp
    P(1,:) = P(g,:); %Sets row tith lower values equat to pivot row
    P(g,:) = temp; %Sets max value row on top
    
    
    temp = L(g,1:g-1); %This does the same to the 'L' matrix so that it follows the pivoting
    L(g,1:g-1) = L(mx,1:g-1);
    L(mx,1:g-1) = temp;
    
    temp = U(g,g:end); %Finally, this does the same as the previous 2 and rearranges the U matrix
    U(g,g:end) = U(mx,g:end);
    U(mx,g:end) = temp;

    
    L(g,g) = 1; %This sets the matrix coordinate (g,g) equal to 1
    for vec = (1+g):size(U,1) %'vec' then sets up a vector for value inputs
       mult_fact = U(vec,g)/U(g,g); %Calculates what the vector is multiplied by
       % to produce a coefficent of zero
       U(vec,g:d) = U(vec,g:d)-U(g,g:d)*mult_fact; %This does the multiplication and 
       %subtraction for the Gauss elimination 
       L(vec,g) = mult_fact; %Take L matrix and inputs the 'mult_fact' value in that coordinate
    end
end
disp('P')%All these just display the outputs in an organized manner
disp(P)
disp('U')
disp(U)
disp('L')
disp(L)
end

