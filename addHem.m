function pHem = addHem(pts, hemWidth)
k = size(pts, 2);
q = zeros(2, k); % hem rectangles

for i = 1:(k/4)
    indexes = 4*(i-1) + (1:4); 
    p = pts(:, indexes);
    B = p(:, 2);
    C = p(:, 3);
    v1 = C - B;
    v2 = [-v1(2); v1(1)]; % CW rotation
    v2 = hemWidth * v2 / vLength(v2);
    q(:, indexes) = [B, C, C + v2, B + v2];
end
pHem = q;