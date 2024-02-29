function add_to_I()

global dataset
global I

lst = size(dataset,2);
row_index = 1;
I = [];

for i = 1 : size(dataset,1)
    if ( dataset(i,lst - 2) == dataset(i,lst - 1) &&  dataset(i,lst - 2) ~= dataset(i,lst)) ||  (dataset(i,lst - 2) == dataset(i,lst) && dataset(i,lst - 2) ~= dataset(i,lst - 1))
        I(row_index,1:(lst-2)) = dataset(i,1:(lst - 2));
        row_index = row_index + 1;
    end
end


end 

