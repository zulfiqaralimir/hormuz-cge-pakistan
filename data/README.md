# Data sources

## Files in `data/raw/`

| File | Source | Used for |
|---|---|---|
| `PBS_SUTs_and_IOT_2015-16.xlsx` | Pakistan Bureau of Statistics, National Accounts page: https://www.pbs.gov.pk/national-accounts-2/ | Core SAM: intermediate use, gross output, value added, final demand, imports, exports, product taxes (sheet "Input Output table", 68 industries, basic prices) |
| `PBS_Special_Tables_Output_IC_2023-24.xlsx` | PBS, same page | Checked for a labour/capital split (not available) |
| `PBS_National_Accounts_Report_2025-26.pdf` | PBS | Checked for compensation of employees by sector (only definitions, no data) |

## Figures taken from published reports (not stored as files)

| Item | Value used | Source |
|---|---|---|
| Employment by industry, share of 57.42 m employed | Agri 42.3%, Mfg 15.3%, Construction 7.3%, Trade 14.6%, Transport 5.4%, Community 13.2%, Others 1.9% | PBS Labour Force Survey 2014-15, Annual Report (Table 13): https://www.pbs.gov.pk/sites/default/files/labour_force/publications/lfs2014_15/Annual_Report_of_LFS_2014-15.pdf |
| Average monthly wage by industry (Rs) | Agri 7,804; Mfg 13,478; Construction 12,032; Trade 10,711; Transport 16,220; Community 21,443; Electricity 25,379; Mining 14,968; Finance 36,659 | LFS 2014-15 (Table 30) |
| Assumption | Energy = 0.5% of employed; finance etc. = 1.4% | Authors' split of LFS "Others" (tested in sensitivity) |
| Average monthly household income | Urban Rs 45,283; Rural Rs 30,110; National Rs 35,662 → 36.6% of households urban | PBS HIES 2015-16 key indicators |
| Average monthly household consumption | Urban Rs 41,529; Rural Rs 27,414 → urban 46.65% of consumption | HIES 2015-16 |
| Income sources (% of income) | Urban: wages 51.16, crops 1.33, livestock 1.01, other non-agri 17.95, property 3.03, owner-occupied 14.16, foreign remittances 4.47. Rural: wages 32.05, crops 16.46, livestock 13.72, other non-agri 9.69, property 3.03, owner-occupied 7.22, foreign remittances 6.85 | HIES 2015-16, Table 11 |
| Direct taxes FY16 | PKR 1,191.6 bn | MoF fiscal operations FY16 |
| Pensions FY16 | PKR 222.5 bn | MoF |
| Interest FY16 | Domestic 1,150.8 bn; foreign 112.6 bn | MoF |
| Federal deficit FY16 (validation) | PKR 1,637.8 bn | MoF |
| Workers' remittances FY16 | US$19.92 bn | SBP Balance of Payments Review FY16: https://www.sbp.org.pk/publications/bop/BOPFY16/Review.pdf |
| Current account deficit FY16 (validation) | US$3,394 m | SBP |
| Exchange rate FY16 | ~Rs 104.2 per US$ (approximate average) | SBP |

## Sector mapping (PSIC codes in the IO table)

- Agriculture: 01–03
- Energy: 05–09 (mining), 19 (petroleum refining), 35 (electricity & gas)
- Manufacturing: 10–33 excluding 19
- Services: all remaining codes

## Data not obtained

- IFPRI 2007-08 SAM (Debowicz et al., 2012): requested from ifpri@cgiar.org, no data received.
