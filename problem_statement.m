%% Specify the problem space
% Total number of observations in X
N = 200;

% Total number of dimensions in raw data (i.e., number of voxels).
d = 1000;

% Number of voxels that carry meaningful signal
s = 50;

% Size of the subspace in which meaningful signal resides.
r = 5;

% Weighting of components in r space
D = eye(r);

% Values for the sparse set of voxels in r space.
s1 = rand(s,r);

% Covariance  of the sparse set of voxels, subject to mixing matrix D.
S = s1*D*s1';

% Check: the rank of this matrix should be r
rank(S)

% Specify the true weights to map between X and Y
W = zeros(d);
W(1:s,1:s) = S;
% Sanity checks:
%   1. Rank should be r
rank(W)

%   2. Should be able to reconstruct W from first r eigenvectors and mixing
%   matrix:
[U, Dhat, V] = svd(W);
Dhat = Dhat(1:5,1:5);
U = U(:,1:5);
V = V(:,1:5);
norm(W - U*Dhat*V')

% Generate X
X = randn(N,d);

% Generate Y
Y = X * W * X';

%% Question: How can we recover W?

