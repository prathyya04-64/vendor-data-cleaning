
-- ============================================================
-- TABLE 1: PRIMARY GOLDEN VENDOR MASTER CATALOG
-- ============================================================

CREATE TABLE IF NOT EXISTS gold_vendor_master (
    vendor_id TEXT PRIMARY KEY,
    vendor_name TEXT NOT NULL,
    country TEXT NOT NULL,
    onboarded_date TEXT NOT NULL,
    lead_time_days INTEGER NOT NULL,
    is_lead_time_imputed INTEGER NOT NULL,
    contract_value_usd REAL NOT NULL,
    source_system TEXT NOT NULL,
    last_modified TEXT NOT NULL,
    processed_at TEXT NOT NULL
);


-- ============================================================
-- TABLE 2: NORMALIZED MATERIAL CATEGORIES BRIDGE TABLE
-- ============================================================

CREATE TABLE IF NOT EXISTS gold_vendor_categories (
    vendor_id TEXT NOT NULL,
    material_category TEXT NOT NULL,
    PRIMARY KEY (vendor_id, material_category),
    FOREIGN KEY (vendor_id) REFERENCES gold_vendor_master(vendor_id)
);


-- ============================================================
-- TABLE 3: EXCEPTION AUDIT QUARANTINE VAULT
-- ============================================================

CREATE TABLE IF NOT EXISTS err_vendor_quarantine (
    quarantine_id INTEGER PRIMARY KEY AUTOINCREMENT,
    vendor_id TEXT,
    vendor_name TEXT,
    country TEXT,
    onboarded_date TEXT,
    lead_time_days REAL,
    contract_value_usd TEXT,
    material_categories TEXT,
    source_system TEXT,
    last_modified TEXT,
    rejection_reason TEXT NOT NULL,
    processed_at TEXT NOT NULL
);
