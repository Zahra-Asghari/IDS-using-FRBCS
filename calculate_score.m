function calculate_score(rule_num)
%%

%global variable
global compact_rule_base
global Decision_col
global mf_params
global I

%%
I1 = I;
fi = calculate_fi(rule_num);
score1 = zeros(size(I1,1),1);

for datum = 1 : size(I1,1)
   
    att1 = compact_rule_base(rule_num,2);
    memf1 = compact_rule_base(rule_num,3);
    mu1 = evalmf(I1(datum,att1),mf_params(memf1,:),'trimf');
    mu2 = 1;
    
    if compact_rule_base(rule_num,1) == 2
        att2 = compact_rule_base(rule_num,4);
        memf2 = compact_rule_base(rule_num,5);
        mu2 = evalmf(I1(datum,att2),mf_params(memf2,:),'trimf');
    end
    
    mu = mu1 * mu2 ;
    score1(datum,1) = fi(datum) / mu;
    I1(datum,Decision_col + 1) = score1(datum,1);
end


I = I1;

end


