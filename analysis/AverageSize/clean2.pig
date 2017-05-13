profile = load 'merged' using PigStorage(',');
selected = foreach profile generate $24, $17;
filtered = filter selected by $1>0;
STORE filtered into 'select' using PigStorage(',');

