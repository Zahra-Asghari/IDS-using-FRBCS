clear all;
clc;

% global variables
global membership_func;
global initial_rule_base
global candidate_rule_base
global compact_rule_base
global Attributes;
global Classes;
global Patterns;
global mf_params;
global Decision_col
global dataset;
% global score
% global I

%load data
disp('  Please choose one of the following sets of data[1-4]');
    disp('              *********************');
    disp('    ');
    disp('1 : Wine');
    disp('2 : glass');
    disp('3 : Exit  ')
    disp('    ');
    


    key = input(' Your Key :   ');
   
  
    switch(key)
        
        case 1
             load('kdd.mat');
             dataset = data;
             
        case 2
             load('wine.mat');
             dataset = wine;
            
        case 3
            clc;
            break;    
             
    end
 

Attributes = size(dataset,2) - 1;                 % number of attributes
Classes = length(unique(dataset(: ,end)));        % number of classes
Patterns = size(dataset,1);                       % number of patterns
Decision_col = Attributes + 1;                      
% dataset_normalization();                          % normalize of data ([0,1])

    load dataset12.mat;
    dataset = dataset1;

mf_params = get_mf_params();                      % get membership functions 
membership_func = size(mf_params , 1);
% generate_initial_rule_base();
% generate_candidate_rule_base();
% 
    load candidate_rule_base1.mat
    candidate_rule_base = candidate_rule_base1;
% 
generate_compact_rule_base();
    
    load compact_rule_base12.mat;
    compact_rule_base = compact_rule_base12;

    
proposed_methods();
%generate_final_rule_base();
%accuracy = total_accuracy();







