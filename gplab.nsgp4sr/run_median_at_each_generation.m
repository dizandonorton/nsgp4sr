function med = run_median_at_each_generation(file, g, p, times, fit)
    % This matrix will receive the results of all the 'times' runs
    runs=[];
    % BAG - Best At Generation is a 'g x times' matrix. 
    %%		Each rows contains the best of each 'g' generation
    %%		Each column contains the values of each of the 'times' execution of GP
    bag_train = [];
    bag_test = [];
    %MY NOTES: *Since the initial population 'doesn't' count. Try to remove them.
    %%tra = ones(g+1,1);
    for i=1:times
        disp(strcat('RUN #',int2str(i)));
        runs(i).result = mediana(file, g, p, fit);
        bag_train = [bag_train runs(i).result.state.bestfithistory(:,1)];
        bag_test = [bag_test runs(i).result.state.bestfithistory(:,2)];
        runfile = strcat(strcat(strrep(file,'.txt',strcat('_',fit)), '_RUN_'), int2str(i));
        zip(runfile,{'results/*.mat'});
        %e_mail('dizando.norton@gmail.com','gmail','dizando.norton','google.com13',runfile,strcat(strcat('File ',runfile),' is done'));
        rmdir('results','s');
    end
    csvwrite(strcat(strrep(file,'.txt',strcat('_RESULTS_TRAINING_',int2str(g),'G_',int2str(p),'I_',fit,'.csv'))), bag_train);
    csvwrite(strcat(strrep(file,'.txt',strcat('_RESULTS_TEST_',int2str(g),'G_',int2str(p),'I_',fit,'.csv'))), bag_test);
    
    %subject = strcat('Completion of ',' ',int2str(times),' runs on ',' ',file,' with ',' ',int2str(g),' gen. and pop. size of ',' ',int2str(p));
    %testfile = strcat(strrep(file,'.txt',strcat('_RESULTS_TEST_',int2str(g),'G_',int2str(p),'I_',fit,'.csv')));
    %trainfile = strcat(strrep(file,'.txt',strcat('_RESULTS_TRAINING_',int2str(g),'G_',int2str(p),'I_',fit,'.csv')));
    %e_mail('dizando.norton@gmail.com','gmail','dizando.norton','google.com13',subject,'Please find the result files attached', {testfile, trainfile});
