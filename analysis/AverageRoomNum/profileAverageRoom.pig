profile = load 'merged' using PigStorage(',');
group1 = GROUP profile BY ($18,$19);
averagePrice = FOREACH group1 {
	GENERATE group, AVG(profile.$24);
}
STORE averagePrice into 'Average' using PigStorage(',');
