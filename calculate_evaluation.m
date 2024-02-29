function calculate_evaluation()
%%
%this function calculates evaluation according to equation(18) of paper

%%
%global variable

    global candidate_rule_base;
    global mf_params
    global dataset
    
%%
%calculate evaluation

 for i = 1 : size(candidate_rule_base,1)
    
    sumation1 = 0;
    sumation2 = 0;
    
    for j = 1 : size(dataset,1)
        
            attribute1 = candidate_rule_base(i,2);
            mem_function1 = candidate_rule_base(i,3);
            u1 = evalmf(dataset(j,attribute1),mf_params(mem_function1,:),'trimf');
            u2 = 1;
            
            if candidate_rule_base(i,1) == 2
                attribute2 = candidate_rule_base(i,4);
                mem_function2 = candidate_rule_base(i,5);
                u2 = evalmf(dataset(j,attribute2),mf_params(mem_function2,:),'trimf');
            end
            
            if dataset(j,end) == candidate_rule_base(i,6)
                sumation1 = sumation1 + (u1 * u2);
            else
                sumation2 = sumation2 + (u1 * u2);
            end
            
    end
        
      candidate_rule_base(i,7) = sumation1 - sumation2;
 end
   
 end

