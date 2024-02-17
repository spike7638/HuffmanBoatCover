function [S, T, U] = flatten3(A, B, C, startPos, startDir)
% given three 3D points forming a triangle A, B, C find a congruent
% triangle in the plane, mapping A to startPos, and B to a point on the ray
% from startPos in the startDir direction, and C somewhere on the right-hand
% side of that ray. Return the corresponding three pts in  S, T, U

S = startPos;
h = vLength(startDir);
startDir = startDir/h;
d = distance(A, B);
T = S + h * startDir; 
v1 = C - A;
v2 = B - A;
dd = dot(v1, v2);
ang = (pi/2) - acos(dd/(vLength(v1)*vLength(v2)));
w2 = (T-S)/vLength(T-S);
w1 = [w2(2); -w2(1)];
U = S + vLength(v1)* [cos(ang); sin(ang)];



function h = distance(A, B)
h = vLength(B-A);
