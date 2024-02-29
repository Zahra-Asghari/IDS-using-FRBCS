function   calculate_confidence()

%this function calculates Confidence for all rules and save in 7th column
%of initial _rule_base


%%
%global varibales

global initial_rule_base
global mf_params
global Patterns
global dataset

%%
%calculate_confidence

for i = 1 : size(initial_rule_base , 1)
    
    sm1 = 0;
    sm2 = 0;

    for j = 1 : Patterns
        attribute1 = initial_rule_base(i,2);
        mem_function1 = initial_rule_base(i,3);
               
        u1= evalmf(dataset(j,attribute1),mf_params(mem_function1,:),'trimf');
        u2 = 1;
        
        if  initial_rule_base(i,1) == 2
            attribute2 = initial_rule_base(i,4);
            mem_function2 = initial_rule_base(i,5);
            u2= evalmf(dataset(j,attribute2),mf_params(mem_function2,:),'trimf');
        end
        
        sm2 = sm2 + ( u1 * u2 );
        
        if dataset(j,end) == initial_rule_base(i,6)
            
            sm1 = sm1 + (u1 * u2);
            
        end
        
    end
    
    initial_rule_base(i,7) =  sm1 / sm2;
    
end
    
end


