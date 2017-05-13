addr_map = load 'part-m-00000';
addr_raw = load 'phila_raw.csv' using PigStorage(',');
temp1 = join addr_map by $0, addr_raw by $0;
temp2 = foreach temp1 generate $1, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12,
$13, $14, $15, $16, $17, $18;
store temp2 into 'zillow_new' using PigStorage(',');
