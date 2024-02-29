function proposed_methods()

global compact_rule_base
%global dataset

N=200;
Pc=0.7;
Pm=0.005;
scale=0.2;
ITER = 100;
m= size(compact_rule_base,1);
Lo=[0.1];
Lo=repmat(Lo,1,size(compact_rule_base,1));
Hi=[1];
Hi=repmat(Hi,1,size(compact_rule_base,1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Population]=fir_gen(N,m,Lo,Hi);
best_so_far =[];
Average_fitness=[];
for it=1:ITER
    it
[selection_probability,fit,ave_fit,max_fit,opt_sol]=fit_eval(Population,N,m);
if it==1
best_so_far(it)=max_fit;
final_sol= opt_sol;
else if max_fit>best_so_far(it-1)
    best_so_far(it)= max_fit;
    final_sol= opt_sol;
    else
        best_so_far(it)= best_so_far(it-1);
    end
    Average_fitness(it)= ave_fit;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [mating_pool]= g_roulette_wheel(Population,N,selection_probability);
    [new_pop]=g_crossover(mating_pool,Pc,N,m,Hi,Lo);
    [Population]=g_mutation(new_pop,Pm,N,m,scale,Hi,Lo);
end
display('final solution optimum fitness');
result = [final_sol,best_so_far(end)]
disp('--------------------');
% x=1:ITER;
% figure,plot(x,best_so_far,'k',x,Average_fitness,'.k');
% xlable('Generation');
% ylable('fitness function')
% legend('Best_so_far','Average fitness')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

