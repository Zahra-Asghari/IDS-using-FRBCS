function [Population]=fir_gen(N,m,Lo,Hi)
for j=1:m
    Population(:,j)= Lo(j)+ (Hi(j)-Lo(j))*rand(N,1);
end
return;
