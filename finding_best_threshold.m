function best_th = finding_best_threshold(rule_class)
%%

%global variable

global Decision_col
global I


%%
% a 2-class situation is formed by considering the consequent class of
% rule as positive class and a classs by merging all other classes as
% negative class(change muli classes problem to 2-class problem)

end_col = Decision_col + 3;

%these three colmuns use for score , ddetermined class using rule class 
% and predicted class

I(:,Decision_col+2:end_col) = 0;
att_I = size(I,1);

for i = 1 : att_I
    if I(i, Decision_col) == rule_class
        
        I(i,end - 1) = 1;          %means the class is positive(1:positive)
    else
        I(i,end - 1) = 0;          %means the class is negative(0:negative)
        
    end
end

I = sortrows(I,Decision_col + 1);

th  = 0;
current = accuracy_calculation(th);
optimum = current;
best_th = 0;

for i = 1 : att_I - 1
    
    th = ( I(i,Decision_col+1) + I(i+1,Decision_col+1) ) / 2;
    current = accuracy_calculation(th);
    
    if current > optimum
        optimum = current;
        best_th = th;
    end
end


last = I(att_I,end);
th = last + eps;
current = accuracy_calculation(th);

if current > optimum
    
    optimum = current;
    best_th = 1;
    
end



end

