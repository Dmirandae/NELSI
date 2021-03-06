trann2trdat <-
function(tree){
	tree$edge.length <- unlist(sapply(tree$annotations, function(x){ x$length }))[1:length(tree$edge.length)]
	rates <- unlist(sapply(tree$annotations, function(x){ x$rate_median }))
	midages <- mid.edge.ages(tree)
	timelen <- tree$edge.length
	subslen <- tree$edge.length * rates
	return(cbind(branch = as.numeric(rownames(as.data.frame(tree$edge))), parent = tree$edge[,1], daughter = tree$edge[,2], midage = midages, rate = rates, blensubs = subslen, blentime = timelen))
}
