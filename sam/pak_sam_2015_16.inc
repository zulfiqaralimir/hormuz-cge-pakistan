* Pakistan SAM 2015-16 (PKR million). Rows = receipts, columns = payments.
* Sources: PBS SUT/IOT 2015-16, LFS 2014-15, HIES 2015-16, MoF/SBP FY16.
* Generated from Pakistan_SAM_2015-16.xlsx
Set ac 'SAM accounts' /
   Act_Agri
   Act_Energy
   Act_Mfg
   Act_Serv
   Com_Agri
   Com_Energy
   Com_Mfg
   Com_Serv
   Labour
   Capital
   HH_Urban
   HH_Rural
   Govt
   RoW
   S_I /;
Alias (ac,acp);

Parameter SAM(ac,acp) 'Social Accounting Matrix 2015-16';
SAM('Act_Agri','Com_Agri') = 9778515.0;
SAM('Act_Energy','Com_Energy') = 3828311.7;
SAM('Act_Mfg','Com_Mfg') = 12816959.4;
SAM('Act_Serv','Com_Serv') = 27434916.0;
SAM('Com_Agri','Act_Agri') = 1268617.7;
SAM('Com_Agri','Act_Energy') = 10535.7;
SAM('Com_Agri','Act_Mfg') = 3342259.2;
SAM('Com_Agri','Act_Serv') = 95572.4;
SAM('Com_Agri','HH_Urban') = 2204208.3;
SAM('Com_Agri','HH_Rural') = 2520782.7;
SAM('Com_Agri','RoW') = 74762.8;
SAM('Com_Agri','S_I') = 694328.6;
SAM('Com_Energy','Act_Agri') = 25392.9;
SAM('Com_Energy','Act_Energy') = 1756294.9;
SAM('Com_Energy','Act_Mfg') = 488496.9;
SAM('Com_Energy','Act_Serv') = 1477596.6;
SAM('Com_Energy','HH_Urban') = 415154.0;
SAM('Com_Energy','HH_Rural') = 474779.6;
SAM('Com_Energy','RoW') = 31904.1;
SAM('Com_Energy','S_I') = 20520.8;
SAM('Com_Mfg','Act_Agri') = 485970.0;
SAM('Com_Mfg','Act_Energy') = 80972.9;
SAM('Com_Mfg','Act_Mfg') = 2791050.0;
SAM('Com_Mfg','Act_Serv') = 1094988.1;
SAM('Com_Mfg','HH_Urban') = 3828494.6;
SAM('Com_Mfg','HH_Rural') = 4378353.4;
SAM('Com_Mfg','RoW') = 1494914.3;
SAM('Com_Mfg','S_I') = 1650706.9;
SAM('Com_Serv','Act_Agri') = 657438.1;
SAM('Com_Serv','Act_Energy') = 404619.2;
SAM('Com_Serv','Act_Mfg') = 2499573.7;
SAM('Com_Serv','Act_Serv') = 5802466.8;
SAM('Com_Serv','HH_Urban') = 5481346.0;
SAM('Com_Serv','HH_Rural') = 6268591.9;
SAM('Com_Serv','Govt') = 3471786.0;
SAM('Com_Serv','RoW') = 1189867.0;
SAM('Com_Serv','S_I') = 2600864.0;
SAM('Labour','Act_Agri') = 2274584.0;
SAM('Labour','Act_Energy') = 69502.0;
SAM('Labour','Act_Mfg') = 1420893.0;
SAM('Labour','Act_Serv') = 4590194.0;
SAM('Capital','Act_Agri') = 5032373.1;
SAM('Capital','Act_Energy') = 1343494.6;
SAM('Capital','Act_Mfg') = 2070260.4;
SAM('Capital','Act_Serv') = 13706904.6;
SAM('HH_Urban','Labour') = 4087714.0;
SAM('HH_Urban','Capital') = 10391010.1;
SAM('HH_Urban','Govt') = 651747.0;
SAM('HH_Urban','RoW') = 747239.0;
SAM('HH_Rural','Labour') = 4267459.0;
SAM('HH_Rural','Capital') = 11762022.5;
SAM('HH_Rural','Govt') = 721553.0;
SAM('HH_Rural','RoW') = 1328425.0;
SAM('Govt','Act_Agri') = 34139.3;
SAM('Govt','Act_Energy') = 162892.4;
SAM('Govt','Act_Mfg') = 204426.3;
SAM('Govt','Act_Serv') = 667193.6;
SAM('Govt','HH_Urban') = 953636.5;
SAM('Govt','HH_Rural') = 1069949.6;
SAM('Govt','RoW') = 67645.8;
SAM('Govt','S_I') = 248560.6;
SAM('RoW','Com_Agri') = 432552.4;
SAM('RoW','Com_Energy') = 861828.1;
SAM('RoW','Com_Mfg') = 2988490.8;
SAM('RoW','Com_Serv') = 941636.6;
SAM('RoW','Govt') = 112600.0;
SAM('S_I','HH_Urban') = 2994870.7;
SAM('S_I','HH_Rural') = 3367002.3;
SAM('S_I','Govt') = -1549241.9;
SAM('S_I','RoW') = 402349.9;
