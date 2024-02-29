function fi = calculate_fi(rule_num)

global compact_rule_base
global mf_params
global I

mu = zeros(size(compact_rule_base,1),1);
fi = zeros(size(I,1),1);

for datum = 1 : size(I,1)
    for rule = 1 : size(compact_rule_base,1)
        
        if compact_rule_base(rule,6) ~= compact_rule_base(rule_num,6)
            att1 = compact_rule_base(rule,2);
            memf1 = compact_rule_base(rule,3);
            mu1 = evalmf(I(datum,att1),mf_params(memf1,:),'trimf');
            mu2 = 1;
    
           if compact_rule_base(rule) == 2
               att2 = compact_rule_base(rule,4);
               memf2 = compact_rule_base(rule,5);
               mu2 = evalmf(I(datum,att2),mf_params(memf2,:),'trimf');
           end
    
           mu(rule) = mu1 * mu2 * compact_rule_base(rule,7);
           
        end
    end
        
    fi(datum) = max(mu);
    
end

end

