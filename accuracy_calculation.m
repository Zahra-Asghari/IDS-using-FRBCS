function  accuracy = accuracy_calculation(th)
%%

% global variables

global Decision_col
global I

%%

% classify by threshold


for i = 1 : size(I,1)
    
    if I(i , Decision_col+1) < th
        I(i,end) = 1;    % predicted class is positive
    else
        I(i,end) = 0;    % predicted class is negative
    end
    
end

%%

% claculare accuracy

% I(:,end-1): Actual Class
% I(:,end) : Predicted Class

TP = 0;
FP = 0;
TN = 0;
FN = 0;

total_instance = size(I,1);

for i = 1 : total_instance
    
    if I(i,end-1) == 1  && I(i,end) == 1
        TP = TP + 1;
    
    elseif I(i,end-1) == 0  && I(i,end) == 1
        FP = FP + 1;
    
    elseif I(i,end-1) == 0 && I(i,end) == 0
        TN = TN + 1;
    
    else
        FN = FN + 1;
        
    end
    
end
        
     
accuracy = (TP + TN) / total_instance;     

       

end

