function [S, T, U, V] = flatten(fourPoints, startPos, startDir)
% given four 3D points forming a quad A, B, C, D, find a near-congruent
% quad in the plane, mapping A to startPos, and B to a point on the ray
% from startPos in the startDir direction. Return the corresponding four
% points in  S, T, U, V, and an estimate of the non-flatness in e. 
pts = fourPoints;
[n, b, qs] = fitPlane(pts);

b1 = qs(:, 2);
b1 = b1 / vLength(b1);
b2 = [-b1(2); b1(1)];
u = dot(qs(:, 4), b2);
if (u < 0) 
    b2 = -b2;
end
rs = [b1, b2]' * qs; % A at origin; B on +x; D in +y-halfplane.

c1 = startDir(:)/vLength(startDir(:));
c2 = [c1(2); -c1(1)];
ss = [c1, c2] * rs;
ss = ss + repmat(startPos(:), 1, 4);
S = ss(:, 1);
T = ss(:, 2);
U = ss(:, 3);
V = ss(:, 4);



