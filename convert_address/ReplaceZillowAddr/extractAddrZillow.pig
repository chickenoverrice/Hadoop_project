zillow_raw = load 'zillow_raw.csv' using PigStorage(',');
zillow_addr = foreach zillow_raw generate $0;
store zillow_addr into 'zillow' using PigStorage(',');
