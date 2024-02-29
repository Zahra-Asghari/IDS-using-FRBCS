function  generate_compact_rule_base()
%%
%this function selects Q candidate rules from each class using 7th colmn of candidate_rule_base(this column store evaluation) 

%%
%global variable

global candidate_rule_base
global compact_rule_base
global Classes


%%
%generate compact rule base
Q = 20;
calculate_evaluation();
[cls length_classes] = unique(candidate_rule_base(:,6));
 %length_classes stores the count of instance on each class
 
 str = 1;
   
 for i = 1 : 4
     
     candidate_rule_base(str:length_classes(i),:) = sortrows(candidate_rule_base(str:length_classes(i),:),-7);
                  
     rindex = Q * (i - 1) + 1;
     cindex = Q * i;
     trind = str + Q - 1;
     compact_rule_base1(rindex:cindex,1:6) = candidate_rule_base(str:trind,1:6);
     str = length_classes(i) + i;
 end

save compact_rule_base12.mat
