# Pharmaceutical Procurement Intelligence – Vendor Master Consolidation

## 1. Project Overview

This project consolidates dirty vendor records from two sources:
- ERP Vendor Master CSV
- Manual Procurement Log CSV

The pipeline cleans and standardizes vendor data, validates records, removes duplicates, handles missing values, normalizes material categories, and stores the processed data in a SQLite database.

Invalid records are separated into a quarantine report for manual review.

## 2. Business Objective

To create a single, reliable vendor master by combining multiple procurement data sources and improving data quality, consistency, and accuracy.

## 3. Technologies Used

- Python
- Pandas
- SQLite
- SQL
- Git
- GitHub
- VS Code

## 4. Project Structure

```text
Vendor_Master_Consolidation/
│
├── config/
│   └── config.example.ini
│
├── data/
│   ├── raw/
│   │   ├── erp_vendor_master.csv
│   │   └── manual_procurement_log.csv
│   │
│   └── output/
│
├── database/
├── logs/
│
├── sql/
│   ├── ddl_schema.sql
│   └── verification_queries.sql
│
├── src/
│   └── consolidate_vendor_master.py
│
├── .gitignore
├── requirements.txt
└── README.md
```

## 5. Key Processing Steps

1. Load vendor data from ERP and manual procurement CSV files.
2. Standardize vendor names, IDs, and country values.
3. Clean numeric values and parse dates.
4. Validate records and quarantine invalid data.
5. Impute missing lead times using the median.
6. Remove duplicate vendors and retain the latest record.
7. Normalize material categories using Pandas explode().
8. Load processed records into SQLite.
9. Execute SQL verification queries.
10. Generate the quarantine report and execution logs.

## 6. Installation and Setup

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/pharma-vendor-master-pipeline.git
cd pharma-vendor-master-pipeline
```

Create a virtual environment:

```bash
python -m venv .venv
```

Activate it on Windows:

```bash
.venv\Scripts\activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

## 7. Configuration Setup

Copy the example configuration file:

```bash
copy config/config.example.ini config.ini
```

Update the paths if required.

The actual config.ini file is excluded from GitHub to protect local environment settings.

## 8. Pipeline Execution

Run the Python script:

```bash
python src/consolidate_vendor_master.py
```

## 9. Expected Outputs

The pipeline generates:

- `database/pharmaceutical_procurement.db` – SQLite database containing processed vendor records.
- `data/output/quarantine_report.csv` – Invalid records requiring manual review.
- `logs/` – Execution logs containing pipeline activities and validation results.

These runtime files are maintained locally and excluded from GitHub.

## 10. Database Tables

| Table | Purpose |
|---|---|
| gold_vendor_master | Stores cleaned vendor master records |
| gold_vendor_categories | Stores normalized vendor-category relationships |
| err_vendor_quarantine | Stores invalid vendor records |

## 11. Verification

The SQL verification scripts are available in:

`sql/verification_queries.sql`

They verify:
- Golden vendor master records.
- Material category breakdown and procurement spend.
- Quarantined vendor records.

## 12. Version Control

This project uses Git and GitHub for version control.

- Main branch: `main`
- Feature branch: `feature/quarantine-and-dedup`
- Meaningful commits are maintained to track development progress.
- Sensitive configuration files and generated database files are excluded using `.gitignore`.