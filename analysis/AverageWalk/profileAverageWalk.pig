profile = load 'merged' using PigStorage(',');
grouped = group profile by $25;
averagePrice = FOREACH grouped {
	GENERATE group, AVG(profile.$24);
}
STORE averagePrice into 'Average' using PigStorage(',');
