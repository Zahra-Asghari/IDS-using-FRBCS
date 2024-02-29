function  single_winner_method(dt)
%%

%the input pattern is classified according to consequent class of the winner rule 

%%

%global variable 
global compact_rule_base
global mf_params
global dataset

%%
%generate winner rule

temp_var = zeros(size(compact_rule_base,1),2);

for rule = 1 : size(compact_rule_base);
    
    atr1 = compact_rule_base(rule,2);
    mf1 = compact_rule_base(rule,3);
    
    u1 = evalmf(dataset(dt,atr1),mf_params(mf1,:),'trimf');
    u2 = 1;
    
    if compact_rule_base(rule,1) == 2
        atr2 = compact_rule_base(rule,4);
        mf2 = compact_rule_base(rule,5);
        u2 = evalmf(dataset(dt,atr2),mf_params(mf2,:),'trimf');
    end
   
    temp_var(rule,1) = u1 * u2 * compact_rule_base(rule,7);
    temp_var(rule,2) = u1 * u2 * compact_rule_base(rule,8);
      
end

    [m loc1] = max(temp_var(:,1));
    [m loc2] = max(temp_var(:,2));
    dataset(dt,end - 1) = compact_rule_base(loc1,6);
    dataset(dt,end ) = compact_rule_base(loc2,6);
    
end

