$TITLE Pakistan SAM 2015-16: balance check and calibration shares
$ONTEXT
Step 1 of plugging the new SAM into the Hormuz CGE model.
SAM data is embedded below (no $include), checks row = column, and computes the
benchmark parameters the EXTER model needs. Run this first; it must
end with "SAM balanced" before any model solve.
$OFFTEXT

* ---------------- 0. SAM data (inline, no include file needed) ----------------
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

Sets
   i  'sectors'     / Agri, Energy, Mfg, Serv /
   h(ac) 'households' / HH_Urban, HH_Rural /
   f(ac) 'factors'    / Labour, Capital /
   a(ac) 'activities'  / Act_Agri, Act_Energy, Act_Mfg, Act_Serv /
   c(ac) 'commodities' / Com_Agri, Com_Energy, Com_Mfg, Com_Serv /
   ai(ac,i) 'activity-sector map'  / Act_Agri.Agri, Act_Energy.Energy, Act_Mfg.Mfg, Act_Serv.Serv /
   ci(ac,i) 'commodity-sector map' / Com_Agri.Agri, Com_Energy.Energy, Com_Mfg.Mfg, Com_Serv.Serv /;
Alias (i,j);

* ---------------- 1. Balance check ----------------
Parameter rowtot(ac), coltot(ac), gap(ac);
rowtot(ac) = sum(acp, SAM(ac,acp));
coltot(ac) = sum(acp, SAM(acp,ac));
gap(ac)    = rowtot(ac) - coltot(ac);
Display rowtot, coltot, gap;
Abort$(smax(ac, abs(gap(ac))) > 1) "SAM NOT balanced - check gap", gap;
Display "SAM balanced";

* ---------------- 2. Benchmark levels ----------------
Parameters
   X0(i)     'gross output'
   M0(i)     'imports'
   E0(i)     'exports'
   Q0(i)     'total supply (domestic output + imports)'
   D0(i)     'domestic output sold at home'
   INT0(j,i) 'intermediate use of j by sector i'
   VA0(i)    'value added'
   F0(f,i)   'factor payments'
   TXA0(i)   'product taxes on inputs'
   C0(i,h)   'household consumption'
   G0(i)     'govt consumption'
   I0(i)     'investment demand'
   YH0(h)    'household income'
   S0(ac)    'savings by institution';

X0(i)     = sum(a$ai(a,i), sum(c$ci(c,i), SAM(a,c)));
M0(i)     = sum(c$ci(c,i), SAM('RoW',c));
E0(i)     = sum(c$ci(c,i), SAM(c,'RoW'));
Q0(i)     = X0(i) + M0(i);
D0(i)     = X0(i) - E0(i);
INT0(j,i) = sum((c,a)$(ci(c,j) and ai(a,i)), SAM(c,a));
F0(f,i)   = sum(a$ai(a,i), SAM(f,a));
VA0(i)    = sum(f, F0(f,i));
TXA0(i)   = sum(a$ai(a,i), SAM('Govt',a));
C0(i,h)   = sum(c$ci(c,i), SAM(c,h));
G0(i)     = sum(c$ci(c,i), SAM(c,'Govt'));
I0(i)     = sum(c$ci(c,i), SAM(c,'S_I'));
YH0(h)    = rowtot(h);
S0(ac)    = SAM('S_I',ac);

* ---------------- 3. Calibrated shares ----------------
Parameters
   io(j,i)    'input-output coefficient'
   alphaL(i)  'labour share of value added'
   msh(i)     'import share of supply'
   esh(i)     'export share of output'
   beta(i,h)  'consumption budget shares'
   mps(h)     'household saving rate'
   ty(h)      'direct + consumption tax rate on households'
   isha(i)    'investment shares';

io(j,i)   = INT0(j,i) / X0(i);
alphaL(i) = F0('Labour',i) / VA0(i);
msh(i)    = M0(i) / Q0(i);
esh(i)    = E0(i) / X0(i);
beta(i,h) = C0(i,h) / sum(j, C0(j,h));
mps(h)    = S0(h) / YH0(h);
ty(h)     = SAM('Govt',h) / YH0(h);
isha(i)   = I0(i) / sum(j, I0(j));

Display X0, M0, E0, D0, VA0, io, alphaL, msh, esh, beta, mps, ty, isha, S0;

* Energy cost share of each sector: the Hormuz shock channel
Parameter ecost(i) 'energy input as % of output';
ecost(i) = 100 * INT0('Energy',i) / X0(i);
Display ecost;
