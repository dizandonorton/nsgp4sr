function descriptor = get_descriptor(data)
	%Returns a vertical array with the input values of the dataset
	descriptor = data(1:end,1:end-1);