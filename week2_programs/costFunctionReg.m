function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

%h = 1./(1.+e.^(-(X*theta)));
%nor = sum((h-y).^2)
%reg = lambda*sum(theta.^2);

h = sigmoid(X*theta);
sig = (-(y'*log(h))-((1-y)'*log(1-h)));
semij = (1./m).*sig;

temp = (lambda/(2*m))*sum(theta(2:size(theta)).^2);

J = semij+temp;

grad(1) = (1/m)*X(:,1)'*(h-y);

for i=2:(size(theta))
  
  grad(i) = (1/m)*X(:,i)'*(h-y)+((lambda/m)*theta(i));

end


% =============================================================

end
