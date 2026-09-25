# Development Story: Hormuz Energy Shock CGE Paper

A complete, step-by-step record of how this paper was built, from the first idea to the finished draft (24–25 September 2026).

---

## Phase 1 — Choosing the research topic

**Step 1. The trigger: RASTA CGP 9.0 call.**
The starting point was the PIDE/Planning Commission RASTA Competitive Grants Programme 9.0 "Call for Research Ideas" (poster in `docs/`). Deadline: 10 October 2026. It lists 11 research themes based on the URAAN Pakistan economic missions.

**Step 2. Matching themes to existing work.**
Three themes fit existing projects: Theme 06 (E-Pakistan & AI), Theme 05 (Energy, Water & Environment) and Theme 11 (Investment Facilitation).

**Step 3. Choosing the method: CGE modelling.**
CGE was chosen. The strongest pitch was Theme 05: *"Energy Price Shocks and Pakistan's Economy: A CGE Assessment of Resilience Policies."* A tax-reform CGE paper (Theme 02) was parked for later.

**Step 4. Deciding to write a research paper first, in small steps.**

**Step 5. Linking to the existing Hormuz paper.**
An earlier project already applied MIMAP Model EXTER to a Strait of Hormuz shock. The research question was fixed as: *How would a Hormuz oil/LNG supply shock affect Pakistan's GDP, sectors, households and fiscal balance, and which policies reduce the damage?*

**Step 6. Recognising the data problem.**
The earlier model had a critical gap: the IFPRI 2007-08 SAM (51 sectors) had been requested but never received, so the model ran on unbalanced PBS 2015-16 figures, lacked factor-income equations and could not replicate a benchmark. Decision: **build a new, balanced 2015-16 SAM ourselves** — without it, nothing else could proceed.

---

## Phase 2 — Building the Social Accounting Matrix (SAM)

**Step 7. Designing the SAM structure.**
Accounts: 4 activities, 4 commodities (Agriculture, Energy, Manufacturing, Services), Labour, Capital, Urban and Rural households, Government, Rest of World, Savings-Investment. (Planned as 14 × 14; the final SAM has 15 accounts because government and tax were merged.)

**Step 8. Why energy is a separate sector.**
The Hormuz shock enters through energy import prices. A separate energy sector is needed to apply the shock directly, trace energy as an intermediate input, and use energy-specific elasticities.

**Step 9. First attempt at the activity/commodity block — and a correction.**
Output figures from the old GAMS file (e.g. energy output 5.45 trn) were tried first, but they did not match the official IO table (energy 3.83 trn). Decision: rebuild **every** block from one consistent source, the PBS IO table.

**Step 10. Getting the PBS data.**
The PBS National Accounts page link was found. The user downloaded and uploaded:
- *Supply-Use Tables and Input-Output Table 2015-16* (Excel)
- *Special Tables: Output and IC at current and constant prices 2023-24* (Excel)

**Step 11. Aggregating the IO table (68 → 4 sectors).**
Energy = mining (PSIC 05–09) + refining (19) + electricity/gas (35). The 4 × 4 intermediate matrix was extracted; column totals matched PBS intermediate consumption exactly. Key finding: Services buys 1.48 trn of energy, three times Manufacturing.

**Step 12. Final demand block.**
Household + NPISH consumption, government consumption, investment (GFCF + valuables + inventories), exports and imports by sector. **Balance check passed with zero error** (intermediate use + final demand − imports = gross output).

**Step 13. Factor split — the second data gap.**
The IO table gives only total value added. PBS does not publish compensation of employees by sector. Options considered: LFS wages, the IFPRI SAM, or GTAP shares. **LFS 2014-15 chosen.**

**Step 14. The LFS download problem.**
Both links (PBS and ILO mirror) failed for the user. The user uploaded the *National Accounts Report 2025-26* instead, but it only defines the income approach, with no sector data. The LFS PDF was then read directly online. It gave employment by industry (Table 13) and average monthly wages (Table 30).

**Step 15. Labour income calculation.**
Labour income = employed × average wage × 12. Self-employed valued at the employee wage. Energy assumed to be 0.5% of employment (LFS lumps it into "Others"). Result: labour shares Agri 31%, Energy 5%, Mfg 41%, Services 25%; economy-wide 27%.

**Step 16. Household block (HIES 2015-16).**
From average incomes, 36.6% of households are urban. Initial split: urban received 58% of labour income and 39% of capital income. Urban households account for 46.65% of consumption. Remittances split 36% urban / 64% rural.

**Step 17. Government block (MoF FY16).**
Receipts: product taxes 2,217 bn (IO table) + direct taxes 1,192 bn. Payments: consumption 3,472 bn, pensions 223 bn, domestic interest 1,151 bn, foreign interest 113 bn. Government saving −1,549 bn vs the official federal deficit of 1,638 bn — within about 5%.

**Step 18. Rest of World block (SBP FY16).**
Workers' remittances US$19.92 bn × Rs 104.2 = PKR 2,076 bn. Foreign savings (balancing item) came out near the official current account deficit (about 402 bn in the final SAM vs 353 bn official).

**Step 19. Assembling the SAM in Excel.**
`Pakistan_SAM_2015-16.xlsx` built with Python (`sam/build_sam.py`). Data cells in blue with source comments; savings residuals in yellow as formulas. **All 15 accounts balanced.**

**Step 20. Problem: rural saving rate higher than urban (22% vs 14%).**
Cause: all crop, livestock and business income had been treated as capital, pushing capital income to rural households.

**Step 21. Fix: Gollin (2002) rule.**
Self-employment income split ⅔ labour, ⅓ capital. New saving rates: urban 18.9%, rural 18.6% — consistent with HIES, where both groups save similar shares. SAM still balanced.

---

## Phase 3 — Moving the SAM into GAMS

**Step 22. GAMS data file and check script.**
`pak_sam_2015_16.inc` plus `sam_check_calibrate.gms` to check balance and compute calibration shares.

**Step 23. Error 282 — include file not found.**
The GAMS IDE runs from its project folder, not Downloads. Fix: embed the SAM data directly in the `.gms` file.

**Step 24. SAM confirmed balanced in GAMS.**
Maximum gap 0.1 (rounding). Calibrated values: energy import share 18%, energy cost share of Services output 5.4%, both household saving rates about 19%.

---

## Phase 4 — Building and testing the CGE model

**Step 25. Writing the full model.**
MIMAP Model 0 + EXTER structure with two households: Leontief intermediates, Cobb-Douglas value added (sector-specific capital, mobile labour), CET exports, Armington imports, government, RoW, savings-driven investment, flexible exchange rate, CPI numeraire. 77 equations, 77 variables. Data scaled to PKR trillion.

**Step 26. Pre-check in Python.**
All equations were rebuilt in Python and checked at benchmark values before sending to GAMS: every residual was zero.

**Step 27. Error 194 — duplicate Sets block.**
The data section had been copied along with the sets. Fix: remove the duplicate.

**Step 28. BENCHMARK REPLICATED.**
All variables returned to base values, deviations 0.000%, Walras slack 0. Solver: CONOPT, normal completion.

---

## Phase 5 — Running the Hormuz shock and fixing the model

**Step 29. First shock runs (v1).**
Energy import price +30% and +71%. Results: rupee depreciation, falling wages, welfare −0.9% to −2.0%. Two problems:
1. Real GDP ≈ 0 (full employment means labour just moves around).
2. Domestic energy output *rose* (the model let local energy replace imports).

**Step 30. Fix 1: unemployment closure (v2).**
Added a fixed real-wage closure where unemployment adjusts, and corrected household income so the unemployed are not paid. Result: GDP −0.98%, unemployment +3.5% at +71%. But energy output still rose (+0.24%).

**Step 31. Fix 2: near-Leontief energy imports (v3, final).**
Energy Armington elasticity lowered from 0.56 to 0.1, reflecting refinery and power-plant dependence on imported crude, LNG and furnace oil. Result: **energy output now falls** (−1.49%), energy jobs −26%, GDP −0.54%, unemployment +1.92%, rupee +5.0%, welfare −2.3% to −2.5%.

---

## Phase 6 — Deciding the output

**Step 32. RASTA proposal vs journal paper.**
Previous RASTA rounds required a cover sheet, proposal, budget and CVs (up to Rs 4 m, 12 months). Decision: **write the journal paper first**, then use it for the grant.

**Step 33. Journal choice deferred.**
Options listed (PDR, Energy Policy, Journal of Policy Modeling, Energy Economics). The paper was written in a journal-neutral format (~8,000 words).

---

## Phase 7 — Writing the paper

**Step 34. Creating the paper document.**
The old "Hormuz Energy Shock CGE Paper" doc could not be opened, so a new doc was created with a 10-section outline.

**Step 35. Section 1 — Introduction.** Problem, research gap, three contributions, key results table.

**Step 36. Section 2 — Energy import dependence.** SAM-based energy indicators and how the shock spreads.

**Step 37. Section 3 — Literature review.** Web searches on oil-shock CGE studies, Pakistan CGE work, and the 2026 Hormuz studies (Dallas Fed, Kiel Institute). Our welfare loss (2.3–2.5%) falls inside Kiel's 1.8–3.5% range for South Asia.

**Step 38. Section 4 — SAM construction.** Accounts, sources, construction steps, validation and limitations.

**Step 39. Section 5 — The model.** Eleven equations. (First attempt failed because the doc format needs formulas as separate LaTeX blocks.)

**Step 40. Sections 6 and 7 — Scenarios and results.** Macro, sectoral, household and fiscal tables from the GAMS output.

**Step 41. Sensitivity analysis run.**
New GAMS file with 7 cases (Armington ×0.5 / ×2, energy Armington 0.56, CET ×0.5 / ×2, energy labour share 20%). Each case recalibrated and replicated the benchmark exactly. Findings: welfare loss robust (−2.3% to −2.9%), investment robust (≈ −3%), exchange rate most sensitive (2.4–7.7%).

**Step 42. Section 8 — Sensitivity analysis written**, including a correction to one overstated sentence.

**Step 43. Sections 9 and 10 — Policy implications and conclusion.** Protect jobs, let the exchange rate adjust, avoid broad fuel subsidies, build strategic storage, diversify supply. Limitations and future work listed.

**Step 44. Abstract and references.**

**Step 45. Citation clean-up.**
All [cite] placeholders filled; author names verified (Mohanasundari et al. 2025; Sánchez 2011); weak sources removed; unsourced Brent figures replaced with the cited March 2026 price doubling; scenario wording changed to "sustained" shocks.

**Step 46. Proofread.** Wording and consistency fixes; references put in alphabetical order.

**Step 47. Table numbering.** All tables numbered 1–12.

**Step 48. Equation layout fix.** The long current-account equation was split over two lines to stop horizontal scrolling.

**Step 49. Export.** The paper can be downloaded from the doc as Word or PDF.

---

## Phase 8 — Journal selection

**Step 50. NUST Business Review (NBR) checked.** HEC recognised, Y category (DOAJ-indexed). Concern: business and management scope.

**Step 51. NUST Journal of Social Sciences and Humanities (NJSSH) suggested** as a better fit (Y category, social sciences including economics; ISSN 2523-0026 online / 2520-503X print).

**Step 52. Co-author review.** Final journal choice to be made by Dr Naqvi.

**Step 53. This repository** was created to store all data, code, results and this story.

---

## Key numbers at a glance

| Item | Value |
|---|---|
| SAM size | 15 accounts, PKR million, 2015-16 |
| Model size | 77 equations / 77 variables |
| Final energy Armington elasticity | 0.1 |
| Central result (+71%, fixed wage) | GDP −0.54%, unemployment +1.92 pp, welfare −2.3 to −2.5% |
