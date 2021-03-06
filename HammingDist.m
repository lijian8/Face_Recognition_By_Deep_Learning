function [distance,sortIndex] = HammingDist(onebyte,bytes,searchRadius);

[dim nSamples] = size(bytes);

 lookup = [0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,1,2,2,3,2,3,3,4,2,3,3,4,3,...
           4,4,5,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,...
           4,5,4,5,5,6,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,...
           5,3,4,4,5,4,5,5,6,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,3,4,4,5,...
           4,5,5,6,4,5,5,6,5,6,6,7,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,...
           3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,2,3,3,4,3,4,4,5,3,4,4,5,4,5,...
           5,6,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,2,3,3,4,3,4,4,5,3,4,4,...
           5,4,5,5,6,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,3,4,4,5,4,5,5,6,...
           4,5,5,6,5,6,6,7,4,5,5,6,5,6,6,7,5,6,6,7,6,7,7,8];

distance = zeros(1,nSamples);

for ii=1:nSamples
 for jj=1:dim
     distance(ii)=distance(ii)+ lookup(bitxor(onebyte(jj), bytes(jj,ii))+1);
 end
end

[distance,sortIndex]  = sort(distance);

distance = distance(1:searchRadius);
 
sortIndex  = sortIndex(1:searchRadius);
