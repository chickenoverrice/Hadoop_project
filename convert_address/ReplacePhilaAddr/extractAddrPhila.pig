phila_raw = load 'phila_raw.csv' using PigStorage(',');
phila_addr = foreach phila_raw generate $0;
store phila_addr into 'phila' using PigStorage(',');
