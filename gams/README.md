# GAMS files (run in this order)

| File | Purpose | Result |
|---|---|---|
| `01_sam_check_calibrate.gms` | Loads SAM, checks row = column, computes calibration shares | SAM balanced (max gap 0.1, rounding) |
| `02_benchmark_replication.gms` | Full CGE model (77 equations, 77 variables), benchmark test | BENCHMARK REPLICATED, all deviations 0 |
| `03_shock_v1_full_employment.gms` | First shock runs (+30%, +71%), full employment, energy Armington 0.56 | GDP ≈ 0, energy output rose (unrealistic) → superseded |
| `04_shock_v2_two_closures.gms` | Adds unemployment closure (fixed real wage) | GDP −0.98% at +71%, but energy output still rose → superseded |
| `05_shock_v3_final_model.gms` | **Final model**: energy Armington 0.1 (near-Leontief imports) | Paper results (Tables 9–11) |
| `06_sensitivity_analysis.gms` | 7 cases, each recalibrated and replicated before the shock | Paper Table 12 |

Tested with GAMS 23.5.1, solver CONOPT 3, solved as NLP with a dummy objective.
Units: PKR trillion (SAM ÷ 1e6). Numeraire: CPI = 1.
