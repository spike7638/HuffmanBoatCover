function p = addSkirt(pts, skirtLengths)
k = size(pts, 2);
q = zeros(2, k); % skirt rectangles

for i = 1:(k/4)
    indexes = 4*(i-1) + (1:4); 
    p = pts(:, indexes);
    A = p(:, 1);
    D = p(:, 4);
    v1 = D - A;
    v2 = [v1(2); -v1(1)]; % CW rotation
    v2 = skirtLengths(i) * v2 / vLength(v2);
    q(:, indexes) = [A, D, D + v2, A + v2];
end
p = q;
