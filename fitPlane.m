function [n, b, qs] = fitPlane(pts)
% given at least k  points p(i) = p(:, i) in k-space, spanning a k-1 affine
% plane
% find the vector most nearly perpendicular to the plane that they span
% a pair of vectors that span that plane, and the coordinates 
% of the points in a coordinate frame based at the first point
% with the two vectors as the coordinate directions. 

k = size(pts, 2);
ctr = mean(pts, 2);

m = pts - repmat(ctr, 1, k);
[u, d, v] = svd(m);
n = u(:, 3);
b = u(:, [1 2]);
m = pts - repmat(pts(:,1), 1, k);

qs = b' * m;
%svd = np.linalg.svd(points - np.mean(points, axis=1, keepdims=True))
%# Extract the left singular vectors
%left = svd[0]
%the corresponding left singular vector is the normal vector of the best-fitting plane
%left[:, -1]
% its dot product with the basis vectors of the plane is approximately zero
%left[:, -1] @ basis