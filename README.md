# Hormuz Energy Shock CGE Model for Pakistan

**Paper:** *Energy Shocks in an Import-Dependent Economy: A CGE Assessment of a Strait of Hormuz Disruption for Pakistan*
**Author:** Zulfiqar Ali Mir, Black Iron Quantum AI (Pvt.) Ltd., NIC Islamabad
**Status:** First full draft complete (September 2026). Target journal to be decided with co-author.

This repository holds everything used to build the paper: raw data, the 2015-16 Social Accounting Matrix (SAM), the GAMS model files, results, and a full development log.

## Headline results (+71% energy import price, fixed real-wage closure)

| Indicator | Change |
|---|---|
| Real GDP | −0.54% |
| Unemployment | +1.92% of labour force |
| Investment | −3.0% |
| Exchange rate (PKR depreciation) | +5.0% |
| Energy output / energy jobs | −1.5% / −26% |
| Urban / rural welfare | −2.50% / −2.31% |

## Repository structure

| Folder | Contents |
|---|---|
| `data/raw/` | PBS Supply-Use & Input-Output tables 2015-16, PBS Special Tables 2023-24, PBS National Accounts Report 2025-26 |
| `data/README.md` | Every data source, including figures taken from LFS, HIES, MoF and SBP reports (with links) |
| `sam/` | `Pakistan_SAM_2015-16.xlsx` (balanced 15-account SAM), `build_sam.py` (script that builds it), `pak_sam_2015_16.inc` (GAMS data) |
| `gams/` | Six GAMS files in the order they were built (see `gams/README.md`) |
| `results/` | Final results, sensitivity results and superseded runs as CSV |
| `paper/` | Link to the paper and place for the Word/PDF export |
| `docs/` | RASTA CGP 9.0 call poster, equation screenshots |
| `DEVELOPMENT_STORY.md` | Full chronological story of how the paper was built |

## How to reproduce

1. `cd sam && python build_sam.py` → rebuilds the SAM from the PBS IO table (needs `pandas`, `openpyxl`).
2. Open `gams/01_sam_check_calibrate.gms` in GAMS (tested on 23.5.1) → must print **SAM balanced**.
3. Run `gams/02_benchmark_replication.gms` → must print **BENCHMARK REPLICATED**.
4. Run `gams/05_shock_v3_final_model.gms` → final results (Tables 9–11 of the paper).
5. Run `gams/06_sensitivity_analysis.gms` → sensitivity results (Table 12).

All GAMS files are self-contained (SAM data is embedded; no `$include` needed).
