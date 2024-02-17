function res = flattenPanel(sheer, ridge)

k = size(sheer, 2);
m = size(ridge, 2);
if (k ~= m)
    error("Bad sizes in flattenPanel");
end

res = zeros(2, 2*k); % too many columns? too few?
p0 = [0; 0];
v0 = [0.144, 1];
v0 = v0 /vLength(v0);
for i=1:(k-1)
    A = sheer(:, i);
    B = ridge(:, i);
    C = ridge(:, i+1);
    D = sheer(:, i+1);
    [S, T, U, V] = flatten([A,B,C,D], p0, v0);
    p0 = V;
    v0 = U - V;
    res(:, (4*i - 3):(4*i)) = [S,T,U,V];
end

