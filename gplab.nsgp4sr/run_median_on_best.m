function results = run_median_on_best(file, g, p, times);
    runs=[];
    results=[];
    for i=1:times
        disp(strcat('RUN #',int2str(i)));
        runs(i).result = mediana(file, g, p);
    end
    for i=1:times
    	results = [results;runs(i).result.state.bestfithistory(end,:)];
    end
    csvwrite(strrep(file,'.txt','_results.csv'), results);
