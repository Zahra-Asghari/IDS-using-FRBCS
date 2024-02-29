function accuracy = total_accuracy()
%%

%global variable

global final_rule_base
global Attributes
global Patterns
global dataset


%%
% classify dataset and calculate accuracy

end_clm = Attributes + 1;
eclm = end_clm + 1;
correct_predict = 0;


for i = 1 : size(dataset,1)
    loc = single_winner_method1(i);
    dataset(i,eclm) = final_rule_base(loc,6);
    
    if dataset(i,end_clm) == dataset(i,eclm)
        correct_predict = correct_predict + 1;
    end
    
    
end

accuracy = correct_predict / Patterns

end

