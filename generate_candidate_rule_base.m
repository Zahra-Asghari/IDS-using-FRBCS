function generate_candidate_rule_base()
%%

%this function selects best consequece for rules with same conditions and
%different consequnce class. both selected classes and conditions produce
%candidate rules

%%
%global variable
global candidate_rule_base;
global initial_rule_base;
global Classes

%%
%generate candidate rule base from initial rules

row_candidate_base = 0;
calculate_confidence();

temp_ind = 0;
detect_NaN = isnan(initial_rule_base(:,7));

for i = 1 : size(detect_NaN)
    
    if detect_NaN(i) == 0
        temp_ind = temp_ind + 1;
        initial_rule_base1(temp_ind,:) = initial_rule_base(i,:);
    end
    
end


for i = 1 :Classes: temp_ind
    
    [mx loc] = max(initial_rule_base1(i : Classes + i - 1, 7));
    row_candidate_base = row_candidate_base + 1;
    candidate_rule_base1(row_candidate_base,1:6) = initial_rule_base1(i+loc-1,1:6);
    
end

      candidate_rule_base1 = sortrows(candidate_rule_base1,6);
      save candidate_rule_base1.mat
end

