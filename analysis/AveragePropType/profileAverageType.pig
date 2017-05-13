profile = load 'merged' using PigStorage(',');
filtered = filter profile by ($22 is not null);
group1 = GROUP filtered BY ($22);
averagePrice = FOREACH group1 {
	GENERATE group, AVG(filtered.$24);
}
STORE averagePrice into 'Average' using PigStorage(',');
