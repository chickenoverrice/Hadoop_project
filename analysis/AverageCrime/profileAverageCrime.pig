profile = load 'selected' using PigStorage(',') as (price:double, crime:double);
grouped = group profile by crime;
averagePrice = FOREACH grouped {
	GENERATE group, AVG(profile.price);
}
STORE averagePrice into 'Average' using PigStorage(',');
