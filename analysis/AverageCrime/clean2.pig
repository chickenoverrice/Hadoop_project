profile = load 'merged' using PigStorage(',');
selected = foreach profile generate $24, $27;
STORE selected into 'select2' using PigStorage(',');

