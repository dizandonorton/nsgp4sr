function [v,b]=mediana(infile, gen, pop, fit)	
%
%
%
%

% Loads the data
all_data = load(infile);

% Randomly divides data into training and test data, 70% and 30% respectively
[training_data, test_data] = generate_tt_data(all_data, .7);

% Deletes all temporary files in case they might exist and recreates them
%delete('tmp_x_training.txt');
%delete('tmp_y_training.txt');
%delete('tmp_x_test.txt');
%delete('tmp_y_test.txt');
tmp_x_training = 'tmp_x_training.txt';
tmp_y_training = 'tmp_y_training.txt';
tmp_x_test = 'tmp_x_test.txt';
tmp_y_test = 'tmp_y_test.txt';

% Gets descriptor and predictor data from training and test data
dlmwrite(tmp_x_training, get_descriptor(training_data), '\t');
dlmwrite(tmp_y_training, get_predictor(training_data), '\t');
dlmwrite(tmp_x_test, get_descriptor(test_data), '\t');
dlmwrite(tmp_y_test, get_predictor(test_data), '\t');


% Initializes GPLAB parameters
p=resetparams;
p=setoperators(p,'crossover',2,2,'mutation',1,1);
p=setparams(p,strcat('calcfitness=',fit));
p=setparams(p,'savetofile=always');
p=setparams(p,'lowerisbetter=0');
p=setparams(p,'savedir=''results''');
p.operatorprobstype='variable';
p.minprob=0;
p.datafilex=tmp_x_training;
p.datafiley=tmp_y_training;
p.usetestdata=1;
p.testdatafilex=tmp_x_test;
p.testdatafiley=tmp_y_test;
%p.calcdiversity={'uniquegen'};
%p.calccomplexity=1;
%p.graphics={'plotfitness'};
p.depthnodes='1';
[v,b]=gplab(gen,pop,p);
%desired_obtained(v,[],1,0,[]);
%accuracy_complexity(v,[],0,[]);
%figure
%plotpareto(v);
%drawtree(b.tree);

% Deletes all temporary files
delete(tmp_x_training);
delete(tmp_y_training);
delete(tmp_x_test);
delete(tmp_y_test);