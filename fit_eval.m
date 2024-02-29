function [selection_probability,fit,ave_fit,max_fit,opt_sol] = fit_eval(Population,N,m)

global compact_rule_base;
global mf_params
global dataset
global Patterns

fit=zeros(N,17);
TN=0;
TP=0;
FP=0;
FN=0;
N1=0;N2=0;N3=0;N4=0;P1=0;P2=0;P3=0;P4=0;
for i=1:N
   
     correct_predict = 0;
    for j=1 : size(dataset,1)
    
    temp_var = zeros(size(compact_rule_base,1),1);

for m = 1 : size(compact_rule_base,1);
    
    atr1 = compact_rule_base(m,2);
    mf1 = compact_rule_base(m,3);
    
    u1 = evalmf(dataset(j,atr1),mf_params(mf1,:),'trimf');
    u2 = 1;
    
    if compact_rule_base(m,1) == 2
        atr2 = compact_rule_base(m,4);
        mf2 = compact_rule_base(m,5);
        u2 = evalmf(dataset(j,atr2),mf_params(mf2,:),'trimf');
    end
    
    temp_var(m) = u1 * u2 * Population(i,m);
    
        
end

    [m1 loc] = max(temp_var);

     if dataset(j,end) == compact_rule_base(loc,6)
        correct_predict = correct_predict + 1;
    end
if dataset(j,end)==2 && compact_rule_base(loc,6)==2
    TN=TN+1;
elseif dataset(j,end)==2 && compact_rule_base(loc,6)~=2
    FP=FP+1;
elseif dataset(j,end)~=2 && compact_rule_base(loc,6)~=2
    TP=TP+1;
elseif dataset(j,end)~=2 && compact_rule_base(loc,6)==2
    FN=FN+1;
elseif dataset(j,end)==1 && compact_rule_base(loc,6)==1
    N1=N1+1;
elseif dataset(j,end)==3 && compact_rule_base(loc,6)==3
    N2=N2+1;
elseif dataset(j,end)==4 && compact_rule_base(loc,6)==4
    N3=N3+1;
elseif dataset(j,end)==5 && compact_rule_base(loc,6)==5
    N4=N4+1;
elseif dataset(j,end)==2 && compact_rule_base(loc,6)==1
    P1=P1+1;
elseif dataset(j,end)==2 && compact_rule_base(loc,6)==3
    P2=P2+1;
elseif dataset(j,end)==2 && compact_rule_base(loc,6)==4
    P3=P3+1;
elseif dataset(j,end)==2 && compact_rule_base(loc,6)==5
   P4=P4+1;
end
    end
fit(i,1) = correct_predict / Patterns;
fit(i,2)= TP/(TP+FN);   %Recall A
fit(i,3)=FP/(FP+TP);     % Precision A
fit(i,4)=2*fit(i,2)*fit(i,3)/(fit(i,2)+fit(i,3));    % F-Measurevalue A

 fit(i,5)= TN/(TN+FP);   %Recall N
fit(i,6)=TN/(FN+TN);     % Precision N
fit(i,7)=2*fit(i,5)*fit(i,6)/(fit(i,5)+fit(i,6));    % F-Measurevalue N
fit(i,8)=N1/length(find(dataset(:,end)==1));
fit(i,9)=N2/length(find(dataset(:,end)==3));
fit(i,10)=N3/length(find(dataset(:,end)==4));
fit(i,11)=N4/length(find(dataset(:,end)==5));
fit(i,12)=P1/length(find(dataset(:,end)==2));
fit(i,13)=P2/length(find(dataset(:,end)==2));
fit(i,14)=P3/length(find(dataset(:,end)==2));
fit(i,15)=P4/length(find(dataset(:,end)==2));
fit(i,16)=FP/(FP+TN);
fit(i,17)=FN/(FN+TP);

end
   
selection_probability = fit(:,1) / sum(fit(:,1));
ave_fit = mean(fit(:,1));
[max_fit, max_loc]= max(fit(:,1));
opt_sol= fit(max_loc,:);
return;
