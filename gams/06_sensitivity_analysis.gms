$TITLE Pakistan CGE 2015-16: Hormuz shock - sensitivity analysis (Section 8)
$ONTEXT
Hormuz Energy Shock CGE paper -- Step: benchmark replication on the new balanced SAM.
Model: Leontief intermediates + Cobb-Douglas value added (sector-specific capital,
mobile labour), CET export supply, Armington imports, 2 households (urban/rural),
government, RoW, savings-driven investment. Numeraire: CPI = 1. Flexible exchange rate,
fixed foreign savings. Units: PKR trillion (SAM / 1e6) for numerical stability.
PASS condition: all variables return to base values (max % deviation ~ 0) and WALRAS = 0.
$OFFTEXT

* ======================= 0. SAM DATA (PKR million) =======================
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

* ======================= 1. SETS =======================
Sets
   i  'sectors'  / Agri, Energy, Mfg, Serv /
   h(ac) 'households'  / HH_Urban, HH_Rural /
   a(ac) 'activities'  / Act_Agri, Act_Energy, Act_Mfg, Act_Serv /
   c(ac) 'commodities' / Com_Agri, Com_Energy, Com_Mfg, Com_Serv /
   ai(ac,i) / Act_Agri.Agri, Act_Energy.Energy, Act_Mfg.Mfg, Act_Serv.Serv /
   ci(ac,i) / Com_Agri.Agri, Com_Energy.Energy, Com_Mfg.Mfg, Com_Serv.Serv /;
Alias (i,j);

Parameter SAMs(ac,acp) 'SAM in PKR trillion';
SAMs(ac,acp) = SAM(ac,acp)/1e6;

* ======================= 2. BENCHMARK LEVELS =======================
Parameters X0(i), E0(i), M0(i), D0(i), Q0(i), INT0(j,i), L0(i), K0(i), VA0(i),
           TXA0(i), CH0(i,h), G0(i), I0(i), YH0(h), TRG0(h), REM0(h);
Scalars    LS0 'labour supply', FINT0 'foreign interest', FSAV0 'foreign savings',
           TOTSAV0 'total savings', YG0 'govt revenue', SG0 'govt savings';

X0(i)     = sum(a$ai(a,i), sum(c$ci(c,i), SAMs(a,c)));
E0(i)     = sum(c$ci(c,i), SAMs(c,'RoW'));
M0(i)     = sum(c$ci(c,i), SAMs('RoW',c));
D0(i)     = X0(i) - E0(i);
Q0(i)     = D0(i) + M0(i);
INT0(j,i) = sum((c,a)$(ci(c,j) and ai(a,i)), SAMs(c,a));
L0(i)     = sum(a$ai(a,i), SAMs('Labour',a));
K0(i)     = sum(a$ai(a,i), SAMs('Capital',a));
VA0(i)    = L0(i) + K0(i);
TXA0(i)   = sum(a$ai(a,i), SAMs('Govt',a));
CH0(i,h)  = sum(c$ci(c,i), SAMs(c,h));
G0(i)     = sum(c$ci(c,i), SAMs(c,'Govt'));
I0(i)     = sum(c$ci(c,i), SAMs(c,'S_I'));
YH0(h)    = sum(acp, SAMs(h,acp));
TRG0(h)   = SAMs(h,'Govt');
REM0(h)   = SAMs(h,'RoW');
LS0       = sum(i, L0(i));
FINT0     = SAMs('RoW','Govt');
FSAV0     = SAMs('S_I','RoW');
TOTSAV0   = sum(acp, SAMs('S_I',acp));
YG0       = sum(acp, SAMs('Govt',acp));
SG0       = SAMs('S_I','Govt');

* ======================= 3. CALIBRATION =======================
Parameters io(j,i), vashr(i), alpha(i), aVA(i), tx(i), shL(h), shK(h), ty(h), mps(h),
           beta(i,h), isha(i), cwts(i), pwm(i), pwe(i),
           sigQ(i) 'Armington elasticity' / Agri 1.5, Energy 0.1, Mfg 1.5, Serv 0.8 /
           sigT(i) 'CET elasticity'       / Agri 0.9, Energy 0.5,  Mfg 1.5, Serv 0.7 /
           rq(i), dq(i), aq(i), rt(i), gamT(i), at(i);
Scalars    te 'export tax rate', tinv 'tax rate on investment';

io(j,i)   = INT0(j,i)/X0(i);
vashr(i)     = VA0(i)/X0(i);
alpha(i)  = L0(i)/VA0(i);
aVA(i)    = VA0(i)/(L0(i)**alpha(i) * K0(i)**(1-alpha(i)));
tx(i)     = TXA0(i)/X0(i);
shL(h)    = SAMs(h,'Labour')/LS0;
shK(h)    = SAMs(h,'Capital')/sum(i, K0(i));
ty(h)     = SAMs('Govt',h)/YH0(h);
mps(h)    = SAMs('S_I',h)/YH0(h);
beta(i,h) = CH0(i,h)/sum(j, CH0(j,h));
te        = SAMs('Govt','RoW')/sum(i, E0(i));
tinv      = SAMs('Govt','S_I')/sum(i, I0(i));
isha(i)   = I0(i)*(1+tinv)/TOTSAV0;
cwts(i)   = sum(h, CH0(i,h))/sum((j,h), CH0(j,h));
pwm(i)    = 1;
pwe(i)    = 1;
* Armington (CES)
* Energy sigQ = 0.1 (near-Leontief): domestic refining and power depend on
* imported crude, LNG and furnace oil, so domestic energy cannot replace imports.
* Imports and domestic energy supply now move together (Step 2 fix).
rq(i)     = 1/sigQ(i) - 1;
dq(i)     = (M0(i)/D0(i))**(1+rq(i)) / (1 + (M0(i)/D0(i))**(1+rq(i)));
aq(i)     = Q0(i)/(dq(i)*M0(i)**(-rq(i)) + (1-dq(i))*D0(i)**(-rq(i)))**(-1/rq(i));
* CET
rt(i)     = 1/sigT(i) + 1;
gamT(i)   = 1/(1 + (E0(i)/D0(i))**(rt(i)-1));
at(i)     = X0(i)/(gamT(i)*E0(i)**rt(i) + (1-gamT(i))*D0(i)**rt(i))**(1/rt(i));

* ======================= 4. VARIABLES =======================
Variables
   X(i)     'gross output'
   VA(i)    'value added'
   LD(i)    'labour demand'
   PX(i)    'output price'
   PVA(i)   'value-added price'
   WK(i)    'rental rate of capital'
   D(i)     'domestic sales'
   E(i)     'exports'
   M(i)     'imports'
   Q(i)     'Armington composite'
   PD(i)    'domestic price'
   PE(i)    'export price (PKR)'
   PM(i)    'import price (PKR)'
   PQ(i)    'composite price'
   INV(i)   'investment demand'
   CH(i,h)  'household consumption'
   YH(h)    'household income'
   W        'wage'
   YG       'govt revenue'
   SG       'govt savings'
   TOTSAV   'total savings'
   ER       'exchange rate'
   CPI      'consumer price index'
   UNEMP    'unemployed labour (PKR tn at base wage)'
   WALRAS   'Walras slack (must be 0)'
   OMEGA    'dummy objective';

* ======================= 5. EQUATIONS =======================
Equations eVAPROD(i), eLAB(i), eCAP(i), eVA(i), eZP(i), eCET(i), eCETFOC(i),
          eCETVAL(i), eARM(i), eARMFOC(i), eARMVAL(i), ePM(i), ePE(i), eMKT(i),
          eLS, eYH(h), eCH(i,h), eYG, eSG, eTOTSAV, eINV(i), eBOP, eCPI, eOBJ;

eVAPROD(i).. VA(i) =e= aVA(i)*LD(i)**alpha(i)*K0(i)**(1-alpha(i));
eLAB(i)..    W*LD(i) =e= alpha(i)*PVA(i)*VA(i);
eCAP(i)..    WK(i)*K0(i) =e= (1-alpha(i))*PVA(i)*VA(i);
eVA(i)..     VA(i) =e= vashr(i)*X(i);
eZP(i)..     PX(i)*(1-tx(i))*X(i) =e= PVA(i)*VA(i) + sum(j, PQ(j)*io(j,i))*X(i);
eCET(i)..    X(i) =e= at(i)*(gamT(i)*E(i)**rt(i) + (1-gamT(i))*D(i)**rt(i))**(1/rt(i));
eCETFOC(i).. E(i) =e= D(i)*((PE(i)/PD(i))*(1-gamT(i))/gamT(i))**(1/(rt(i)-1));
eCETVAL(i).. PX(i)*X(i) =e= PE(i)*E(i) + PD(i)*D(i);
eARM(i)..    Q(i) =e= aq(i)*(dq(i)*M(i)**(-rq(i)) + (1-dq(i))*D(i)**(-rq(i)))**(-1/rq(i));
eARMFOC(i).. M(i) =e= D(i)*((PD(i)/PM(i))*dq(i)/(1-dq(i)))**(1/(1+rq(i)));
eARMVAL(i).. PQ(i)*Q(i) =e= PD(i)*D(i) + PM(i)*M(i);
ePM(i)..     PM(i) =e= ER*pwm(i);
ePE(i)..     PE(i) =e= ER*pwe(i);
eMKT(i)..    Q(i) =e= sum(j, io(i,j)*X(j)) + sum(h, CH(i,h)) + G0(i) + INV(i);
eLS..        sum(i, LD(i)) + UNEMP =e= LS0;
eYH(h)..     YH(h) =e= shL(h)*W*sum(i, LD(i)) + shK(h)*sum(i, WK(i)*K0(i)) + TRG0(h)*CPI + REM0(h)*ER;
eCH(i,h)..   PQ(i)*CH(i,h) =e= beta(i,h)*(1-ty(h)-mps(h))*YH(h);
eYG..        YG =e= sum(i, tx(i)*PX(i)*X(i)) + sum(h, ty(h)*YH(h))
                    + te*sum(i, PE(i)*E(i)) + tinv*sum(i, PQ(i)*INV(i));
eSG..        SG =e= YG - sum(i, PQ(i)*G0(i)) - sum(h, TRG0(h))*CPI - FINT0*ER;
eTOTSAV..    TOTSAV =e= sum(h, mps(h)*YH(h)) + SG + FSAV0*ER;
eINV(i)..    PQ(i)*INV(i)*(1+tinv) =e= isha(i)*TOTSAV;
eBOP..       sum(i, pwm(i)*M(i))*ER + FINT0*ER =e= (1+te)*sum(i, PE(i)*E(i))
                    + sum(h, REM0(h))*ER + FSAV0*ER + WALRAS;
eCPI..       CPI =e= sum(i, cwts(i)*PQ(i));
eOBJ..       OMEGA =e= 1;

* ======================= 6. INITIAL VALUES, BOUNDS, NUMERAIRE =======================
X.l(i)=X0(i); VA.l(i)=VA0(i); LD.l(i)=L0(i); D.l(i)=D0(i); E.l(i)=E0(i); M.l(i)=M0(i);
Q.l(i)=Q0(i); INV.l(i)=I0(i); CH.l(i,h)=CH0(i,h); YH.l(h)=YH0(h);
PX.l(i)=1; PVA.l(i)=1; WK.l(i)=1; PD.l(i)=1; PE.l(i)=1; PM.l(i)=1; PQ.l(i)=1;
W.l=1; UNEMP.l=0; ER.l=1; CPI.l=1; YG.l=YG0; SG.l=SG0; TOTSAV.l=TOTSAV0; WALRAS.l=0; OMEGA.l=1;

X.lo(i)=1e-6; VA.lo(i)=1e-6; LD.lo(i)=1e-6; D.lo(i)=1e-6; E.lo(i)=1e-6; M.lo(i)=1e-6;
Q.lo(i)=1e-6; PX.lo(i)=1e-6; PVA.lo(i)=1e-6; WK.lo(i)=1e-6; PD.lo(i)=1e-6;
PE.lo(i)=1e-6; PM.lo(i)=1e-6; PQ.lo(i)=1e-6; W.lo=1e-6; ER.lo=1e-6;

CPI.fx = 1;

Model PAKCGE / all /;
PAKCGE.holdfixed = 1;
Option limrow=0, limcol=0, solprint=off;

* ======================= 7. SENSITIVITY ANALYSIS =======================
* Central case: UNEMP closure, B71 shock (+71% energy import price).
* Each case recalibrates the model, checks benchmark replication, then applies the shock.
Set sc 'sensitivity cases'
   / central   'central elasticities (Table 2)'
     armLow    'all Armington elasticities x0.5'
     armHigh   'all Armington elasticities x2'
     enArm056  'energy Armington = 0.56 (substitutable imports)'
     cetLow    'all CET elasticities x0.5'
     cetHigh   'all CET elasticities x2'
     enLab20   'energy labour share of VA = 20% (vs 4.9%)' /
    s2 'runs' / base, B71 /;

Parameters
   sigQ0(i), sigT0(i), L0orig(i), K0orig(i)
   fQ(sc) 'Armington multiplier' / central 1, armLow 0.5, armHigh 2, enArm056 1, cetLow 1, cetHigh 1, enLab20 1 /
   fT(sc) 'CET multiplier'       / central 1, armLow 1, armHigh 1, enArm056 1, cetLow 0.5, cetHigh 2, enLab20 1 /
   shk2(s2) / base 0, B71 0.71 /
   labE 'energy labour share'
   sens(*,sc)  'B71 UNEMP results: % change from base'
   chk(sc)     'benchmark replication max abs % deviation (must be 0)'
   U0(h), Ut(h);

sigQ0(i) = sigQ(i);  sigT0(i) = sigT(i);
L0orig(i) = L0(i);   K0orig(i) = K0(i);

Loop(sc,
* ---- recalibrate for this case ----
   sigQ(i) = sigQ0(i)*fQ(sc);
   sigT(i) = sigT0(i)*fT(sc);
   if(sameas(sc,'enArm056'), sigQ('Energy') = 0.56;);

   L0(i) = L0orig(i);  K0(i) = K0orig(i);
   if(sameas(sc,'enLab20'),
      L0('Energy') = 0.20*VA0('Energy');
      K0('Energy') = VA0('Energy') - L0('Energy');
   );
   LS0      = sum(i, L0(i));
   alpha(i) = L0(i)/VA0(i);
   aVA(i)   = VA0(i)/(L0(i)**alpha(i) * K0(i)**(1-alpha(i)));
* household income shares (shL, shK) keep their SAM values; income, tax and saving rates recalibrated
   YH0(h)   = shL(h)*LS0 + shK(h)*sum(i, K0(i)) + TRG0(h) + REM0(h);
   ty(h)    = SAMs('Govt',h)/YH0(h);
   mps(h)   = (YH0(h) - SAMs('Govt',h) - sum(i, CH0(i,h)))/YH0(h);
   rq(i)    = 1/sigQ(i) - 1;
   dq(i)    = (M0(i)/D0(i))**(1+rq(i)) / (1 + (M0(i)/D0(i))**(1+rq(i)));
   aq(i)    = Q0(i)/(dq(i)*M0(i)**(-rq(i)) + (1-dq(i))*D0(i)**(-rq(i)))**(-1/rq(i));
   rt(i)    = 1/sigT(i) + 1;
   gamT(i)  = 1/(1 + (E0(i)/D0(i))**(rt(i)-1));
   at(i)    = X0(i)/(gamT(i)*E0(i)**rt(i) + (1-gamT(i))*D0(i)**rt(i))**(1/rt(i));
   U0(h)    = prod(i, CH0(i,h)**beta(i,h));

   Loop(s2,
      X.l(i)=X0(i); VA.l(i)=VA0(i); LD.l(i)=L0(i); D.l(i)=D0(i); E.l(i)=E0(i); M.l(i)=M0(i);
      Q.l(i)=Q0(i); INV.l(i)=I0(i); CH.l(i,h)=CH0(i,h); YH.l(h)=YH0(h);
      PX.l(i)=1; PVA.l(i)=1; WK.l(i)=1; PD.l(i)=1; PE.l(i)=1; PM.l(i)=1; PQ.l(i)=1;
      ER.l=1; YG.l=YG0; SG.l=SG0; TOTSAV.l=TOTSAV0; WALRAS.l=0;
      UNEMP.l=0; UNEMP.lo=-inf; UNEMP.up=+inf;
      W.fx = 1;
      pwm(i) = 1;
      pwm('Energy') = 1 + shk2(s2);

      Solve PAKCGE using NLP minimizing OMEGA;

      if(sameas(s2,'base'),
         chk(sc) = max(smax(i, abs(100*(X.l(i)/X0(i)-1))), smax(h, abs(100*(YH.l(h)/YH0(h)-1))),
                       abs(100*(ER.l-1)), abs(WALRAS.l));
      );
      if(sameas(s2,'B71'),
         Ut(h) = prod(i, CH.l(i,h)**beta(i,h));
         sens('Real GDP',sc)          = 100*(sum(i, VA.l(i))/sum(i, VA0(i)) - 1);
         sens('Employment',sc)        = 100*(sum(i, LD.l(i))/LS0 - 1);
         sens('Exchange rate',sc)     = 100*(ER.l - 1);
         sens('Investment',sc)        = 100*(sum(i, INV.l(i))/sum(i, I0(i)) - 1);
         sens('Energy output',sc)     = 100*(X.l('Energy')/X0('Energy') - 1);
         sens('Energy jobs',sc)       = 100*(LD.l('Energy')/L0('Energy') - 1);
         sens('Energy imports',sc)    = 100*(M.l('Energy')/M0('Energy') - 1);
         sens('Energy price PQ',sc)   = 100*(PQ.l('Energy') - 1);
         sens('Urban welfare',sc)     = 100*(Ut('HH_Urban')/U0('HH_Urban') - 1);
         sens('Rural welfare',sc)     = 100*(Ut('HH_Rural')/U0('HH_Rural') - 1);
         sens('Model status',sc)      = PAKCGE.modelstat;
         sens('WALRAS',sc)            = WALRAS.l;
      );
   );
);

Option sens:2, chk:6;
Display chk, sens;
