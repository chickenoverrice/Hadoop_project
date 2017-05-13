profile = load 'merged' using PigStorage(',');
selected = foreach profile generate $24, $29;
STORE selected into 'select1' using PigStorage(',');

