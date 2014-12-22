function [train, test] = generate_tt_data(data, percentage)
% Partitions 'data' randomly into training and test set, being 'percentage' for the training set and '1-percentage' for the test set
%
%

% Number of rows
n = size(data, 1);

%Distributes the row numbers randomly
all_indices = randperm(n);

%Get the row numbers for the training and test set
training_indices = all_indices(1:floor(percentage*n));
test_indices = all_indices(ceil(percentage*n):end);

%Finally gets the training and test data
train = data(training_indices,:);
test = data(test_indices,:);