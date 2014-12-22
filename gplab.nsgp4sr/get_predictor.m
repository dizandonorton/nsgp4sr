function predictor = get_predictor(data)
	%Returns a vertical array with the target values of the dataset
	n = size(data);
	data_transp = data';
	data_transp = data_transp(end,:);
	predictor = data_transp';