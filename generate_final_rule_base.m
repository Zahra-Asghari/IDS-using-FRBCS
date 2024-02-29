function generate_final_rule_base()
%%

% global variables

global compact_rule_base
global final_rule_base
%%
%generate final rule base
r_ind = 1;

for i = 1 : size(compact_rule_base,1)
     
    if compact_rule_base(i,7) ~= 0
        final_rule_base(r_ind,1:7) = compact_rule_base(i,1:7);
        r_ind = r_ind + 1;
    end
    
    save final_rue_base.mat
end
        
      


end

