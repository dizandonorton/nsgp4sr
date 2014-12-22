function [output] = beha_desc(actual, predicted, population_size, h)
	e = abs(actual - predicted);
	E = sort(e, 'descend');
	% Calcutating the order statistic
	p = population_size/h;
	ee = E(p,:);
	bd = [];
	for j=1:p
		if le(e(j,1), ee(j,1))
			bd = [bd;1];
		else
			bd = [bd;0];
		end
	end
	output = bd;
end