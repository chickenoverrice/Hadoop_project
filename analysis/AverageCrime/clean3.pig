profile = load 'merged' using PigStorage(',');
selected = foreach profile generate $24, $28;
STORE selected into 'select3' using PigStorage(',');

