function generate_initial_rule_base()
%%
%global variables
global initial_rule_base;
global membership_func;
global Attributes;
global Classes



%%
    % calculate number of total rules
    
    one_condition_rules = Attributes * membership_func * Classes;
    two_condition_rules = Attributes * (Attributes - 1) * Classes * membership_func ^ 2 * 0.5;
    total_rules = one_condition_rules + two_condition_rules;
    
    
    %%   
    % initialize candidate_rules
    
    initial_rule_base = zeros(total_rules , 6);
    
    % column 1: Number of conditions in anticident part
    % column 2: Attribute 1
    % column 3: Value 1 (mf number)
    % column 4: Attribute 2
    % column 5: Value 2 (mf_number)
    % column 6: Consequence class of rule
    % column 7: Confidence
  
        
    %%
    % generate one condition rules
    
    index = 1;
        
    for i = 1 : Attributes
        for j = 1 : membership_func
            for k = 1 : Classes
                
                %0 in 3th column means any attribute, value 15 means 15th membership function (don't care)
                initial_rule_base(index, 2:6) = [i j 0 15 k];
                initial_rule_base(index, 1) = 1; % this rule has one condition
                index = index + 1;
            
            end
        end
    end
    
    
    %%
    % generate two condition rules
    for i = 1 : Attributes - 1
        for j = i + 1 : Attributes
            for k = 1 : membership_func
                for r = 1 : membership_func
                    for l = 1 : Classes
                    initial_rule_base(index, 2:6)=[i k j r l];
                    initial_rule_base(index, 1) = 2; % this rule has two condition
                    index = index + 1;
                    end
                end
            end
        end
    end
    
end