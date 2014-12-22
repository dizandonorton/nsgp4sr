function [pop,state]=calcpopfitness(pop,params,data,state)
%CALCPOPFITNESS    Calculate fitness values for a GPLAB population.
%   CALCPOPFITNESS(POPULATION,PARAMS,DATA,STATE) returns the
%   population with the fitness values for all individuals.
%
%   [POPULATION,STATE]=CALCPOPFITNESS(...) also returns the
%   updated state of the algorithm.
%
%   Input arguments:
%      POPULATION - the current population of individuals (array)
%      PARAMS - the running parameters of the algorithm (struct)
%      DATA - the dataset on which to measure the fitness (struct)
%      STATE - the current state of the algorithm (struct)
%   Output arguments:
%      POPULATION - the population updated with fitness (array)
%      STATE - the updated state of the algorithm (struct)
%
%   See also CALCFITNESS
%
%   Copyright (C) 2003-2007 Sara Silva (sara@dei.uc.pt)
%   This file is part of the GPLAB Toolbox

%prev_gen = strcat(strcat('gen',int2str(state.generation-1)),'.txt');
%actual_gen = strcat(strcat('gen',int2str(state.generation)),'.txt');


%if state.generation == 0
%	j=[];
	for i=1:length(pop)
	   	if isempty(pop(i).fitness)
	      	[pop(i),state]=calcfitness(pop(i),params,data,state,0,pop);
	      	% (0 = learning data, not testing)
	   	end
%	   	j=[j; pop(i).fitness];
	end
%	csvwrite(actual_gen, j);

%else
%	pg = load(prev_gen);
%	jj=[];
%	for i=1:length(pop)
%	   	if isempty(pop(i).fitness)
%	    	[pop(i),state]=calcfitness(pop(i),params,data,state,0,pop);
%	      	% (0 = learning data, not testing)
%	   	end
%	   	pop(i).fitness = sum(abs(pop(i).fitness - pg))/length(pop);
%	   	%pop(i).adjustfitness = pop(i).fitness;
%	   	jj=[jj; pop(i).fitness];
%	   	%O QUE FAZER COM O STATE?
%	end
%	csvwrite(actual_gen, jj);
%end

%if state.generation == state.maxgen%
%	for i=0:state.maxgen
%		delete(strcat(strcat('gen', int2str(i)), '.txt'));
%	end
%end
% FAZER O CONTROLE DAS GERAÇÕES
%if state.generation == 0
%	for i=1:length(pop)
%	   	if isempty(pop(i).fitness)
%	    	[pop(i),state]=calcfitness(pop(i),params,data,state,0,pop);
%	     	% (0 = learning data, not testing)
%	   	end
%	end
%else
%	%calculates the novelty
%	for i=1:length(pop)
%	   	if isempty(pop(i).fitness)
%	    	%[pop(i),state]=nove(pop);
%	    	fprintf('\n\nAGORA SIM ##################################\n\n')
%%	     	exit
	     	% (0 = learning data, not testing)
%	   	end
%	end
%end