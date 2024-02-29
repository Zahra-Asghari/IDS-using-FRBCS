function [location] = single_winner_method1(data_num)
%%

%the input pattern is classified according to consequent class of the winner rule 

%%

%global variable 
global final_rule_base
global mf_params
global dataset

%%
%generate winner rule

temp_var = zeros(size(final_rule_base,1),1);

for rule = 1 : size(final_rule_base,1);
    
    atr1 = final_rule_base(rule,2);
    mf1 = final_rule_base(rule,3);
    
    u1 = evalmf(dataset(data_num,atr1),mf_params(mf1,:),'trimf');
    u2 = 1;
    
    if final_rule_base(rule,1) == 2
        atr2 = final_rule_base(rule,4);
        mf2 = final_rule_base(rule,5);
        u2 = evalmf(dataset(data_num,atr2),mf_params(mf2,:),'trimf');
    end
    
    temp_var(rule) = u1 * u2 * final_rule_base(rule,7);
    
      
end

[m location] = max(temp_var);


end

