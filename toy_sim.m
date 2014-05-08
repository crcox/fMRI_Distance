%% Define ``eigenvectors''
% Things of type A cluster around 1,1,1 in the ``eigen space'', and things
% of type B cluser around -1,-1,-1.
A = bsxfun(@plus,randn(10,3),1);
B = bsxfun(@plus,randn(10,3),-1);

U = [A;B];

%% Generate a low rank X matrix, based on these eigenvectors.
X = U*eye(3)*U';

imagesc(X)