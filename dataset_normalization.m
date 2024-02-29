function   dataset_normalization()
%%

%global variable

global dataset
global Attributes

%%

%normalize dataset ([0,1])
dataset1(:,Attributes+1) = dataset(:,Attributes+1);

for i = 1 : Attributes
    A = dataset(:,i);
    n = min(A); 
    m = max(A);
    
    A = (A - n) / (m - n);
       
    dataset1(:,i) = A;
end

save dataset1.mat;
end

