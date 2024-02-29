function [new_pop]= g_crossover(mating_pool,Pc,N,m,Hi,Lo)
parent_num= randperm(N);
for j=1:2:N
    pointer1=parent_num(j);
    pointer2=parent_num(j+1);
    p1= mating_pool(pointer1,:);
    p2= mating_pool(pointer2,:);
    
    if rand< Pc
        a= rand(1,m);
        off1=a.*p1+(1-a).*p2;
        off2=a.*p1+(1-a).*p1;
    else
        off1=p1;
        off2=p2;
    end
    new_pop(j,:)=off1;
    new_pop(j+1,:)=off2;
end
for i=1:N
    for j=1:m
        if new_pop(i,j)> Hi(j)||new_pop(i,j)<Lo(j)
            new_pop(i,j)= Lo(j)+(Hi(j)- Lo(j))*rand;
        end
    end
end
return;

