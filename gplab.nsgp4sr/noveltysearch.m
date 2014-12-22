function ind=noveltysearch(ind,params,data,state,varsvals)

X=data.example;
outstr=ind.str;
for i=params.numvars:-1:1
    outstr=strrep(outstr,strcat('X',num2str(i)),strcat('X(:,',num2str(i),')'));
end

try
    res=eval(outstr);
catch
    % because of the "nesting 32" error of matlab
    res=str2num(evaluate_tree(ind.tree,X));
end

% if the individual is just a terminal, res is just a scalar, but we want a vector:
if length(res)<length(data.result)
    res=res*ones(length(data.result),1);
end

sumdif=sum(abs(res-data.result));
ind.result = res;
ind.fitness = sumdif;
ind.fitness = fixdec(ind.fitness,params.precision);

if ne(state.generation, 0)
    pg = load(strcat('results/', int2str(state.generation-1)));
    bdi = sum((ind.fitness - pg.vars.state.popfitness).^2)/pg.vars.state.popsize;
    if eq(bdi, Inf)
        bdi = mean(pg.vars.state.popfitness);
    end
    ind.fitness = bdi;
    ind.fitness = fixdec(ind.fitness,params.precision);
end