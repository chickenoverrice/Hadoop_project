profile = load 'selected' using PigStorage(',') as (price:double, year:int);
newid = foreach profile generate (year-1875)*20/137 as nid, price, year;
grouped = group newid by nid;
averagePrice = FOREACH grouped {
	GENERATE group, AVG(newid.price);
}
STORE averagePrice into 'Average1' using PigStorage(',');
