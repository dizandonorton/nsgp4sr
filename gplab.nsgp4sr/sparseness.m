function sp = sparseness(individual,population,k)
	% This function calcutes the sparseness of each individual, comparing it the existing population and the archive of past sparse individuals
	% k is the number of nearest neighbors allowed. ?? Since we're trying to figure out how sparse the individual is, how can the use of only k...
	% sa = sparseness from the indivuals on the archive
	% sp = sparseness from the current population
	% For this funciton we assime that individual and population are the beahvioral descriptors and that in the archive are previous novel beahviors

	% archive = load(archive);
	value = 0;
	dist_pop = [];
    for i=1:size(population,1)
        for j=1:size(population,2)
            value = value + individual(1,j)-population(i,j);
        end
        dist_pop = [dist_pop; value];
    end
    dist_pop = sort(dist_pop, 'ascend')
    sp = (1/k)*dist_pop(1:k,:);
    
    %dist_arch = sort(abs(individual - archive), 'ascend');
    %sa = (1/k)*dist_arch(1:k,:);
end