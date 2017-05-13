profile = load 'selected' using PigStorage(',') as (price:double, size:int);
newid = foreach profile generate size*20/2000 as nid, price, size;
grouped = group newid by nid;
averagePrice = FOREACH grouped {
	GENERATE group, AVG(newid.price);
}
STORE averagePrice into 'Average' using PigStorage(',');
