function [mating_pool]= g_roulette_wheel(Population,N,selection_probability)
cdf(1)=selection_probability(1);
for i=2:N
    cdf(i)=cdf(i-1)+ selection_probability(i);
end
for i=1:N
    r=rand;
    for j=1:N
        if r<= cdf(j)
            mating_pool(i,:)= Population(j,:)
            break;
        end
    end
end
return;