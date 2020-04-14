function dens = dtfe(points)

%assumes an input matrix where rows are points and columns are their
%n-d coordinates

tris = delaunayn(points);

trivols = zeros(size(tris,1),1);
div = factorial(size(points,2));
for t = 1:size(trivols,1)
    ptri = points(tris(t,:),:);
    ptri = bsxfun(@minus,ptri,ptri(1,:));
    trivols(t) = abs(det([ptri(2:end,:)]')/div);
end

dens = zeros(size(points,1),1);
for p = 1:size(points,1)
    use = max(tris==p,[],2);
    dens(p)=1./sum(trivols(use));
end

end