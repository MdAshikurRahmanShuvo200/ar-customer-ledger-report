-- ১. ডাটাবেস তৈরি ও ব্যবহার
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Demo_Database')
BEGIN
    CREATE DATABASE Demo_Database;
END
GO

USE Demo_Database;
GO

-- ২. অরিজিনাল কলাম নেম সহ টেবিল তৈরি
IF OBJECT_ID('dbo.AR_TRANSACTION_DEMO', 'U') IS NOT NULL
    DROP TABLE dbo.AR_TRANSACTION_DEMO;
GO

CREATE TABLE dbo.AR_TRANSACTION_DEMO (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionDate DATE NOT NULL,
    TransactionType VARCHAR(50) NOT NULL,
    IDCUST VARCHAR(20) NOT NULL,              -- [Customer ID]
    [DOC NUMBER] VARCHAR(30) NOT NULL,
    AppliedDocument VARCHAR(30) DEFAULT 'N/A',
    NAMECUST NVARCHAR(100),                  -- [Customer Name]
    IDACCTSET VARCHAR(10),                   -- [Account Set ID]
    TEXTDESC NVARCHAR(50),                   -- [Account Set Name]
    CNTBTCH INT,                             -- [Batch Number]
    CNTITEM INT,                             -- [Entry No]
    SourceCode VARCHAR(10),
    DocNumber VARCHAR(30),                   -- [Document Number]
    Description NVARCHAR(255),               -- [Entry Description]
    BankCode VARCHAR(10),
    [Bank Name] NVARCHAR(100),
    Invoice DECIMAL(19,3),
    [Debit Note] DECIMAL(19,3),
    [Credit Note] DECIMAL(19,3),
    Receipt DECIMAL(19,3),
    [Advance Receipt] DECIMAL(19,3),
    [Unapplied Cash] DECIMAL(19,3),
    [Apply Document] DECIMAL(19,3),
    [Write-Off] DECIMAL(19,3),
    Adjustment DECIMAL(19,3)
);
GO

-- ৩. ৫০টি ডেমো ডেটা ইনসার্ট
INSERT INTO dbo.AR_TRANSACTION_DEMO 
(TransactionDate, TransactionType, IDCUST, [DOC NUMBER], AppliedDocument, NAMECUST, IDACCTSET, TEXTDESC, CNTBTCH, CNTITEM, SourceCode, DocNumber, Description, BankCode, [Bank Name], Invoice, [Debit Note], [Credit Note], Receipt, [Advance Receipt], [Unapplied Cash], [Apply Document], [Write-Off], Adjustment)
VALUES
('2026-01-01', 'Invoice', 'CUST-101', 'IN-2026-001', ' ', 'Apex Footwear Ltd.', 'AC-COMM', 'Commercial Accounts', 101, 1, 'AR-IN', 'IN-2026-001', 'Product sale invoice', NULL, NULL, 150000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-02', 'Invoice', 'CUST-102', 'IN-2026-002', ' ', 'Beximco Pharma', 'AC-CORP', 'Corporate Accounts', 101, 2, 'AR-IN', 'IN-2026-002', 'Supply of raw materials', NULL, NULL, 320000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-03', 'Receipt', 'CUST-101', 'OR-2026-001', 'IN-2026-001', 'Apex Footwear Ltd.', 'AC-COMM', 'Commercial Accounts', 201, 1, 'AR-PY', 'IN-2026-001', 'Partial payment against IN-001', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 50000.00, NULL, NULL, NULL, NULL, NULL),
('2026-01-04', 'Invoice', 'CUST-103', 'IN-2026-003', ' ', 'Square Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 101, 3, 'AR-IN', 'IN-2026-003', 'IT Infrastructure Setup', NULL, NULL, 450000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-05', 'Credit Note', 'CUST-102', 'CR-2026-001', 'IN-2026-002', 'Beximco Pharma', 'AC-CORP', 'Corporate Accounts', 102, 1, 'AR-CR', 'IN-2026-002', 'Damaged goods return credit', NULL, NULL, NULL, NULL, 20000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-06', 'Advance Receipt', 'CUST-104', 'AR-2026-001', 'AR-2026-001', 'Walton Hi-Tech PLC', 'AC-RTL', 'Retail Accounts', 201, 2, 'AR-PI', 'AR-2026-001', 'Advance deposit for Q1 order', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 100000.00, NULL, NULL, NULL, NULL),
('2026-01-07', 'Receipt', 'CUST-102', 'OR-2026-002', 'IN-2026-002', 'Beximco Pharma', 'AC-CORP', 'Corporate Accounts', 201, 3, 'AR-PY', 'IN-2026-002', 'Full payment for IN-002 balance', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 300000.00, NULL, NULL, NULL, NULL, NULL),
('2026-01-08', 'Invoice', 'CUST-105', 'IN-2026-004', ' ', 'PRAN Foods Ltd.', 'AC-COMM', 'Commercial Accounts', 103, 1, 'AR-IN', 'IN-2026-004', 'Machinery sales invoice', NULL, NULL, 600000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-09', 'Debit Note', 'CUST-103', 'DN-2026-001', 'IN-2026-003', 'Square Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 103, 2, 'AR-DN', 'IN-2026-003', 'Late payment interest charge', NULL, NULL, NULL, 5000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-10', 'Unapplied Cash', 'CUST-105', 'UC-2026-001', 'N/A', 'PRAN Foods Ltd.', 'AC-COMM', 'Commercial Accounts', 202, 1, 'AR-UC', 'UC-2026-001', 'Overpayment received', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, NULL, NULL, 15000.00, NULL, NULL, NULL),

('2026-01-11', 'Invoice', 'CUST-106', 'IN-2026-005', ' ', 'ACI Limited', 'AC-CORP', 'Corporate Accounts', 104, 1, 'AR-IN', 'IN-2026-005', 'Chemical supply delivery', NULL, NULL, 210000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-12', 'Receipt', 'CUST-103', 'OR-2026-003', 'IN-2026-003', 'Square Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 202, 2, 'AR-PY', 'IN-2026-003', 'Clearing IN-2026-003 full', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 450000.00, NULL, NULL, NULL, NULL, NULL),
('2026-01-13', 'Write-Off', 'CUST-107', 'WO-2026-001', 'N/A', 'Legacy Retail Traders', 'AC-RTL', 'Retail Accounts', 301, 1, 'AR-WO', 'IN-2025-999', 'Bad debt write-off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12500.00, NULL),
('2026-01-14', 'Adjustment', 'CUST-101', 'AD-2026-001', 'IN-2026-001', 'Apex Footwear Ltd.', 'AC-COMM', 'Commercial Accounts', 301, 2, 'AR-AD', 'IN-2026-001', 'Rounding discount correction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250.00),
('2026-01-15', 'Invoice', 'CUST-108', 'IN-2026-006', ' ', 'Jamuna Group', 'AC-CORP', 'Corporate Accounts', 105, 1, 'AR-IN', 'IN-2026-006', 'Raw material shipment', NULL, NULL, 800000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-16', 'Apply Document', 'CUST-104', 'AP-2026-001', 'IN-2026-007', 'Walton Hi-Tech PLC', 'AC-RTL', 'Retail Accounts', 203, 1, 'AR-AD', 'IN-2026-007', 'Applied advance to new invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100000.00, NULL, NULL),
('2026-01-17', 'Invoice', 'CUST-104', 'IN-2026-007', ' ', 'Walton Hi-Tech PLC', 'AC-RTL', 'Retail Accounts', 105, 2, 'AR-IN', 'IN-2026-007', 'Electronics components', NULL, NULL, 250000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-18', 'Receipt', 'CUST-106', 'OR-2026-004', 'IN-2026-005', 'ACI Limited', 'AC-CORP', 'Corporate Accounts', 203, 2, 'AR-PY', 'IN-2026-005', 'Cheque deposit against IN-005', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 210000.00, NULL, NULL, NULL, NULL, NULL),
('2026-01-19', 'Credit Note', 'CUST-108', 'CR-2026-002', 'IN-2026-006', 'Jamuna Group', 'AC-CORP', 'Corporate Accounts', 106, 1, 'AR-CR', 'IN-2026-006', 'Price discrepancy rebate', NULL, NULL, NULL, NULL, 40000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-20', 'Invoice', 'CUST-109', 'IN-2026-008', ' ', 'Akij Group', 'AC-COMM', 'Commercial Accounts', 106, 2, 'AR-IN', 'IN-2026-008', 'Packaging material sales', NULL, NULL, 180000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),

('2026-01-21', 'Receipt', 'CUST-108', 'OR-2026-005', 'IN-2026-006', 'Jamuna Group', 'AC-CORP', 'Corporate Accounts', 204, 1, 'AR-PY', 'IN-2026-006', 'Partial wire transfer', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL, NULL),
('2026-01-22', 'Invoice', 'CUST-110', 'IN-2026-009', ' ', 'Bashundhara Paper', 'AC-CORP', 'Corporate Accounts', 107, 1, 'AR-IN', 'IN-2026-009', 'Paper pulp delivery', NULL, NULL, 340000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-23', 'Advance Receipt', 'CUST-109', 'AR-2026-002', 'AR-2026-002', 'Akij Group', 'AC-COMM', 'Commercial Accounts', 204, 2, 'AR-PI', 'AR-2026-002', 'Advance for next shipment', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 50000.00, NULL, NULL, NULL, NULL),
('2026-01-24', 'Invoice', 'CUST-111', 'IN-2026-010', ' ', 'Renata Limited', 'AC-CORP', 'Corporate Accounts', 107, 2, 'AR-IN', 'IN-2026-010', 'Lab equipment sale', NULL, NULL, 120000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-25', 'Receipt', 'CUST-110', 'OR-2026-006', 'IN-2026-009', 'Bashundhara Paper', 'AC-CORP', 'Corporate Accounts', 205, 1, 'AR-PY', 'IN-2026-009', 'Full payment for IN-009', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 340000.00, NULL, NULL, NULL, NULL, NULL),
('2026-01-26', 'Debit Note', 'CUST-105', 'DN-2026-002', 'IN-2026-004', 'PRAN Foods Ltd.', 'AC-COMM', 'Commercial Accounts', 108, 1, 'AR-DN', 'IN-2026-004', 'Additional freight charges', NULL, NULL, NULL, 15000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-27', 'Invoice', 'CUST-112', 'IN-2026-011', ' ', 'Incepta Pharma', 'AC-CORP', 'Corporate Accounts', 108, 2, 'AR-IN', 'IN-2026-011', 'Pharma packaging boxes', NULL, NULL, 290000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-28', 'Receipt', 'CUST-111', 'OR-2026-007', 'IN-2026-010', 'Renata Limited', 'AC-CORP', 'Corporate Accounts', 205, 2, 'AR-PY', 'IN-2026-010', 'EFT Transfer from Renata', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 120000.00, NULL, NULL, NULL, NULL, NULL),
('2026-01-29', 'Credit Note', 'CUST-112', 'CR-2026-003', 'IN-2026-011', 'Incepta Pharma', 'AC-CORP', 'Corporate Accounts', 109, 1, 'AR-CR', 'IN-2026-011', 'Special promotional discount', NULL, NULL, NULL, NULL, 10000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-30', 'Invoice', 'CUST-113', 'IN-2026-012', ' ', 'Partex Group', 'AC-COMM', 'Commercial Accounts', 109, 2, 'AR-IN', 'IN-2026-012', 'Furniture supplies', NULL, NULL, 95000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),

('2026-02-01', 'Receipt', 'CUST-109', 'OR-2026-008', 'IN-2026-008', 'Akij Group', 'AC-COMM', 'Commercial Accounts', 206, 1, 'AR-PY', 'IN-2026-008', 'Clearing IN-008 invoice', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 130000.00, NULL, NULL, NULL, NULL, NULL),
('2026-02-02', 'Invoice', 'CUST-114', 'IN-2026-013', ' ', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 110, 1, 'AR-IN', 'IN-2026-013', 'Consumer goods supply', NULL, NULL, 175000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-03', 'Unapplied Cash', 'CUST-113', 'UC-2026-002', 'N/A', 'Partex Group', 'AC-COMM', 'Commercial Accounts', 206, 2, 'AR-UC', 'UC-2026-002', 'Excess cheque clearing', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, NULL, NULL, 5000.00, NULL, NULL, NULL),
('2026-02-04', 'Receipt', 'CUST-112', 'OR-2026-009', 'IN-2026-011', 'Incepta Pharma', 'AC-CORP', 'Corporate Accounts', 207, 1, 'AR-PY', 'IN-2026-011', 'Settlement after credit note', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 280000.00, NULL, NULL, NULL, NULL, NULL),
('2026-02-05', 'Invoice', 'CUST-115', 'IN-2026-014', ' ', 'Kazi Farms Group', 'AC-COMM', 'Commercial Accounts', 110, 2, 'AR-IN', 'IN-2026-014', 'Feed ingredients delivery', NULL, NULL, 510000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-06', 'Write-Off', 'CUST-116', 'WO-2026-002', 'N/A', 'Small Trade Agency', 'AC-RTL', 'Retail Accounts', 302, 1, 'AR-WO', 'IN-2025-888', 'Small balance waiver', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1500.00, NULL),
('2026-02-07', 'Advance Receipt', 'CUST-115', 'AR-2026-003', 'AR-2026-003', 'Kazi Farms Group', 'AC-COMM', 'Commercial Accounts', 207, 2, 'AR-PI', 'AR-2026-003', 'Booking deposit', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 200000.00, NULL, NULL, NULL, NULL),
('2026-02-08', 'Invoice', 'CUST-117', 'IN-2026-015', ' ', 'Ha-Meem Group', 'AC-CORP', 'Corporate Accounts', 111, 1, 'AR-IN', 'IN-2026-015', 'Garments accessories', NULL, NULL, 390000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-09', 'Receipt', 'CUST-114', 'OR-2026-010', 'IN-2026-013', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 208, 1, 'AR-PY', 'IN-2026-013', 'Full invoice payment', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 175000.00, NULL, NULL, NULL, NULL, NULL),
('2026-02-10', 'Credit Note', 'CUST-117', 'CR-2026-004', 'IN-2026-015', 'Ha-Meem Group', 'AC-CORP', 'Corporate Accounts', 111, 2, 'AR-CR', 'IN-2026-015', 'Shortage in delivered quantity', NULL, NULL, NULL, NULL, 15000.00, NULL, NULL, NULL, NULL, NULL, NULL),

('2026-02-11', 'Invoice', 'CUST-118', 'IN-2026-016', ' ', 'Envoy Textiles', 'AC-CORP', 'Corporate Accounts', 112, 1, 'AR-IN', 'IN-2026-016', 'Yarn supply invoice', NULL, NULL, 620000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-12', 'Receipt', 'CUST-117', 'OR-2026-011', 'IN-2026-015', 'Ha-Meem Group', 'AC-CORP', 'Corporate Accounts', 208, 2, 'AR-PY', 'IN-2026-015', 'Payment post CR note', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 375000.00, NULL, NULL, NULL, NULL, NULL),
('2026-02-13', 'Adjustment', 'CUST-118', 'AD-2026-002', 'IN-2026-016', 'Envoy Textiles', 'AC-CORP', 'Corporate Accounts', 302, 2, 'AR-AD', 'IN-2026-016', 'Tax deduction adjustment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10000.00),
('2026-02-14', 'Invoice', 'CUST-119', 'IN-2026-017', ' ', 'DBL Group', 'AC-CORP', 'Corporate Accounts', 112, 2, 'AR-IN', 'IN-2026-017', 'Dyeing chemical supply', NULL, NULL, 280000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-15', 'Receipt', 'CUST-118', 'OR-2026-012', 'IN-2026-016', 'Envoy Textiles', 'AC-CORP', 'Corporate Accounts', 209, 1, 'AR-PY', 'IN-2026-016', 'Part payment received', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 300000.00, NULL, NULL, NULL, NULL, NULL),
('2026-02-16', 'Invoice', 'CUST-120', 'IN-2026-018', ' ', 'Pacific Jeans', 'AC-CORP', 'Corporate Accounts', 113, 1, 'AR-IN', 'IN-2026-018', 'Denim fabric sales', NULL, NULL, 730000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-17', 'Advance Receipt', 'CUST-120', 'AR-2026-004', 'AR-2026-004', 'Pacific Jeans', 'AC-CORP', 'Corporate Accounts', 209, 2, 'AR-PI', 'AR-2026-004', 'Part advance for order #2', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 150000.00, NULL, NULL, NULL, NULL),
('2026-02-18', 'Receipt', 'CUST-119', 'OR-2026-013', 'IN-2026-017', 'DBL Group', 'AC-CORP', 'Corporate Accounts', 210, 1, 'AR-PY', 'IN-2026-017', 'Full payment by Cheque', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 280000.00, NULL, NULL, NULL, NULL, NULL),
('2026-02-19', 'Debit Note', 'CUST-120', 'DN-2026-003', 'IN-2026-018', 'Pacific Jeans', 'AC-CORP', 'Corporate Accounts', 113, 2, 'AR-DN', 'IN-2026-018', 'Express delivery charges', NULL, NULL, NULL, 8000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20', 'Receipt', 'CUST-120', 'OR-2026-014', 'IN-2026-018', 'Pacific Jeans', 'AC-CORP', 'Corporate Accounts', 210, 2, 'AR-PY', 'IN-2026-018', 'Settlement payment', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 588000.00, NULL, NULL, NULL, NULL, NULL);
GO

-- ৪. অরিজিনাল কলাম নেম ও লজিক অপরিবর্তিত রেখে CREATE OR ALTER VIEW
CREATE OR ALTER VIEW vw_AR_TRANSACTION
AS

WITH CalculatedLedger AS
(
    SELECT 
        Ledger.TransactionDate,
        Ledger.TransactionType,
        Ledger.IDCUST AS [Customer ID],

        Ledger.[DOC NUMBER] AS [DOC NUMBER],
        Ledger.AppliedDocument AS [Applied Document],
        Ledger.NAMECUST AS [Customer Name],
        
        Ledger.IDACCTSET AS [Account Set ID],
        Ledger.TEXTDESC AS [Account Set Name],
        
        Ledger.CNTBTCH AS [Batch Number],
        Ledger.CNTITEM AS [Entry No],
        Ledger.SourceCode,
        Ledger.DocNumber AS [Document Number],
        Ledger.Description AS [Entry Description],
        Ledger.BankCode,
        Ledger.[Bank Name],

        Ledger.Invoice,
        Ledger.[Debit Note],
        Ledger.[Credit Note],
        Ledger.Receipt,
        Ledger.[Advance Receipt],
        Ledger.[Unapplied Cash],
        Ledger.[Apply Document],
        Ledger.[Write-Off],
        Ledger.Adjustment,

        /* ==========================================================
           Transaction Amount
           ========================================================== */
        ISNULL(Ledger.Invoice, 0)
          - ISNULL(Ledger.[Debit Note], 0)
          + ISNULL(Ledger.[Credit Note], 0)
          - ISNULL(Ledger.Receipt, 0)
          - ISNULL(Ledger.[Advance Receipt], 0)
          - ISNULL(Ledger.[Unapplied Cash], 0)
          - ISNULL(Ledger.[Apply Document], 0)
          - ISNULL(Ledger.[Write-Off], 0)
          + ISNULL(Ledger.Adjustment, 0)
          AS [Transaction Amount],

        /* ==========================================================
           Opening Balance
           ========================================================== */
        COALESCE(
            SUM(
                ISNULL(Ledger.Invoice, 0)
                  - ISNULL(Ledger.[Debit Note], 0)
                  + ISNULL(Ledger.[Credit Note], 0)
                  - ISNULL(Ledger.Receipt, 0)
                  - ISNULL(Ledger.[Advance Receipt], 0)
                  - ISNULL(Ledger.[Unapplied Cash], 0)
                  - ISNULL(Ledger.[Apply Document], 0)
                  - ISNULL(Ledger.[Write-Off], 0)
                  + ISNULL(Ledger.Adjustment, 0)
            ) OVER (
                PARTITION BY Ledger.IDCUST
                ORDER BY
                    Ledger.TransactionDate,
                    Ledger.CNTBTCH,
                    Ledger.CNTITEM
                ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
            ),
            0
        ) AS [Opening Balance],

        /* ==========================================================
           Debit
           ========================================================== */
        CASE
            WHEN
                (
                    ISNULL(Ledger.Invoice, 0)
                      - ISNULL(Ledger.[Debit Note], 0)
                      + ISNULL(Ledger.[Credit Note], 0)
                      - ISNULL(Ledger.Receipt, 0)
                      - ISNULL(Ledger.[Advance Receipt], 0)
                      - ISNULL(Ledger.[Unapplied Cash], 0)
                      - ISNULL(Ledger.[Apply Document], 0)
                      - ISNULL(Ledger.[Write-Off], 0)
                      + ISNULL(Ledger.Adjustment, 0)
                ) > 0
            THEN
                (
                    ISNULL(Ledger.Invoice, 0)
                      - ISNULL(Ledger.[Debit Note], 0)
                      + ISNULL(Ledger.[Credit Note], 0)
                      - ISNULL(Ledger.Receipt, 0)
                      - ISNULL(Ledger.[Advance Receipt], 0)
                      - ISNULL(Ledger.[Unapplied Cash], 0)
                      - ISNULL(Ledger.[Apply Document], 0)
                      - ISNULL(Ledger.[Write-Off], 0)
                      + ISNULL(Ledger.Adjustment, 0)
                )
            ELSE 0
        END AS [Debit],

        /* ==========================================================
           Credit
           ========================================================== */
        CASE
            WHEN
                (
                    ISNULL(Ledger.Invoice, 0)
                      - ISNULL(Ledger.[Debit Note], 0)
                      + ISNULL(Ledger.[Credit Note], 0)
                      - ISNULL(Ledger.Receipt, 0)
                      - ISNULL(Ledger.[Advance Receipt], 0)
                      - ISNULL(Ledger.[Unapplied Cash], 0)
                      - ISNULL(Ledger.[Apply Document], 0)
                      - ISNULL(Ledger.[Write-Off], 0)
                      + ISNULL(Ledger.Adjustment, 0)
                ) < 0
            THEN
                ABS(
                    ISNULL(Ledger.Invoice, 0)
                      - ISNULL(Ledger.[Debit Note], 0)
                      + ISNULL(Ledger.[Credit Note], 0)
                      - ISNULL(Ledger.Receipt, 0)
                      - ISNULL(Ledger.[Advance Receipt], 0)
                      - ISNULL(Ledger.[Unapplied Cash], 0)
                      - ISNULL(Ledger.[Apply Document], 0)
                      - ISNULL(Ledger.[Write-Off], 0)
                      + ISNULL(Ledger.Adjustment, 0)
                )
            ELSE 0
        END AS [Credit],

        /* ==========================================================
           Closing Amount
           ========================================================== */
        SUM(
            ISNULL(Ledger.Invoice, 0)
              - ISNULL(Ledger.[Debit Note], 0)
              + ISNULL(Ledger.[Credit Note], 0)
              - ISNULL(Ledger.Receipt, 0)
              - ISNULL(Ledger.[Advance Receipt], 0)
              - ISNULL(Ledger.[Unapplied Cash], 0)
              - ISNULL(Ledger.[Apply Document], 0)
              - ISNULL(Ledger.[Write-Off], 0)
              + ISNULL(Ledger.Adjustment, 0)
        ) OVER (
            PARTITION BY Ledger.IDCUST
            ORDER BY
                Ledger.TransactionDate,
                Ledger.CNTBTCH,
                Ledger.CNTITEM
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS [Closing Amount]

    FROM dbo.AR_TRANSACTION_DEMO AS Ledger
)
SELECT 
    TransactionDate,
    TransactionType,
    [Customer ID],
        TRY_CONVERT(
        INT,
        REPLACE([Customer ID], 'CUST-', '')
    ) AS Customer_ID_M,
    [DOC NUMBER],
    [Applied Document],
    [Customer Name],
    [Account Set ID],
    [Account Set Name],
    [Batch Number],
    [Entry No],
    SourceCode AS [Source Code],
    CASE 
        WHEN SourceCode = 'AR-IN' THEN DATEDIFF(DAY, TransactionDate, CAST(GETDATE() AS DATE))
        ELSE NULL 
    END AS [Days Over],
    [Document Number],
    [Entry Description],
    BankCode,
    [Bank Name],
    Invoice,
    [Debit Note],
    [Credit Note],
    Receipt,
    [Advance Receipt],
    [Unapplied Cash],
    [Apply Document],
    [Write-Off],
    Adjustment,
    [Transaction Amount],
    [Opening Balance],
    Debit,
    Credit,
    [Closing Amount]
FROM CalculatedLedger;
GO





USE Demo_Database;
GO

-- ১০০টি অতিরিক্ত ডেমো ডেটা ইনসার্ট (Row 51 - 150)
INSERT INTO dbo.AR_TRANSACTION_DEMO 
(TransactionDate, TransactionType, IDCUST, [DOC NUMBER], AppliedDocument, NAMECUST, IDACCTSET, TEXTDESC, CNTBTCH, CNTITEM, SourceCode, DocNumber, Description, BankCode, [Bank Name], Invoice, [Debit Note], [Credit Note], Receipt, [Advance Receipt], [Unapplied Cash], [Apply Document], [Write-Off], Adjustment)
VALUES
-- February 2026 Continuation (Row 51 - 80)
('2026-02-21', 'Invoice', 'CUST-101', 'IN-2026-019', ' ', 'Apex Footwear Ltd.', 'AC-COMM', 'Commercial Accounts', 114, 1, 'AR-IN', 'IN-2026-019', 'Leather batch shipment', NULL, NULL, 420000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-21', 'Invoice', 'CUST-102', 'IN-2026-020', ' ', 'Beximco Pharma', 'AC-CORP', 'Corporate Accounts', 114, 2, 'AR-IN', 'IN-2026-020', 'Active pharma ingredients', NULL, NULL, 650000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22', 'Receipt', 'CUST-115', 'OR-2026-015', 'IN-2026-014', 'Kazi Farms Group', 'AC-COMM', 'Commercial Accounts', 211, 1, 'AR-PY', 'IN-2026-014', 'Part payment for feed order', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 300000.00, NULL, NULL, NULL, NULL, NULL),
('2026-02-22', 'Credit Note', 'CUST-118', 'CR-2026-005', 'IN-2026-016', 'Envoy Textiles', 'AC-CORP', 'Corporate Accounts', 115, 1, 'AR-CR', 'IN-2026-016', 'Quality allowance deduction', NULL, NULL, NULL, NULL, 25000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23', 'Advance Receipt', 'CUST-121', 'AR-2026-005', 'AR-2026-005', 'BSRM Steels', 'AC-CORP', 'Corporate Accounts', 211, 2, 'AR-PI', 'AR-2026-005', 'Advance for steel rods', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL),
('2026-02-23', 'Invoice', 'CUST-121', 'IN-2026-021', ' ', 'BSRM Steels', 'AC-CORP', 'Corporate Accounts', 115, 2, 'AR-IN', 'IN-2026-021', 'Structural steel delivery', NULL, NULL, 1200000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24', 'Receipt', 'CUST-101', 'OR-2026-016', 'IN-2026-019', 'Apex Footwear Ltd.', 'AC-COMM', 'Commercial Accounts', 212, 1, 'AR-PY', 'IN-2026-019', 'Full clearing for IN-019', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 420000.00, NULL, NULL, NULL, NULL, NULL),
('2026-02-24', 'Invoice', 'CUST-122', 'IN-2026-022', ' ', 'LafargeHolcim BD', 'AC-CORP', 'Corporate Accounts', 116, 1, 'AR-IN', 'IN-2026-022', 'Bulk cement supply', NULL, NULL, 890000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25', 'Unapplied Cash', 'CUST-103', 'UC-2026-003', 'N/A', 'Square Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 212, 2, 'AR-UC', 'UC-2026-003', 'Unidentified bank credit', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, NULL, 45000.00, NULL, NULL, NULL),
('2026-02-25', 'Invoice', 'CUST-123', 'IN-2026-023', ' ', 'Marico Bangladesh', 'AC-COMM', 'Commercial Accounts', 116, 2, 'AR-IN', 'IN-2026-023', 'Consumer oil packaging', NULL, NULL, 310000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-26', 'Debit Note', 'CUST-122', 'DN-2026-004', 'IN-2026-022', 'LafargeHolcim BD', 'AC-CORP', 'Corporate Accounts', 117, 1, 'AR-DN', 'IN-2026-022', 'Demurrage charges added', NULL, NULL, NULL, 12000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-26', 'Receipt', 'CUST-102', 'OR-2026-017', 'IN-2026-020', 'Beximco Pharma', 'AC-CORP', 'Corporate Accounts', 213, 1, 'AR-PY', 'IN-2026-020', 'EFT payment against IN-020', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 650000.00, NULL, NULL, NULL, NULL, NULL),
('2026-02-27', 'Apply Document', 'CUST-121', 'AP-2026-002', 'IN-2026-021', 'BSRM Steels', 'AC-CORP', 'Corporate Accounts', 213, 2, 'AR-AD', 'IN-2026-021', 'Applied advance to IN-021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500000.00, NULL, NULL),
('2026-02-27', 'Invoice', 'CUST-124', 'IN-2026-024', ' ', 'Nestle Bangladesh', 'AC-CORP', 'Corporate Accounts', 117, 2, 'AR-IN', 'IN-2026-024', 'Food processing ingredients', NULL, NULL, 540000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-28', 'Receipt', 'CUST-122', 'OR-2026-018', 'IN-2026-022', 'LafargeHolcim BD', 'AC-CORP', 'Corporate Accounts', 214, 1, 'AR-PY', 'IN-2026-022', 'Partial payment with debit note', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL, NULL),
('2026-02-28', 'Adjustment', 'CUST-123', 'AD-2026-003', 'IN-2026-023', 'Marico Bangladesh', 'AC-COMM', 'Commercial Accounts', 303, 1, 'AR-AD', 'IN-2026-023', 'Rebate adjustment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1500.00),

-- March 2026 Transactions (Row 67 - 150)
('2026-03-01', 'Invoice', 'CUST-105', 'IN-2026-025', ' ', 'PRAN Foods Ltd.', 'AC-COMM', 'Commercial Accounts', 118, 1, 'AR-IN', 'IN-2026-025', 'Export quality juice bottles', NULL, NULL, 780000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-01', 'Advance Receipt', 'CUST-125', 'AR-2026-006', 'AR-2026-006', 'Olympic Industries', 'AC-COMM', 'Commercial Accounts', 214, 2, 'AR-PI', 'AR-2026-006', 'Biscuits line advance', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 180000.00, NULL, NULL, NULL, NULL),
('2026-03-02', 'Receipt', 'CUST-123', 'OR-2026-019', 'IN-2026-023', 'Marico Bangladesh', 'AC-COMM', 'Commercial Accounts', 215, 1, 'AR-PY', 'IN-2026-023', 'Final settlement IN-023', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 308500.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-02', 'Invoice', 'CUST-126', 'IN-2026-026', ' ', 'Unilever Bangladesh', 'AC-CORP', 'Corporate Accounts', 118, 2, 'AR-IN', 'IN-2026-026', 'Personal care raw items', NULL, NULL, 920000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-03', 'Credit Note', 'CUST-124', 'CR-2026-006', 'IN-2026-024', 'Nestle Bangladesh', 'AC-CORP', 'Corporate Accounts', 119, 1, 'AR-CR', 'IN-2026-024', 'Promo cashback claim', NULL, NULL, NULL, NULL, 30000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-03', 'Receipt', 'CUST-121', 'OR-2026-020', 'IN-2026-021', 'BSRM Steels', 'AC-CORP', 'Corporate Accounts', 215, 2, 'AR-PY', 'IN-2026-021', 'Balance clearance IN-021', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 700000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-04', 'Invoice', 'CUST-127', 'IN-2026-027', ' ', 'Summit Power Ltd.', 'AC-CORP', 'Corporate Accounts', 119, 2, 'AR-IN', 'IN-2026-027', 'Heavy spare parts', NULL, NULL, 1150000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-04', 'Write-Off', 'CUST-128', 'WO-2026-003', 'N/A', 'City Traders Chittagong', 'AC-RTL', 'Retail Accounts', 303, 2, 'AR-WO', 'IN-2025-777', 'Insolvent customer write-off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35000.00, NULL),
('2026-03-05', 'Receipt', 'CUST-124', 'OR-2026-021', 'IN-2026-024', 'Nestle Bangladesh', 'AC-CORP', 'Corporate Accounts', 216, 1, 'AR-PY', 'IN-2026-024', 'Net payment post CR', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 510000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-05', 'Invoice', 'CUST-125', 'IN-2026-028', ' ', 'Olympic Industries', 'AC-COMM', 'Commercial Accounts', 120, 1, 'AR-IN', 'IN-2026-028', 'Wheat flour bulk batch', NULL, NULL, 430000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-06', 'Apply Document', 'CUST-125', 'AP-2026-003', 'IN-2026-028', 'Olympic Industries', 'AC-COMM', 'Commercial Accounts', 216, 2, 'AR-AD', 'IN-2026-028', 'Advance set off IN-028', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 180000.00, NULL, NULL),
('2026-03-06', 'Receipt', 'CUST-126', 'OR-2026-022', 'IN-2026-026', 'Unilever Bangladesh', 'AC-CORP', 'Corporate Accounts', 217, 1, 'AR-PY', 'IN-2026-026', 'Part payment cheque', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-07', 'Invoice', 'CUST-129', 'IN-2026-029', ' ', 'Meghna Group', 'AC-CORP', 'Corporate Accounts', 120, 2, 'AR-IN', 'IN-2026-029', 'Sugar refine chemicals', NULL, NULL, 670000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-07', 'Debit Note', 'CUST-127', 'DN-2026-005', 'IN-2026-027', 'Summit Power Ltd.', 'AC-CORP', 'Corporate Accounts', 121, 1, 'AR-DN', 'IN-2026-027', 'Special transport surcharge', NULL, NULL, NULL, 25000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-08', 'Receipt', 'CUST-105', 'OR-2026-023', 'IN-2026-025', 'PRAN Foods Ltd.', 'AC-COMM', 'Commercial Accounts', 217, 2, 'AR-PY', 'IN-2026-025', 'Wire transfer received', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 780000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-08', 'Invoice', 'CUST-130', 'IN-2026-030', ' ', 'ACI Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 121, 2, 'AR-IN', 'IN-2026-030', 'Tractor parts supply', NULL, NULL, 380000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-09', 'Unapplied Cash', 'CUST-129', 'UC-2026-004', 'N/A', 'Meghna Group', 'AC-CORP', 'Corporate Accounts', 218, 1, 'AR-UC', 'UC-2026-004', 'Excess wire credit', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, NULL, 20000.00, NULL, NULL, NULL),
('2026-03-09', 'Receipt', 'CUST-127', 'OR-2026-024', 'IN-2026-027', 'Summit Power Ltd.', 'AC-CORP', 'Corporate Accounts', 218, 2, 'AR-PY', 'IN-2026-027', 'Part payment summit', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 800000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-10', 'Credit Note', 'CUST-129', 'CR-2026-007', 'IN-2026-029', 'Meghna Group', 'AC-CORP', 'Corporate Accounts', 122, 1, 'AR-CR', 'IN-2026-029', 'Bulk buying rebate', NULL, NULL, NULL, NULL, 40000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-10', 'Invoice', 'CUST-131', 'IN-2026-031', ' ', 'Grameenphone Ltd.', 'AC-CORP', 'Corporate Accounts', 122, 2, 'AR-IN', 'IN-2026-031', 'Telecom fiber accessories', NULL, NULL, 1450000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),

('2026-03-11', 'Receipt', 'CUST-125', 'OR-2026-025', 'IN-2026-028', 'Olympic Industries', 'AC-COMM', 'Commercial Accounts', 219, 1, 'AR-PY', 'IN-2026-028', 'Remaining balance IN-028', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 250000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-11', 'Invoice', 'CUST-132', 'IN-2026-032', ' ', 'Robi Axiata Ltd.', 'AC-CORP', 'Corporate Accounts', 123, 1, 'AR-IN', 'IN-2026-032', 'Network tower hardware', NULL, NULL, 880000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-12', 'Advance Receipt', 'CUST-133', 'AR-2026-007', 'AR-2026-007', 'Banglalink Digital', 'AC-CORP', 'Corporate Accounts', 219, 2, 'AR-PI', 'AR-2026-007', 'Advance for server racks', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, NULL, 300000.00, NULL, NULL, NULL, NULL),
('2026-03-12', 'Receipt', 'CUST-129', 'OR-2026-026', 'IN-2026-029', 'Meghna Group', 'AC-CORP', 'Corporate Accounts', 220, 1, 'AR-PY', 'IN-2026-029', 'Clearing IN-029 net amount', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 610000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-13', 'Adjustment', 'CUST-130', 'AD-2026-004', 'IN-2026-030', 'ACI Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 304, 1, 'AR-AD', 'IN-2026-030', 'TDS deduction adjustment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8000.00),
('2026-03-13', 'Invoice', 'CUST-133', 'IN-2026-033', ' ', 'Banglalink Digital', 'AC-CORP', 'Corporate Accounts', 123, 2, 'AR-IN', 'IN-2026-033', 'IT Server racks supply', NULL, NULL, 600000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-14', 'Apply Document', 'CUST-133', 'AP-2026-004', 'IN-2026-033', 'Banglalink Digital', 'AC-CORP', 'Corporate Accounts', 220, 2, 'AR-AD', 'IN-2026-033', 'Apply advance to IN-033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 300000.00, NULL, NULL),
('2026-03-14', 'Receipt', 'CUST-131', 'OR-2026-027', 'IN-2026-031', 'Grameenphone Ltd.', 'AC-CORP', 'Corporate Accounts', 221, 1, 'AR-PY', 'IN-2026-031', 'Part payment GP', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 1000000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-15', 'Invoice', 'CUST-134', 'IN-2026-034', ' ', 'Navana Group', 'AC-COMM', 'Commercial Accounts', 124, 1, 'AR-IN', 'IN-2026-034', 'Vehicle battery shipment', NULL, NULL, 410000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-15', 'Credit Note', 'CUST-132', 'CR-2026-008', 'IN-2026-032', 'Robi Axiata Ltd.', 'AC-CORP', 'Corporate Accounts', 124, 2, 'AR-CR', 'IN-2026-032', 'SLA penalty credit', NULL, NULL, NULL, NULL, 18000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-16', 'Receipt', 'CUST-130', 'OR-2026-028', 'IN-2026-030', 'ACI Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 221, 2, 'AR-PY', 'IN-2026-030', 'Final receipt post TDS', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 372000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-16', 'Invoice', 'CUST-135', 'IN-2026-035', ' ', 'Runner Automobiles', 'AC-COMM', 'Commercial Accounts', 125, 1, 'AR-IN', 'IN-2026-035', 'Bike spare parts delivery', NULL, NULL, 260000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-17', 'Receipt', 'CUST-132', 'OR-2026-029', 'IN-2026-032', 'Robi Axiata Ltd.', 'AC-CORP', 'Corporate Accounts', 222, 1, 'AR-PY', 'IN-2026-032', 'Full payment Robi', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 862000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-17', 'Debit Note', 'CUST-134', 'DN-2026-006', 'IN-2026-034', 'Navana Group', 'AC-COMM', 'Commercial Accounts', 125, 2, 'AR-DN', 'IN-2026-034', 'Urgent handling fee', NULL, NULL, NULL, 6000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-18', 'Receipt', 'CUST-133', 'OR-2026-030', 'IN-2026-033', 'Banglalink Digital', 'AC-CORP', 'Corporate Accounts', 222, 2, 'AR-PY', 'IN-2026-033', 'Clear remaining balance', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 300000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-18', 'Invoice', 'CUST-136', 'IN-2026-036', ' ', 'Aftab Autos', 'AC-RTL', 'Retail Accounts', 126, 1, 'AR-IN', 'IN-2026-036', 'Lubricants oil delivery', NULL, NULL, 135000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-19', 'Advance Receipt', 'CUST-137', 'AR-2026-008', 'AR-2026-008', 'Rahimafrooz BD', 'AC-COMM', 'Commercial Accounts', 223, 1, 'AR-PI', 'AR-2026-008', 'Solar panel advance', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 250000.00, NULL, NULL, NULL, NULL),
('2026-03-19', 'Receipt', 'CUST-134', 'OR-2026-031', 'IN-2026-034', 'Navana Group', 'AC-COMM', 'Commercial Accounts', 223, 2, 'AR-PY', 'IN-2026-034', 'Settlement including DN', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 416000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-20', 'Invoice', 'CUST-137', 'IN-2026-037', ' ', 'Rahimafrooz BD', 'AC-COMM', 'Commercial Accounts', 126, 2, 'AR-IN', 'IN-2026-037', 'Solar batteries shipment', NULL, NULL, 580000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-20', 'Write-Off', 'CUST-138', 'WO-2026-004', 'N/A', 'Dhaka Enterprise', 'AC-RTL', 'Retail Accounts', 304, 2, 'AR-WO', 'IN-2025-666', 'Unrecoverable balance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8500.00, NULL),

('2026-03-21', 'Apply Document', 'CUST-137', 'AP-2026-005', 'IN-2026-037', 'Rahimafrooz BD', 'AC-COMM', 'Commercial Accounts', 224, 1, 'AR-AD', 'IN-2026-037', 'Advance adjustment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250000.00, NULL, NULL),
('2026-03-21', 'Receipt', 'CUST-135', 'OR-2026-032', 'IN-2026-035', 'Runner Automobiles', 'AC-COMM', 'Commercial Accounts', 224, 2, 'AR-PY', 'IN-2026-035', 'Cheque clearing Runner', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 260000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-22', 'Invoice', 'CUST-139', 'IN-2026-038', ' ', 'DBL Ceramics', 'AC-CORP', 'Corporate Accounts', 127, 1, 'AR-IN', 'IN-2026-038', 'Ceramic raw glaze supply', NULL, NULL, 720000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-22', 'Credit Note', 'CUST-137', 'CR-2026-009', 'IN-2026-037', 'Rahimafrooz BD', 'AC-COMM', 'Commercial Accounts', 127, 2, 'AR-CR', 'IN-2026-037', 'Warranty discount credit', NULL, NULL, NULL, NULL, 15000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-23', 'Receipt', 'CUST-136', 'OR-2026-033', 'IN-2026-036', 'Aftab Autos', 'AC-RTL', 'Retail Accounts', 225, 1, 'AR-PY', 'IN-2026-036', 'Cash deposit Aftab', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 135000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-23', 'Invoice', 'CUST-140', 'IN-2026-039', ' ', 'RAK Ceramics', 'AC-CORP', 'Corporate Accounts', 128, 1, 'AR-IN', 'IN-2026-039', 'Tiles manufacturing clay', NULL, NULL, 940000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-24', 'Receipt', 'CUST-137', 'OR-2026-034', 'IN-2026-037', 'Rahimafrooz BD', 'AC-COMM', 'Commercial Accounts', 225, 2, 'AR-PY', 'IN-2026-037', 'Final settlement IN-037', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 315000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-24', 'Unapplied Cash', 'CUST-139', 'UC-2026-005', 'N/A', 'DBL Ceramics', 'AC-CORP', 'Corporate Accounts', 226, 1, 'AR-UC', 'UC-2026-005', 'Excess EFT received', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, NULL, 30000.00, NULL, NULL, NULL),
('2026-03-25', 'Debit Note', 'CUST-140', 'DN-2026-007', 'IN-2026-039', 'RAK Ceramics', 'AC-CORP', 'Corporate Accounts', 128, 2, 'AR-DN', 'IN-2026-039', 'Pallet packing fee', NULL, NULL, NULL, 10000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-25', 'Receipt', 'CUST-139', 'OR-2026-035', 'IN-2026-038', 'DBL Ceramics', 'AC-CORP', 'Corporate Accounts', 226, 2, 'AR-PY', 'IN-2026-038', 'Partial payment DBL', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-26', 'Invoice', 'CUST-141', 'IN-2026-040', ' ', 'Crown Cement', 'AC-CORP', 'Corporate Accounts', 129, 1, 'AR-IN', 'IN-2026-040', 'Gypsum supply delivery', NULL, NULL, 610000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-26', 'Receipt', 'CUST-140', 'OR-2026-036', 'IN-2026-039', 'RAK Ceramics', 'AC-CORP', 'Corporate Accounts', 227, 1, 'AR-PY', 'IN-2026-039', 'Full clearing RAK', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 950000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-27', 'Advance Receipt', 'CUST-142', 'AR-2026-009', 'AR-2026-009', 'Premier Cement', 'AC-CORP', 'Corporate Accounts', 227, 2, 'AR-PI', 'AR-2026-009', 'Clinker supply advance', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, NULL, 400000.00, NULL, NULL, NULL, NULL),
('2026-03-27', 'Invoice', 'CUST-142', 'IN-2026-041', ' ', 'Premier Cement', 'AC-CORP', 'Corporate Accounts', 129, 2, 'AR-IN', 'IN-2026-041', 'Clinker bulk shipment', NULL, NULL, 1050000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-28', 'Apply Document', 'CUST-142', 'AP-2026-006', 'IN-2026-041', 'Premier Cement', 'AC-CORP', 'Corporate Accounts', 228, 1, 'AR-AD', 'IN-2026-041', 'Clinker advance set off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 400000.00, NULL, NULL),
('2026-03-28', 'Receipt', 'CUST-141', 'OR-2026-037', 'IN-2026-040', 'Crown Cement', 'AC-CORP', 'Corporate Accounts', 228, 2, 'AR-PY', 'IN-2026-040', 'Cheque payment Crown', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 610000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-29', 'Credit Note', 'CUST-142', 'CR-2026-010', 'IN-2026-041', 'Premier Cement', 'AC-CORP', 'Corporate Accounts', 130, 1, 'AR-CR', 'IN-2026-041', 'Moisture loss credit', NULL, NULL, NULL, NULL, 20000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-29', 'Invoice', 'CUST-143', 'IN-2026-042', ' ', 'Akij Ceramics', 'AC-COMM', 'Commercial Accounts', 130, 2, 'AR-IN', 'IN-2026-042', 'Sanitary ware fittings', NULL, NULL, 330000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-30', 'Receipt', 'CUST-142', 'OR-2026-038', 'IN-2026-041', 'Premier Cement', 'AC-CORP', 'Corporate Accounts', 229, 1, 'AR-PY', 'IN-2026-041', 'Final payment Premier', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 630000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-30', 'Adjustment', 'CUST-143', 'AD-2026-005', 'IN-2026-042', 'Akij Ceramics', 'AC-COMM', 'Commercial Accounts', 305, 1, 'AR-AD', 'IN-2026-042', 'Minor price correction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500.00),

-- End of March 2026 Batches (Row 117 - 150)
('2026-03-31', 'Invoice', 'CUST-144', 'IN-2026-043', ' ', 'Star Ceramics BD', 'AC-COMM', 'Commercial Accounts', 131, 1, 'AR-IN', 'IN-2026-043', 'Glazed tiles delivery', NULL, NULL, 270000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Receipt', 'CUST-143', 'OR-2026-039', 'IN-2026-042', 'Akij Ceramics', 'AC-COMM', 'Commercial Accounts', 229, 2, 'AR-PY', 'IN-2026-042', 'EFT clearing Akij', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 330500.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Invoice', 'CUST-145', 'IN-2026-044', ' ', 'KSRM Steel Plant', 'AC-CORP', 'Corporate Accounts', 131, 2, 'AR-IN', 'IN-2026-044', 'Scrap metal supply', NULL, NULL, 980000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Advance Receipt', 'CUST-146', 'AR-2026-010', 'AR-2026-010', 'GPH Ispat', 'AC-CORP', 'Corporate Accounts', 230, 1, 'AR-PI', 'AR-2026-010', 'Billet order advance', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, NULL, 350000.00, NULL, NULL, NULL, NULL),
('2026-03-31', 'Write-Off', 'CUST-147', 'WO-2026-005', 'N/A', 'M/S Rahman Hardware', 'AC-RTL', 'Retail Accounts', 305, 2, 'AR-WO', 'IN-2025-555', 'Bad debt write off Q1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18000.00, NULL),
('2026-03-31', 'Invoice', 'CUST-146', 'IN-2026-045', ' ', 'GPH Ispat', 'AC-CORP', 'Corporate Accounts', 132, 1, 'AR-IN', 'IN-2026-045', 'Steel billets batch #1', NULL, NULL, 1300000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Receipt', 'CUST-144', 'OR-2026-040', 'IN-2026-043', 'Star Ceramics BD', 'AC-COMM', 'Commercial Accounts', 230, 2, 'AR-PY', 'IN-2026-043', 'Full payment Star Ceramics', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 270000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Debit Note', 'CUST-145', 'DN-2026-008', 'IN-2026-044', 'KSRM Steel Plant', 'AC-CORP', 'Corporate Accounts', 132, 2, 'AR-DN', 'IN-2026-044', 'Weighbridge charge', NULL, NULL, NULL, 4000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Credit Note', 'CUST-146', 'CR-2026-011', 'IN-2026-045', 'GPH Ispat', 'AC-CORP', 'Corporate Accounts', 133, 1, 'AR-CR', 'IN-2026-045', 'Volume discount granted', NULL, NULL, NULL, NULL, 50000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Apply Document', 'CUST-146', 'AP-2026-007', 'IN-2026-045', 'GPH Ispat', 'AC-CORP', 'Corporate Accounts', 231, 1, 'AR-AD', 'IN-2026-045', 'Applied advance to billets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350000.00, NULL, NULL),

('2026-03-31', 'Invoice', 'CUST-148', 'IN-2026-046', ' ', 'Anwar Ispat', 'AC-CORP', 'Corporate Accounts', 133, 2, 'AR-IN', 'IN-2026-046', 'Iron rod supply', NULL, NULL, 760000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Receipt', 'CUST-145', 'OR-2026-041', 'IN-2026-044', 'KSRM Steel Plant', 'AC-CORP', 'Corporate Accounts', 231, 2, 'AR-PY', 'IN-2026-044', 'Part settlement KSRM', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Unapplied Cash', 'CUST-148', 'UC-2026-006', 'N/A', 'Anwar Ispat', 'AC-CORP', 'Corporate Accounts', 232, 1, 'AR-UC', 'UC-2026-006', 'Unmatched credit advice', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, NULL, 25000.00, NULL, NULL, NULL),
('2026-03-31', 'Receipt', 'CUST-146', 'OR-2026-042', 'IN-2026-045', 'GPH Ispat', 'AC-CORP', 'Corporate Accounts', 232, 2, 'AR-PY', 'IN-2026-045', 'Final wire transfer GPH', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 900000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Invoice', 'CUST-149', 'IN-2026-047', ' ', 'Confidence Power', 'AC-CORP', 'Corporate Accounts', 134, 1, 'AR-IN', 'IN-2026-047', 'Generator spares supply', NULL, NULL, 520000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Invoice', 'CUST-150', 'IN-2026-048', ' ', 'United Power Generation', 'AC-CORP', 'Corporate Accounts', 134, 2, 'AR-IN', 'IN-2026-048', 'Substation equipment', NULL, NULL, 1600000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Receipt', 'CUST-148', 'OR-2026-043', 'IN-2026-046', 'Anwar Ispat', 'AC-CORP', 'Corporate Accounts', 233, 1, 'AR-PY', 'IN-2026-046', 'Partial payment Anwar', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 400000.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Advance Receipt', 'CUST-150', 'AR-2026-011', 'AR-2026-011', 'United Power Generation', 'AC-CORP', 'Corporate Accounts', 233, 2, 'AR-PI', 'AR-2026-011', 'Advance for maintenance', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL),
('2026-03-31', 'Adjustment', 'CUST-149', 'AD-2026-006', 'IN-2026-047', 'Confidence Power', 'AC-CORP', 'Corporate Accounts', 306, 1, 'AR-AD', 'IN-2026-047', 'Rounding off adjustment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120.00),
('2026-03-31', 'Receipt', 'CUST-149', 'OR-2026-044', 'IN-2026-047', 'Confidence Power', 'AC-CORP', 'Corporate Accounts', 234, 1, 'AR-PY', 'IN-2026-047', 'Full payment Confidence', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 520120.00, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Debit Note', 'CUST-150', 'DN-2026-009', 'IN-2026-048', 'United Power Generation', 'AC-CORP', 'Corporate Accounts', 135, 1, 'AR-DN', 'IN-2026-048', 'Installation supervision fee', NULL, NULL, NULL, 50000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Credit Note', 'CUST-150', 'CR-2026-012', 'IN-2026-048', 'United Power Generation', 'AC-CORP', 'Corporate Accounts', 135, 2, 'AR-CR', 'IN-2026-048', 'Testing delay compensation', NULL, NULL, NULL, NULL, 30000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2026-03-31', 'Apply Document', 'CUST-150', 'AP-2026-008', 'IN-2026-048', 'United Power Generation', 'AC-CORP', 'Corporate Accounts', 234, 2, 'AR-AD', 'IN-2026-048', 'Applied maintenance advance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500000.00, NULL, NULL),
('2026-03-31', 'Receipt', 'CUST-150', 'OR-2026-045', 'IN-2026-048', 'United Power Generation', 'AC-CORP', 'Corporate Accounts', 235, 1, 'AR-PY', 'IN-2026-048', 'Cheque clearing United Power', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 1120000.00, NULL, NULL, NULL, NULL, NULL);
GO

-- পরিবর্তনসমূহ ভিউতে (View) সঠিকভাবে প্রতিফলিত হয়েছে কিনা তা পরীক্ষা করুন:
SELECT * FROM vw_AR_TRANSACTION
ORDER BY [Customer ID], TransactionDate, [Batch Number], [Entry No];
GO




USE Demo_Database;
GO

-- ২০২৫ সালের ১০০টি অতিরিক্ত ডেমো ডেটা ইনসার্ট (Row 151 - 250)
INSERT INTO dbo.AR_TRANSACTION_DEMO 
(TransactionDate, TransactionType, IDCUST, [DOC NUMBER], AppliedDocument, NAMECUST, IDACCTSET, TEXTDESC, CNTBTCH, CNTITEM, SourceCode, DocNumber, Description, BankCode, [Bank Name], Invoice, [Debit Note], [Credit Note], Receipt, [Advance Receipt], [Unapplied Cash], [Apply Document], [Write-Off], Adjustment)
VALUES
-- 2025 Quarter 1 (Jan - Mar 2025)
('2025-01-05', 'Invoice', 'CUST-201', 'IN-2025-001', ' ', 'Aarong Social Enterprise', 'AC-RTL', 'Retail Accounts', 1, 1, 'AR-IN', 'IN-2025-001', 'Handicrafts bulk order', NULL, NULL, 120000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-10', 'Receipt', 'CUST-201', 'OR-2025-001', 'IN-2025-001', 'Aarong Social Enterprise', 'AC-RTL', 'Retail Accounts', 2, 1, 'AR-PY', 'IN-2025-001', 'Clearing IN-2025-001', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 120000.00, NULL, NULL, NULL, NULL, NULL),
('2025-01-15', 'Invoice', 'CUST-202', 'IN-2025-002', ' ', 'Pran Dairy Ltd.', 'AC-COMM', 'Commercial Accounts', 1, 2, 'AR-IN', 'IN-2025-002', 'Packaging material supply', NULL, NULL, 350000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-20', 'Credit Note', 'CUST-202', 'CR-2025-001', 'IN-2025-002', 'Pran Dairy Ltd.', 'AC-COMM', 'Commercial Accounts', 3, 1, 'AR-CR', 'IN-2025-002', 'Damaged goods return', NULL, NULL, NULL, NULL, 15000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-25', 'Receipt', 'CUST-202', 'OR-2025-002', 'IN-2025-002', 'Pran Dairy Ltd.', 'AC-COMM', 'Commercial Accounts', 2, 2, 'AR-PY', 'IN-2025-002', 'Full settlement post CR', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 335000.00, NULL, NULL, NULL, NULL, NULL),
('2025-02-01', 'Advance Receipt', 'CUST-203', 'AR-2025-001', 'AR-2025-001', 'Brac Bank PLC', 'AC-CORP', 'Corporate Accounts', 4, 1, 'AR-PI', 'AR-2025-001', 'Software license advance', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 200000.00, NULL, NULL, NULL, NULL),
('2025-02-05', 'Invoice', 'CUST-203', 'IN-2025-003', ' ', 'Brac Bank PLC', 'AC-CORP', 'Corporate Accounts', 5, 1, 'AR-IN', 'IN-2025-003', 'Annual IT maintenance', NULL, NULL, 600000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-10', 'Apply Document', 'CUST-203', 'AP-2025-001', 'IN-2025-003', 'Brac Bank PLC', 'AC-CORP', 'Corporate Accounts', 6, 1, 'AR-AD', 'IN-2025-003', 'Advance set off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200000.00, NULL, NULL),
('2025-02-15', 'Receipt', 'CUST-203', 'OR-2025-003', 'IN-2025-003', 'Brac Bank PLC', 'AC-CORP', 'Corporate Accounts', 6, 2, 'AR-PY', 'IN-2025-003', 'Remaining payment', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 400000.00, NULL, NULL, NULL, NULL, NULL),
('2025-02-20', 'Invoice', 'CUST-204', 'IN-2025-004', ' ', 'City Group', 'AC-CORP', 'Corporate Accounts', 5, 2, 'AR-IN', 'IN-2025-004', 'Raw oil shipment', NULL, NULL, 850000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-25', 'Debit Note', 'CUST-204', 'DN-2025-001', 'IN-2025-004', 'City Group', 'AC-CORP', 'Corporate Accounts', 7, 1, 'AR-DN', 'IN-2025-004', 'Late shipping fee', NULL, NULL, NULL, 10000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-03-01', 'Receipt', 'CUST-204', 'OR-2025-004', 'IN-2025-004', 'City Group', 'AC-CORP', 'Corporate Accounts', 8, 1, 'AR-PY', 'IN-2025-004', 'Part payment City Group', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL, NULL),
('2025-03-05', 'Invoice', 'CUST-205', 'IN-2025-005', ' ', 'Kazi Farms Group', 'AC-COMM', 'Commercial Accounts', 9, 1, 'AR-IN', 'IN-2025-005', 'Poultry feed supply', NULL, NULL, 280000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-03-10', 'Unapplied Cash', 'CUST-205', 'UC-2025-001', 'N/A', 'Kazi Farms Group', 'AC-COMM', 'Commercial Accounts', 8, 2, 'AR-UC', 'UC-2025-001', 'Excess payment received', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, NULL, NULL, 20000.00, NULL, NULL, NULL),
('2025-03-15', 'Receipt', 'CUST-205', 'OR-2025-005', 'IN-2025-005', 'Kazi Farms Group', 'AC-COMM', 'Commercial Accounts', 10, 1, 'AR-PY', 'IN-2025-005', 'Full payment Kazi Farms', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 280000.00, NULL, NULL, NULL, NULL, NULL),
('2025-03-20', 'Invoice', 'CUST-206', 'IN-2025-006', ' ', 'Incepta Hygiene', 'AC-COMM', 'Commercial Accounts', 9, 2, 'AR-IN', 'IN-2025-006', 'Sanitizer batch delivery', NULL, NULL, 190000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-03-25', 'Write-Off', 'CUST-207', 'WO-2025-001', 'N/A', 'Local Store Chittagong', 'AC-RTL', 'Retail Accounts', 11, 1, 'AR-WO', 'IN-2024-901', 'Insolvent debt write-off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8000.00, NULL),
('2025-03-28', 'Adjustment', 'CUST-206', 'AD-2025-001', 'IN-2025-006', 'Incepta Hygiene', 'AC-COMM', 'Commercial Accounts', 11, 2, 'AR-AD', 'IN-2025-006', 'Tax rounding correction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 300.00),
('2025-03-30', 'Receipt', 'CUST-206', 'OR-2025-006', 'IN-2025-006', 'Incepta Hygiene', 'AC-COMM', 'Commercial Accounts', 10, 2, 'AR-PY', 'IN-2025-006', 'Full payment post AD', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 190300.00, NULL, NULL, NULL, NULL, NULL),
('2025-03-31', 'Invoice', 'CUST-208', 'IN-2025-007', ' ', 'Labaid Diagnostics', 'AC-CORP', 'Corporate Accounts', 12, 1, 'AR-IN', 'IN-2025-007', 'Lab chemicals shipment', NULL, NULL, 410000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),

-- 2025 Quarter 2 (Apr - Jun 2025)
('2025-04-02', 'Receipt', 'CUST-208', 'OR-2025-007', 'IN-2025-007', 'Labaid Diagnostics', 'AC-CORP', 'Corporate Accounts', 13, 1, 'AR-PY', 'IN-2025-007', 'Cheque deposit Labaid', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 410000.00, NULL, NULL, NULL, NULL, NULL),
('2025-04-06', 'Invoice', 'CUST-209', 'IN-2025-008', ' ', 'Popular Pharma', 'AC-CORP', 'Corporate Accounts', 12, 2, 'AR-IN', 'IN-2025-008', 'Medical box packaging', NULL, NULL, 310000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-10', 'Credit Note', 'CUST-209', 'CR-2025-002', 'IN-2025-008', 'Popular Pharma', 'AC-CORP', 'Corporate Accounts', 14, 1, 'AR-CR', 'IN-2025-008', 'Shortage discount credit', NULL, NULL, NULL, NULL, 10000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-15', 'Receipt', 'CUST-209', 'OR-2025-008', 'IN-2025-008', 'Popular Pharma', 'AC-CORP', 'Corporate Accounts', 13, 2, 'AR-PY', 'IN-2025-008', 'EFT clearing Popular', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 300000.00, NULL, NULL, NULL, NULL, NULL),
('2025-04-20', 'Invoice', 'CUST-210', 'IN-2025-009', ' ', 'Epyllion Group', 'AC-CORP', 'Corporate Accounts', 15, 1, 'AR-IN', 'IN-2025-009', 'Garment accessories', NULL, NULL, 530000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-25', 'Advance Receipt', 'CUST-211', 'AR-2025-002', 'AR-2025-002', 'Palmal Group', 'AC-CORP', 'Corporate Accounts', 16, 1, 'AR-PI', 'AR-2025-002', 'Yarn booking advance', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, NULL, 150000.00, NULL, NULL, NULL, NULL),
('2025-05-02', 'Invoice', 'CUST-211', 'IN-2025-010', ' ', 'Palmal Group', 'AC-CORP', 'Corporate Accounts', 15, 2, 'AR-IN', 'IN-2025-010', 'Cotton yarn export batch', NULL, NULL, 780000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-06', 'Apply Document', 'CUST-211', 'AP-2025-002', 'IN-2025-010', 'Palmal Group', 'AC-CORP', 'Corporate Accounts', 16, 2, 'AR-AD', 'IN-2025-010', 'Advance set off IN-010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150000.00, NULL, NULL),
('2025-05-10', 'Receipt', 'CUST-210', 'OR-2025-009', 'IN-2025-009', 'Epyllion Group', 'AC-CORP', 'Corporate Accounts', 17, 1, 'AR-PY', 'IN-2025-009', 'Part payment Epyllion', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 300000.00, NULL, NULL, NULL, NULL, NULL),
('2025-05-15', 'Receipt', 'CUST-211', 'OR-2025-010', 'IN-2025-010', 'Palmal Group', 'AC-CORP', 'Corporate Accounts', 17, 2, 'AR-PY', 'IN-2025-010', 'Full balance Palmal', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 630000.00, NULL, NULL, NULL, NULL, NULL),
('2025-05-20', 'Invoice', 'CUST-212', 'IN-2025-011', ' ', 'Standard Group', 'AC-CORP', 'Corporate Accounts', 18, 1, 'AR-IN', 'IN-2025-011', 'Woven fabric shipment', NULL, NULL, 640000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-25', 'Debit Note', 'CUST-212', 'DN-2025-002', 'IN-2025-011', 'Standard Group', 'AC-CORP', 'Corporate Accounts', 19, 1, 'AR-DN', 'IN-2025-011', 'Freight charge addition', NULL, NULL, NULL, 8000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01', 'Receipt', 'CUST-212', 'OR-2025-011', 'IN-2025-011', 'Standard Group', 'AC-CORP', 'Corporate Accounts', 20, 1, 'AR-PY', 'IN-2025-011', 'Clearing IN-011 with DN', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 648000.00, NULL, NULL, NULL, NULL, NULL),
('2025-06-05', 'Invoice', 'CUST-213', 'IN-2025-012', ' ', 'Viyellatex Ltd.', 'AC-CORP', 'Corporate Accounts', 18, 2, 'AR-IN', 'IN-2025-012', 'Dyeing chemical supply', NULL, NULL, 420000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-10', 'Unapplied Cash', 'CUST-213', 'UC-2025-002', 'N/A', 'Viyellatex Ltd.', 'AC-CORP', 'Corporate Accounts', 20, 2, 'AR-UC', 'UC-2025-002', 'Overpayment credit', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, NULL, NULL, 15000.00, NULL, NULL, NULL),
('2025-06-15', 'Receipt', 'CUST-213', 'OR-2025-012', 'IN-2025-012', 'Viyellatex Ltd.', 'AC-CORP', 'Corporate Accounts', 21, 1, 'AR-PY', 'IN-2025-012', 'Settlement payment', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 420000.00, NULL, NULL, NULL, NULL, NULL),
('2025-06-20', 'Invoice', 'CUST-214', 'IN-2025-013', ' ', 'Mondol Group', 'AC-CORP', 'Corporate Accounts', 22, 1, 'AR-IN', 'IN-2025-013', 'Knitwear accessories', NULL, NULL, 290000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-25', 'Credit Note', 'CUST-214', 'CR-2025-003', 'IN-2025-013', 'Mondol Group', 'AC-CORP', 'Corporate Accounts', 19, 2, 'AR-CR', 'IN-2025-013', 'Quality claim credit', NULL, NULL, NULL, NULL, 12000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-28', 'Receipt', 'CUST-214', 'OR-2025-013', 'IN-2025-013', 'Mondol Group', 'AC-CORP', 'Corporate Accounts', 21, 2, 'AR-PY', 'IN-2025-013', 'Net payment post CR', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 278000.00, NULL, NULL, NULL, NULL, NULL),
('2025-06-30', 'Write-Off', 'CUST-215', 'WO-2025-002', 'N/A', 'Sylhet Traders', 'AC-RTL', 'Retail Accounts', 23, 1, 'AR-WO', 'IN-2024-805', 'Doubtful debt waiver', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5000.00, NULL),

-- 2025 Quarter 3 (Jul - Sep 2025)
('2025-07-02', 'Invoice', 'CUST-216', 'IN-2025-014', ' ', 'Aftab Feed Products', 'AC-COMM', 'Commercial Accounts', 22, 2, 'AR-IN', 'IN-2025-014', 'Fish feed raw material', NULL, NULL, 480000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-05', 'Advance Receipt', 'CUST-217', 'AR-2025-003', 'AR-2025-003', 'Partex Star Group', 'AC-COMM', 'Commercial Accounts', 24, 1, 'AR-PI', 'AR-2025-003', 'Particle board advance', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 100000.00, NULL, NULL, NULL, NULL),
('2025-07-10', 'Receipt', 'CUST-216', 'OR-2025-014', 'IN-2025-014', 'Aftab Feed Products', 'AC-COMM', 'Commercial Accounts', 25, 1, 'AR-PY', 'IN-2025-014', 'Full invoice payment', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 480000.00, NULL, NULL, NULL, NULL, NULL),
('2025-07-15', 'Invoice', 'CUST-217', 'IN-2025-015', ' ', 'Partex Star Group', 'AC-COMM', 'Commercial Accounts', 26, 1, 'AR-IN', 'IN-2025-015', 'Wood veneer panels', NULL, NULL, 360000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-20', 'Apply Document', 'CUST-217', 'AP-2025-003', 'IN-2025-015', 'Partex Star Group', 'AC-COMM', 'Commercial Accounts', 24, 2, 'AR-AD', 'IN-2025-015', 'Apply advance to IN-015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100000.00, NULL, NULL),
('2025-07-25', 'Receipt', 'CUST-217', 'OR-2025-015', 'IN-2025-015', 'Partex Star Group', 'AC-COMM', 'Commercial Accounts', 25, 2, 'AR-PY', 'IN-2025-015', 'Clear remaining balance', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 260000.00, NULL, NULL, NULL, NULL, NULL),
('2025-08-01', 'Invoice', 'CUST-218', 'IN-2025-016', ' ', 'KSRM Steel', 'AC-CORP', 'Corporate Accounts', 26, 2, 'AR-IN', 'IN-2025-016', 'Rebar steel supply', NULL, NULL, 1100000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-05', 'Debit Note', 'CUST-218', 'DN-2025-003', 'IN-2025-016', 'KSRM Steel', 'AC-CORP', 'Corporate Accounts', 27, 1, 'AR-DN', 'IN-2025-016', 'Overweight transport charge', NULL, NULL, NULL, 15000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-10', 'Receipt', 'CUST-218', 'OR-2025-016', 'IN-2025-016', 'KSRM Steel', 'AC-CORP', 'Corporate Accounts', 28, 1, 'AR-PY', 'IN-2025-016', 'Partial wire transfer', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 600000.00, NULL, NULL, NULL, NULL, NULL),
('2025-08-15', 'Invoice', 'CUST-219', 'IN-2025-017', ' ', 'Abul Khair Steel', 'AC-CORP', 'Corporate Accounts', 29, 1, 'AR-IN', 'IN-2025-017', 'Corrugated sheet batch', NULL, NULL, 950000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-20', 'Credit Note', 'CUST-219', 'CR-2025-004', 'IN-2025-017', 'Abul Khair Steel', 'AC-CORP', 'Corporate Accounts', 27, 2, 'AR-CR', 'IN-2025-017', 'Rebate on bulk purchase', NULL, NULL, NULL, NULL, 35000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-25', 'Receipt', 'CUST-219', 'OR-2025-017', 'IN-2025-017', 'Abul Khair Steel', 'AC-CORP', 'Corporate Accounts', 28, 2, 'AR-PY', 'IN-2025-017', 'Full payment post rebate', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 915000.00, NULL, NULL, NULL, NULL, NULL),
('2025-09-02', 'Invoice', 'CUST-220', 'IN-2025-018', ' ', 'BSRM Steels Ltd', 'AC-CORP', 'Corporate Accounts', 29, 2, 'AR-IN', 'IN-2025-018', 'Iron ore raw material', NULL, NULL, 1400000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-05', 'Advance Receipt', 'CUST-220', 'AR-2025-004', 'AR-2025-004', 'BSRM Steels Ltd', 'AC-CORP', 'Corporate Accounts', 30, 1, 'AR-PI', 'AR-2025-004', 'Advance deposit BSRM', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 400000.00, NULL, NULL, NULL, NULL),
('2025-09-10', 'Apply Document', 'CUST-220', 'AP-2025-004', 'IN-2025-018', 'BSRM Steels Ltd', 'AC-CORP', 'Corporate Accounts', 30, 2, 'AR-AD', 'IN-2025-018', 'Apply advance to IN-018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 400000.00, NULL, NULL),
('2025-09-15', 'Receipt', 'CUST-220', 'OR-2025-018', 'IN-2025-018', 'BSRM Steels Ltd', 'AC-CORP', 'Corporate Accounts', 31, 1, 'AR-PY', 'IN-2025-018', 'Final clearing BSRM', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 1000000.00, NULL, NULL, NULL, NULL, NULL),
('2025-09-20', 'Invoice', 'CUST-221', 'IN-2025-019', ' ', 'GPH Ispat Ltd.', 'AC-CORP', 'Corporate Accounts', 32, 1, 'AR-IN', 'IN-2025-019', 'Scrap iron shipment', NULL, NULL, 680000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-25', 'Unapplied Cash', 'CUST-221', 'UC-2025-003', 'N/A', 'GPH Ispat Ltd.', 'AC-CORP', 'Corporate Accounts', 31, 2, 'AR-UC', 'UC-2025-003', 'Unclaimed bank transfer', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, NULL, NULL, 25000.00, NULL, NULL, NULL),
('2025-09-28', 'Adjustment', 'CUST-221', 'AD-2025-002', 'IN-2025-019', 'GPH Ispat Ltd.', 'AC-CORP', 'Corporate Accounts', 33, 1, 'AR-AD', 'IN-2025-019', 'Discount adjustment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000.00),
('2025-09-30', 'Receipt', 'CUST-221', 'OR-2025-019', 'IN-2025-019', 'GPH Ispat Ltd.', 'AC-CORP', 'Corporate Accounts', 34, 1, 'AR-PY', 'IN-2025-019', 'Settlement payment GPH', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 681000.00, NULL, NULL, NULL, NULL, NULL),

-- 2025 Quarter 4 (Oct - Dec 2025)
('2025-10-02', 'Invoice', 'CUST-222', 'IN-2025-020', ' ', 'Confidence Cement', 'AC-CORP', 'Corporate Accounts', 32, 2, 'AR-IN', 'IN-2025-020', 'Clinker import supply', NULL, NULL, 820000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-06', 'Receipt', 'CUST-222', 'OR-2025-020', 'IN-2025-020', 'Confidence Cement', 'AC-CORP', 'Corporate Accounts', 34, 2, 'AR-PY', 'IN-2025-020', 'Cheque clearing Confidence', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 820000.00, NULL, NULL, NULL, NULL, NULL),
('2025-10-10', 'Invoice', 'CUST-223', 'IN-2025-021', ' ', 'Heidelberg Cement', 'AC-CORP', 'Corporate Accounts', 35, 1, 'AR-IN', 'IN-2025-021', 'Gypsum raw materials', NULL, NULL, 590000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-15', 'Credit Note', 'CUST-223', 'CR-2025-005', 'IN-2025-021', 'Heidelberg Cement', 'AC-CORP', 'Corporate Accounts', 33, 2, 'AR-CR', 'IN-2025-021', 'Moisture rebate credit', NULL, NULL, NULL, NULL, 18000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-20', 'Receipt', 'CUST-223', 'OR-2025-021', 'IN-2025-021', 'Heidelberg Cement', 'AC-CORP', 'Corporate Accounts', 36, 1, 'AR-PY', 'IN-2025-021', 'Full payment post rebate', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 572000.00, NULL, NULL, NULL, NULL, NULL),
('2025-10-25', 'Advance Receipt', 'CUST-224', 'AR-2025-005', 'AR-2025-005', 'RFL Plastics Ltd.', 'AC-COMM', 'Commercial Accounts', 37, 1, 'AR-PI', 'AR-2025-005', 'Mould advance deposit', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 220000.00, NULL, NULL, NULL, NULL),
('2025-11-01', 'Invoice', 'CUST-224', 'IN-2025-022', ' ', 'RFL Plastics Ltd.', 'AC-COMM', 'Commercial Accounts', 35, 2, 'AR-IN', 'IN-2025-022', 'Plastic resin batch', NULL, NULL, 650000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-11-05', 'Apply Document', 'CUST-224', 'AP-2025-005', 'IN-2025-022', 'RFL Plastics Ltd.', 'AC-COMM', 'Commercial Accounts', 37, 2, 'AR-AD', 'IN-2025-022', 'Apply advance to IN-022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 220000.00, NULL, NULL),
('2025-11-10', 'Receipt', 'CUST-224', 'OR-2025-022', 'IN-2025-022', 'RFL Plastics Ltd.', 'AC-COMM', 'Commercial Accounts', 36, 2, 'AR-PY', 'IN-2025-022', 'Clear balance IN-022', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 430000.00, NULL, NULL, NULL, NULL, NULL),
('2025-11-15', 'Invoice', 'CUST-225', 'IN-2025-023', ' ', 'Bengal Polymer', 'AC-COMM', 'Commercial Accounts', 38, 1, 'AR-IN', 'IN-2025-023', 'PVC pipe raw material', NULL, NULL, 370000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-11-20', 'Debit Note', 'CUST-225', 'DN-2025-004', 'IN-2025-023', 'Bengal Polymer', 'AC-COMM', 'Commercial Accounts', 39, 1, 'AR-DN', 'IN-2025-023', 'Packaging surcharge', NULL, NULL, NULL, 5000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-11-25', 'Receipt', 'CUST-225', 'OR-2025-023', 'IN-2025-023', 'Bengal Polymer', 'AC-COMM', 'Commercial Accounts', 40, 1, 'AR-PY', 'IN-2025-023', 'Full payment Bengal', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 375000.00, NULL, NULL, NULL, NULL, NULL),
('2025-12-01', 'Invoice', 'CUST-226', 'IN-2025-024', ' ', 'Apex Tannery Ltd.', 'AC-CORP', 'Corporate Accounts', 38, 2, 'AR-IN', 'IN-2025-024', 'Leather processing chemicals', NULL, NULL, 490000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-05', 'Receipt', 'CUST-226', 'OR-2025-024', 'IN-2025-024', 'Apex Tannery Ltd.', 'AC-CORP', 'Corporate Accounts', 40, 2, 'AR-PY', 'IN-2025-024', 'EFT clearing Apex', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 490000.00, NULL, NULL, NULL, NULL, NULL),
('2025-12-10', 'Invoice', 'CUST-227', 'IN-2025-025', ' ', 'Bata Shoe Co. BD', 'AC-CORP', 'Corporate Accounts', 41, 1, 'AR-IN', 'IN-2025-025', 'Rubber sole material', NULL, NULL, 730000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-12', 'Credit Note', 'CUST-227', 'CR-2025-006', 'IN-2025-025', 'Bata Shoe Co. BD', 'AC-CORP', 'Corporate Accounts', 39, 2, 'AR-CR', 'IN-2025-025', 'Year-end rebate credit', NULL, NULL, NULL, NULL, 25000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-15', 'Receipt', 'CUST-227', 'OR-2025-025', 'IN-2025-025', 'Bata Shoe Co. BD', 'AC-CORP', 'Corporate Accounts', 42, 1, 'AR-PY', 'IN-2025-025', 'Full settlement Bata', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 705000.00, NULL, NULL, NULL, NULL, NULL),
('2025-12-18', 'Advance Receipt', 'CUST-228', 'AR-2025-006', 'AR-2025-006', 'Orion Pharma', 'AC-CORP', 'Corporate Accounts', 43, 1, 'AR-PI', 'AR-2025-006', 'Advance for 2026 Q1 batch', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 300000.00, NULL, NULL, NULL, NULL),
('2025-12-20', 'Invoice', 'CUST-228', 'IN-2025-026', ' ', 'Orion Pharma', 'AC-CORP', 'Corporate Accounts', 41, 2, 'AR-IN', 'IN-2025-026', 'Pharma raw ingredients', NULL, NULL, 880000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-22', 'Apply Document', 'CUST-228', 'AP-2025-006', 'IN-2025-026', 'Orion Pharma', 'AC-CORP', 'Corporate Accounts', 43, 2, 'AR-AD', 'IN-2025-026', 'Apply advance to IN-026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 300000.00, NULL, NULL),
('2025-12-24', 'Receipt', 'CUST-228', 'OR-2025-026', 'IN-2025-026', 'Orion Pharma', 'AC-CORP', 'Corporate Accounts', 42, 2, 'AR-PY', 'IN-2025-026', 'Part payment Orion', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 400000.00, NULL, NULL, NULL, NULL, NULL),
('2025-12-26', 'Write-Off', 'CUST-229', 'WO-2025-003', 'N/A', 'Old Town Enterprise', 'AC-RTL', 'Retail Accounts', 44, 1, 'AR-WO', 'IN-2024-500', 'Year-end bad debt write-off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14000.00, NULL),
('2025-12-28', 'Adjustment', 'CUST-228', 'AD-2025-003', 'IN-2025-026', 'Orion Pharma', 'AC-CORP', 'Corporate Accounts', 44, 2, 'AR-AD', 'IN-2025-026', 'TDS settlement correction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5000.00),
('2025-12-29', 'Receipt', 'CUST-228', 'OR-2025-027', 'IN-2025-026', 'Orion Pharma', 'AC-CORP', 'Corporate Accounts', 45, 1, 'AR-PY', 'IN-2025-026', 'Final clearing Orion', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 185000.00, NULL, NULL, NULL, NULL, NULL),
('2025-12-30', 'Invoice', 'CUST-230', 'IN-2025-027', ' ', 'Square Textiles', 'AC-CORP', 'Corporate Accounts', 46, 1, 'AR-IN', 'IN-2025-027', 'Yarn supply year-end batch', NULL, NULL, 920000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-30', 'Unapplied Cash', 'CUST-230', 'UC-2025-004', 'N/A', 'Square Textiles', 'AC-CORP', 'Corporate Accounts', 45, 2, 'AR-UC', 'UC-2025-004', 'Advance excess payment', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, NULL, NULL, 50000.00, NULL, NULL, NULL),
('2025-12-31', 'Receipt', 'CUST-230', 'OR-2025-028', 'IN-2025-027', 'Square Textiles', 'AC-CORP', 'Corporate Accounts', 46, 2, 'AR-PY', 'IN-2025-027', 'Year-end closing payment', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 870000.00, NULL, NULL, NULL, NULL, NULL),
('2025-12-31', 'Debit Note', 'CUST-230', 'DN-2025-005', 'IN-2025-027', 'Square Textiles', 'AC-CORP', 'Corporate Accounts', 47, 1, 'AR-DN', 'IN-2025-027', 'Annual audit charge', NULL, NULL, NULL, 12000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-31', 'Credit Note', 'CUST-230', 'CR-2025-007', 'IN-2025-027', 'Square Textiles', 'AC-CORP', 'Corporate Accounts', 47, 2, 'AR-CR', 'IN-2025-027', 'Yearly volume discount', NULL, NULL, NULL, NULL, 12000.00, NULL, NULL, NULL, NULL, NULL, NULL);
GO

-- ভিউতে (View) নতুন ২০২৫ সালের ডাটা চেক করার জন্য কোয়েরি:
SELECT * FROM vw_AR_TRANSACTION
WHERE TransactionDate BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY [Customer ID], TransactionDate, [Batch Number], [Entry No];
GO


USE Demo_Database;
GO

-- ২০২৪ সালের ১০০টি অতিরিক্ত ডেমো ডেটা ইনসার্ট (Row 251 - 350)
INSERT INTO dbo.AR_TRANSACTION_DEMO 
(TransactionDate, TransactionType, IDCUST, [DOC NUMBER], AppliedDocument, NAMECUST, IDACCTSET, TEXTDESC, CNTBTCH, CNTITEM, SourceCode, DocNumber, Description, BankCode, [Bank Name], Invoice, [Debit Note], [Credit Note], Receipt, [Advance Receipt], [Unapplied Cash], [Apply Document], [Write-Off], Adjustment)
VALUES
-- 2024 Quarter 1 (Jan - Mar 2024)
('2024-01-04', 'Invoice', 'CUST-301', 'IN-2024-001', ' ', 'Beximco Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 51, 1, 'AR-IN', 'IN-2024-001', 'Active ingredient shipment', NULL, NULL, 450000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-01-08', 'Receipt', 'CUST-301', 'OR-2024-001', 'IN-2024-001', 'Beximco Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 52, 1, 'AR-PY', 'IN-2024-001', 'Full payment Beximco', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 450000.00, NULL, NULL, NULL, NULL, NULL),
('2024-01-12', 'Invoice', 'CUST-302', 'IN-2024-002', ' ', 'Square Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 51, 2, 'AR-IN', 'IN-2024-002', 'Packaging foil rolls', NULL, NULL, 620000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-01-16', 'Credit Note', 'CUST-302', 'CR-2024-001', 'IN-2024-002', 'Square Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 53, 1, 'AR-CR', 'IN-2024-002', 'Damaged foil credit', NULL, NULL, NULL, NULL, 20000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-01-20', 'Receipt', 'CUST-302', 'OR-2024-002', 'IN-2024-002', 'Square Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 52, 2, 'AR-PY', 'IN-2024-002', 'Clearing IN-2024-002 post CR', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 600000.00, NULL, NULL, NULL, NULL, NULL),
('2024-01-25', 'Advance Receipt', 'CUST-303', 'AR-2024-001', 'AR-2024-001', 'Renata Limited', 'AC-CORP', 'Corporate Accounts', 54, 1, 'AR-PI', 'AR-2024-001', 'Raw material advance', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 150000.00, NULL, NULL, NULL, NULL),
('2024-02-02', 'Invoice', 'CUST-303', 'IN-2024-003', ' ', 'Renata Limited', 'AC-CORP', 'Corporate Accounts', 55, 1, 'AR-IN', 'IN-2024-003', 'Pharma chemical batch', NULL, NULL, 500000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-02-06', 'Apply Document', 'CUST-303', 'AP-2024-001', 'IN-2024-003', 'Renata Limited', 'AC-CORP', 'Corporate Accounts', 56, 1, 'AR-AD', 'IN-2024-003', 'Set off advance to IN-003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150000.00, NULL, NULL),
('2024-02-10', 'Receipt', 'CUST-303', 'OR-2024-003', 'IN-2024-003', 'Renata Limited', 'AC-CORP', 'Corporate Accounts', 56, 2, 'AR-PY', 'IN-2024-003', 'Final clearing Renata', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 350000.00, NULL, NULL, NULL, NULL, NULL),
('2024-02-15', 'Invoice', 'CUST-304', 'IN-2024-004', ' ', 'ACI Limited', 'AC-CORP', 'Corporate Accounts', 55, 2, 'AR-IN', 'IN-2024-004', 'Agro chemical delivery', NULL, NULL, 380000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-02-18', 'Debit Note', 'CUST-304', 'DN-2024-001', 'IN-2024-004', 'ACI Limited', 'AC-CORP', 'Corporate Accounts', 57, 1, 'AR-DN', 'IN-2024-004', 'Urgent transport surcharge', NULL, NULL, NULL, 7000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-02-22', 'Receipt', 'CUST-304', 'OR-2024-004', 'IN-2024-004', 'ACI Limited', 'AC-CORP', 'Corporate Accounts', 58, 1, 'AR-PY', 'IN-2024-004', 'Full settlement ACI', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 387000.00, NULL, NULL, NULL, NULL, NULL),
('2024-03-01', 'Invoice', 'CUST-305', 'IN-2024-005', ' ', 'Walton Hi-Tech', 'AC-CORP', 'Corporate Accounts', 59, 1, 'AR-IN', 'IN-2024-005', 'Compressor components', NULL, NULL, 950000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-03-05', 'Unapplied Cash', 'CUST-305', 'UC-2024-001', 'N/A', 'Walton Hi-Tech', 'AC-CORP', 'Corporate Accounts', 58, 2, 'AR-UC', 'UC-2024-001', 'Unidentified wire transfer', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, NULL, NULL, 30000.00, NULL, NULL, NULL),
('2024-03-10', 'Receipt', 'CUST-305', 'OR-2024-005', 'IN-2024-005', 'Walton Hi-Tech', 'AC-CORP', 'Corporate Accounts', 60, 1, 'AR-PY', 'IN-2024-005', 'Part payment Walton', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL, NULL),
('2024-03-15', 'Invoice', 'CUST-306', 'IN-2024-006', ' ', 'Singer Bangladesh', 'AC-COMM', 'Commercial Accounts', 59, 2, 'AR-IN', 'IN-2024-006', 'Appliance spare parts', NULL, NULL, 270000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-03-20', 'Write-Off', 'CUST-307', 'WO-2024-001', 'N/A', 'Chittagong Electronics', 'AC-RTL', 'Retail Accounts', 61, 1, 'AR-WO', 'IN-2023-909', 'Old uncollectible balance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6500.00, NULL),
('2024-03-25', 'Adjustment', 'CUST-306', 'AD-2024-001', 'IN-2024-006', 'Singer Bangladesh', 'AC-COMM', 'Commercial Accounts', 61, 2, 'AR-AD', 'IN-2024-006', 'Rounding difference', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250.00),
('2024-03-28', 'Receipt', 'CUST-306', 'OR-2024-006', 'IN-2024-006', 'Singer Bangladesh', 'AC-COMM', 'Commercial Accounts', 60, 2, 'AR-PY', 'IN-2024-006', 'Clearing IN-2024-006', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 270250.00, NULL, NULL, NULL, NULL, NULL),
('2024-03-31', 'Invoice', 'CUST-308', 'IN-2024-007', ' ', 'Transcom Electronics', 'AC-COMM', 'Commercial Accounts', 62, 1, 'AR-IN', 'IN-2024-007', 'Display panel batch', NULL, NULL, 340000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),

-- 2024 Quarter 2 (Apr - Jun 2024)
('2024-04-03', 'Receipt', 'CUST-308', 'OR-2024-007', 'IN-2024-007', 'Transcom Electronics', 'AC-COMM', 'Commercial Accounts', 63, 1, 'AR-PY', 'IN-2024-007', 'EFT clearing Transcom', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 340000.00, NULL, NULL, NULL, NULL, NULL),
('2024-04-08', 'Invoice', 'CUST-309', 'IN-2024-008', ' ', 'Hamdard Laboratories', 'AC-COMM', 'Commercial Accounts', 62, 2, 'AR-IN', 'IN-2024-008', 'Herbal extract batch', NULL, NULL, 210000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-04-12', 'Credit Note', 'CUST-309', 'CR-2024-002', 'IN-2024-008', 'Hamdard Laboratories', 'AC-COMM', 'Commercial Accounts', 64, 1, 'AR-CR', 'IN-2024-008', 'Promotional allowance', NULL, NULL, NULL, NULL, 8000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-04-18', 'Receipt', 'CUST-309', 'OR-2024-008', 'IN-2024-008', 'Hamdard Laboratories', 'AC-COMM', 'Commercial Accounts', 63, 2, 'AR-PY', 'IN-2024-008', 'Net settlement Hamdard', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 202000.00, NULL, NULL, NULL, NULL, NULL),
('2024-04-22', 'Invoice', 'CUST-310', 'IN-2024-009', ' ', 'Akij Motors', 'AC-CORP', 'Corporate Accounts', 65, 1, 'AR-IN', 'IN-2024-009', 'Automotive lubricants', NULL, NULL, 580000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-04-26', 'Advance Receipt', 'CUST-311', 'AR-2024-002', 'AR-2024-002', 'Nitol Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 66, 1, 'AR-PI', 'AR-2024-002', 'Tyre batch advance', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, NULL, 180000.00, NULL, NULL, NULL, NULL),
('2024-05-03', 'Invoice', 'CUST-311', 'IN-2024-010', ' ', 'Nitol Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 65, 2, 'AR-IN', 'IN-2024-010', 'Commercial tyre supply', NULL, NULL, 720000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-05-08', 'Apply Document', 'CUST-311', 'AP-2024-002', 'IN-2024-010', 'Nitol Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 66, 2, 'AR-AD', 'IN-2024-010', 'Apply advance to IN-010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 180000.00, NULL, NULL),
('2024-05-12', 'Receipt', 'CUST-310', 'OR-2024-009', 'IN-2024-009', 'Akij Motors', 'AC-CORP', 'Corporate Accounts', 67, 1, 'AR-PY', 'IN-2024-009', 'Full clearing Akij', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 580000.00, NULL, NULL, NULL, NULL, NULL),
('2024-05-16', 'Receipt', 'CUST-311', 'OR-2024-010', 'IN-2024-010', 'Nitol Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 67, 2, 'AR-PY', 'IN-2024-010', 'Balance payment Nitol', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 540000.00, NULL, NULL, NULL, NULL, NULL),
('2024-05-20', 'Invoice', 'CUST-312', 'IN-2024-011', ' ', 'Runner Automobiles', 'AC-CORP', 'Corporate Accounts', 68, 1, 'AR-IN', 'IN-2024-011', 'Motorcycle assembly parts', NULL, NULL, 430000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-05-25', 'Debit Note', 'CUST-312', 'DN-2024-002', 'IN-2024-011', 'Runner Automobiles', 'AC-CORP', 'Corporate Accounts', 69, 1, 'AR-DN', 'IN-2024-011', 'Special packing charge', NULL, NULL, NULL, 6000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-06-02', 'Receipt', 'CUST-312', 'OR-2024-011', 'IN-2024-011', 'Runner Automobiles', 'AC-CORP', 'Corporate Accounts', 70, 1, 'AR-PY', 'IN-2024-011', 'Full payment with DN', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 436000.00, NULL, NULL, NULL, NULL, NULL),
('2024-06-06', 'Invoice', 'CUST-313', 'IN-2024-012', ' ', 'Uttara Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 68, 2, 'AR-IN', 'IN-2024-012', 'Engine oil shipment', NULL, NULL, 390000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-06-11', 'Unapplied Cash', 'CUST-313', 'UC-2024-002', 'N/A', 'Uttara Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 70, 2, 'AR-UC', 'UC-2024-002', 'Excess transfer credit', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, NULL, NULL, 12000.00, NULL, NULL, NULL),
('2024-06-16', 'Receipt', 'CUST-313', 'OR-2024-012', 'IN-2024-012', 'Uttara Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 71, 1, 'AR-PY', 'IN-2024-012', 'Settlement payment', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 390000.00, NULL, NULL, NULL, NULL, NULL),
('2024-06-20', 'Invoice', 'CUST-314', 'IN-2024-013', ' ', 'Navana Group', 'AC-CORP', 'Corporate Accounts', 72, 1, 'AR-IN', 'IN-2024-013', 'Construction equipment parts', NULL, NULL, 610000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-06-24', 'Credit Note', 'CUST-314', 'CR-2024-003', 'IN-2024-013', 'Navana Group', 'AC-CORP', 'Corporate Accounts', 69, 2, 'AR-CR', 'IN-2024-013', 'Volume rebate Navana', NULL, NULL, NULL, NULL, 15000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-06-28', 'Receipt', 'CUST-314', 'OR-2024-013', 'IN-2024-013', 'Navana Group', 'AC-CORP', 'Corporate Accounts', 71, 2, 'AR-PY', 'IN-2024-013', 'Full clearing Navana', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 595000.00, NULL, NULL, NULL, NULL, NULL),
('2024-06-30', 'Write-Off', 'CUST-315', 'WO-2024-002', 'N/A', 'Barisal Auto Store', 'AC-RTL', 'Retail Accounts', 73, 1, 'AR-WO', 'IN-2023-711', 'Unrecoverable account write-off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4200.00, NULL),

-- 2024 Quarter 3 (Jul - Sep 2024)
('2024-07-03', 'Invoice', 'CUST-316', 'IN-2024-014', ' ', 'Magura Group', 'AC-COMM', 'Commercial Accounts', 72, 2, 'AR-IN', 'IN-2024-014', 'Paper pulp raw material', NULL, NULL, 320000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-07-06', 'Advance Receipt', 'CUST-317', 'AR-2024-003', 'AR-2024-003', 'Bashundhara Paper', 'AC-CORP', 'Corporate Accounts', 74, 1, 'AR-PI', 'AR-2024-003', 'Paper chemical advance', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 250000.00, NULL, NULL, NULL, NULL),
('2024-07-11', 'Receipt', 'CUST-316', 'OR-2024-014', 'IN-2024-014', 'Magura Group', 'AC-COMM', 'Commercial Accounts', 75, 1, 'AR-PY', 'IN-2024-014', 'Cheque clearing Magura', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 320000.00, NULL, NULL, NULL, NULL, NULL),
('2024-07-15', 'Invoice', 'CUST-317', 'IN-2024-015', ' ', 'Bashundhara Paper', 'AC-CORP', 'Corporate Accounts', 76, 1, 'AR-IN', 'IN-2024-015', 'Bleaching agent delivery', NULL, NULL, 850000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-07-20', 'Apply Document', 'CUST-317', 'AP-2024-003', 'IN-2024-015', 'Bashundhara Paper', 'AC-CORP', 'Corporate Accounts', 74, 2, 'AR-AD', 'IN-2024-015', 'Apply advance to IN-015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250000.00, NULL, NULL),
('2024-07-25', 'Receipt', 'CUST-317', 'OR-2024-015', 'IN-2024-015', 'Bashundhara Paper', 'AC-CORP', 'Corporate Accounts', 75, 2, 'AR-PY', 'IN-2024-015', 'Balance payment Bashundhara', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 600000.00, NULL, NULL, NULL, NULL, NULL),
('2024-08-02', 'Invoice', 'CUST-318', 'IN-2024-016', ' ', 'Meghna Paper Mills', 'AC-COMM', 'Commercial Accounts', 76, 2, 'AR-IN', 'IN-2024-016', 'Packaging board reels', NULL, NULL, 410000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-08-06', 'Debit Note', 'CUST-318', 'DN-2024-003', 'IN-2024-016', 'Meghna Paper Mills', 'AC-COMM', 'Commercial Accounts', 77, 1, 'AR-DN', 'IN-2024-016', 'Demurrage charge', NULL, NULL, NULL, 9000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-08-11', 'Receipt', 'CUST-318', 'OR-2024-016', 'IN-2024-016', 'Meghna Paper Mills', 'AC-COMM', 'Commercial Accounts', 78, 1, 'AR-PY', 'IN-2024-016', 'Full payment Meghna', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 419000.00, NULL, NULL, NULL, NULL, NULL),
('2024-08-16', 'Invoice', 'CUST-319', 'IN-2024-017', ' ', 'Hakkani Pulp & Paper', 'AC-COMM', 'Commercial Accounts', 79, 1, 'AR-IN', 'IN-2024-017', 'Tissue paper jumbo rolls', NULL, NULL, 260000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-08-20', 'Credit Note', 'CUST-319', 'CR-2024-004', 'IN-2024-017', 'Hakkani Pulp & Paper', 'AC-COMM', 'Commercial Accounts', 77, 2, 'AR-CR', 'IN-2024-017', 'GSM specification rebate', NULL, NULL, NULL, NULL, 10000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-08-25', 'Receipt', 'CUST-319', 'OR-2024-017', 'IN-2024-017', 'Hakkani Pulp & Paper', 'AC-COMM', 'Commercial Accounts', 78, 2, 'AR-PY', 'IN-2024-017', 'Net payment Hakkani', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 250000.00, NULL, NULL, NULL, NULL, NULL),
('2024-09-02', 'Invoice', 'CUST-320', 'IN-2024-018', ' ', 'Sonali Paper Mills', 'AC-CORP', 'Corporate Accounts', 79, 2, 'AR-IN', 'IN-2024-018', 'Media paper stock', NULL, NULL, 530000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-09-06', 'Advance Receipt', 'CUST-320', 'AR-2024-004', 'AR-2024-004', 'Sonali Paper Mills', 'AC-CORP', 'Corporate Accounts', 80, 1, 'AR-PI', 'AR-2024-004', 'Advance for next shipment', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 100000.00, NULL, NULL, NULL, NULL),
('2024-09-11', 'Apply Document', 'CUST-320', 'AP-2024-004', 'IN-2024-018', 'Sonali Paper Mills', 'AC-CORP', 'Corporate Accounts', 80, 2, 'AR-AD', 'IN-2024-018', 'Set off advance IN-018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100000.00, NULL, NULL),
('2024-09-15', 'Receipt', 'CUST-320', 'OR-2024-018', 'IN-2024-018', 'Sonali Paper Mills', 'AC-CORP', 'Corporate Accounts', 81, 1, 'AR-PY', 'IN-2024-018', 'Full balance Sonali', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 430000.00, NULL, NULL, NULL, NULL, NULL),
('2024-09-20', 'Invoice', 'CUST-321', 'IN-2024-019', ' ', 'Monno Ceramic Industries', 'AC-CORP', 'Corporate Accounts', 82, 1, 'AR-IN', 'IN-2024-019', 'Glazing clay materials', NULL, NULL, 470000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-09-24', 'Unapplied Cash', 'CUST-321', 'UC-2024-003', 'N/A', 'Monno Ceramic Industries', 'AC-CORP', 'Corporate Accounts', 81, 2, 'AR-UC', 'UC-2024-003', 'Unallocated bank credit', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, NULL, NULL, 18000.00, NULL, NULL, NULL),
('2024-09-27', 'Adjustment', 'CUST-321', 'AD-2024-002', 'IN-2024-019', 'Monno Ceramic Industries', 'AC-CORP', 'Corporate Accounts', 83, 1, 'AR-AD', 'IN-2024-019', 'Vat deduction adjustment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 800.00),
('2024-09-30', 'Receipt', 'CUST-321', 'OR-2024-019', 'IN-2024-019', 'Monno Ceramic Industries', 'AC-CORP', 'Corporate Accounts', 84, 1, 'AR-PY', 'IN-2024-019', 'Net clearing Monno', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 470800.00, NULL, NULL, NULL, NULL, NULL),

-- 2024 Quarter 4 (Oct - Dec 2024)
('2024-10-03', 'Invoice', 'CUST-322', 'IN-2024-020', ' ', 'Shinepukur Ceramics', 'AC-CORP', 'Corporate Accounts', 82, 2, 'AR-IN', 'IN-2024-020', 'Decal paper batch delivery', NULL, NULL, 390000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-10-07', 'Receipt', 'CUST-322', 'OR-2024-020', 'IN-2024-020', 'Shinepukur Ceramics', 'AC-CORP', 'Corporate Accounts', 84, 2, 'AR-PY', 'IN-2024-020', 'Full payment Shinepukur', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 390000.00, NULL, NULL, NULL, NULL, NULL),
('2024-10-12', 'Invoice', 'CUST-323', 'IN-2024-021', ' ', 'RAK Ceramics BD', 'AC-CORP', 'Corporate Accounts', 85, 1, 'AR-IN', 'IN-2024-021', 'Frit and pigment batch', NULL, NULL, 780000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-10-16', 'Credit Note', 'CUST-323', 'CR-2024-005', 'IN-2024-021', 'RAK Ceramics BD', 'AC-CORP', 'Corporate Accounts', 83, 2, 'AR-CR', 'IN-2024-021', 'Transit breakage credit', NULL, NULL, NULL, NULL, 22000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-10-21', 'Receipt', 'CUST-323', 'OR-2024-021', 'IN-2024-021', 'RAK Ceramics BD', 'AC-CORP', 'Corporate Accounts', 86, 1, 'AR-PY', 'IN-2024-021', 'Clearing RAK post CR', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 758000.00, NULL, NULL, NULL, NULL, NULL),
('2024-10-25', 'Advance Receipt', 'CUST-324', 'AR-2024-005', 'AR-2024-005', 'Fu-Wang Ceramic', 'AC-COMM', 'Commercial Accounts', 87, 1, 'AR-PI', 'AR-2024-005', 'Tile raw material advance', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 120000.00, NULL, NULL, NULL, NULL),
('2024-11-02', 'Invoice', 'CUST-324', 'IN-2024-022', ' ', 'Fu-Wang Ceramic', 'AC-COMM', 'Commercial Accounts', 85, 2, 'AR-IN', 'IN-2024-022', 'Feldspar powder supply', NULL, NULL, 460000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-11-06', 'Apply Document', 'CUST-324', 'AP-2024-005', 'IN-2024-022', 'Fu-Wang Ceramic', 'AC-COMM', 'Commercial Accounts', 87, 2, 'AR-AD', 'IN-2024-022', 'Set off advance Fu-Wang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120000.00, NULL, NULL),
('2024-11-11', 'Receipt', 'CUST-324', 'OR-2024-022', 'IN-2024-022', 'Fu-Wang Ceramic', 'AC-COMM', 'Commercial Accounts', 86, 2, 'AR-PY', 'IN-2024-022', 'Clear balance Fu-Wang', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 340000.00, NULL, NULL, NULL, NULL, NULL),
('2024-11-15', 'Invoice', 'CUST-325', 'IN-2024-023', ' ', 'Mir Ceramic Ltd.', 'AC-COMM', 'Commercial Accounts', 88, 1, 'AR-IN', 'IN-2024-023', 'Kiln furniture batch', NULL, NULL, 290000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-11-20', 'Debit Note', 'CUST-325', 'DN-2024-004', 'IN-2024-023', 'Mir Ceramic Ltd.', 'AC-COMM', 'Commercial Accounts', 89, 1, 'AR-DN', 'IN-2024-023', 'Express freight fee', NULL, NULL, NULL, 4500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-11-25', 'Receipt', 'CUST-325', 'OR-2024-023', 'IN-2024-023', 'Mir Ceramic Ltd.', 'AC-COMM', 'Commercial Accounts', 90, 1, 'AR-PY', 'IN-2024-023', 'Full clearing Mir Ceramic', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 294500.00, NULL, NULL, NULL, NULL, NULL),
('2024-12-02', 'Invoice', 'CUST-326', 'IN-2024-024', ' ', 'Marico Bangladesh', 'AC-CORP', 'Corporate Accounts', 88, 2, 'AR-IN', 'IN-2024-024', 'Coconut oil raw batch', NULL, NULL, 810000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-12-06', 'Receipt', 'CUST-326', 'OR-2024-024', 'IN-2024-024', 'Marico Bangladesh', 'AC-CORP', 'Corporate Accounts', 90, 2, 'AR-PY', 'IN-2024-024', 'Wire transfer Marico', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 810000.00, NULL, NULL, NULL, NULL, NULL),
('2024-12-10', 'Invoice', 'CUST-327', 'IN-2024-025', ' ', 'Unilever Bangladesh', 'AC-CORP', 'Corporate Accounts', 91, 1, 'AR-IN', 'IN-2024-025', 'Detergent raw material', NULL, NULL, 1250000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-12-12', 'Credit Note', 'CUST-327', 'CR-2024-006', 'IN-2024-025', 'Unilever Bangladesh', 'AC-CORP', 'Corporate Accounts', 89, 2, 'AR-CR', 'IN-2024-025', 'Annual partnership rebate', NULL, NULL, NULL, NULL, 50000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-12-16', 'Receipt', 'CUST-327', 'OR-2024-025', 'IN-2024-025', 'Unilever Bangladesh', 'AC-CORP', 'Corporate Accounts', 92, 1, 'AR-PY', 'IN-2024-025', 'EFT clearing Unilever', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 1200000.00, NULL, NULL, NULL, NULL, NULL),
('2024-12-18', 'Advance Receipt', 'CUST-328', 'AR-2024-006', 'AR-2024-006', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 93, 1, 'AR-PI', 'AR-2024-006', '2025 Q1 contract advance', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 350000.00, NULL, NULL, NULL, NULL),
('2024-12-20', 'Invoice', 'CUST-328', 'IN-2024-026', ' ', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 91, 2, 'AR-IN', 'IN-2024-026', 'Soap base noodles batch', NULL, NULL, 920000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-12-22', 'Apply Document', 'CUST-328', 'AP-2024-006', 'IN-2024-026', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 93, 2, 'AR-AD', 'IN-2024-026', 'Apply advance to IN-026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350000.00, NULL, NULL),
('2024-12-24', 'Receipt', 'CUST-328', 'OR-2024-026', 'IN-2024-026', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 92, 2, 'AR-PY', 'IN-2024-026', 'Part payment Square', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 400000.00, NULL, NULL, NULL, NULL, NULL),
('2024-12-26', 'Write-Off', 'CUST-329', 'WO-2024-003', 'N/A', 'Rajshahi Consumer Mart', 'AC-RTL', 'Retail Accounts', 94, 1, 'AR-WO', 'IN-2023-310', 'Year-end bad debt write-off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9500.00, NULL),
('2024-12-28', 'Adjustment', 'CUST-328', 'AD-2024-003', 'IN-2024-026', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 94, 2, 'AR-AD', 'IN-2024-026', 'Tax deduction adjustment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000.00),
('2024-12-29', 'Receipt', 'CUST-328', 'OR-2024-027', 'IN-2024-026', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 95, 1, 'AR-PY', 'IN-2024-026', 'Final settlement Square', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 164000.00, NULL, NULL, NULL, NULL, NULL),
('2024-12-30', 'Invoice', 'CUST-330', 'IN-2024-027', ' ', 'Kohinoor Chemical Co.', 'AC-COMM', 'Commercial Accounts', 96, 1, 'AR-IN', 'IN-2024-027', 'Glycerine supply batch', NULL, NULL, 640000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-12-30', 'Unapplied Cash', 'CUST-330', 'UC-2024-004', 'N/A', 'Kohinoor Chemical Co.', 'AC-COMM', 'Commercial Accounts', 95, 2, 'AR-UC', 'UC-2024-004', 'Year-end advance deposit', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, NULL, NULL, 40000.00, NULL, NULL, NULL),
('2024-12-31', 'Receipt', 'CUST-330', 'OR-2024-028', 'IN-2024-027', 'Kohinoor Chemical Co.', 'AC-COMM', 'Commercial Accounts', 96, 2, 'AR-PY', 'IN-2024-027', 'Year-end closing payment', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 600000.00, NULL, NULL, NULL, NULL, NULL),
('2024-12-31', 'Debit Note', 'CUST-330', 'DN-2024-005', 'IN-2024-027', 'Kohinoor Chemical Co.', 'AC-COMM', 'Commercial Accounts', 97, 1, 'AR-DN', 'IN-2024-027', 'Late payment interest', NULL, NULL, NULL, 8000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-12-31', 'Credit Note', 'CUST-330', 'CR-2024-007', 'IN-2024-027', 'Kohinoor Chemical Co.', 'AC-COMM', 'Commercial Accounts', 97, 2, 'AR-CR', 'IN-2024-027', 'Year-end volume rebate', NULL, NULL, NULL, NULL, 8000.00, NULL, NULL, NULL, NULL, NULL, NULL);
GO

-- ভিউতে (View) নতুন ২০২৪ সালের ডাটা চেক করার জন্য কোয়েরি:
SELECT * FROM vw_AR_TRANSACTION
WHERE TransactionDate BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY [Customer ID], TransactionDate, [Batch Number], [Entry No];
GO



USE Demo_Database;
GO

-- ২০২৩ সালের ১০০টি অতিরিক্ত ডেমো ডেটা ইনসার্ট (Row 351 - 450)
INSERT INTO dbo.AR_TRANSACTION_DEMO 
(TransactionDate, TransactionType, IDCUST, [DOC NUMBER], AppliedDocument, NAMECUST, IDACCTSET, TEXTDESC, CNTBTCH, CNTITEM, SourceCode, DocNumber, Description, BankCode, [Bank Name], Invoice, [Debit Note], [Credit Note], Receipt, [Advance Receipt], [Unapplied Cash], [Apply Document], [Write-Off], Adjustment)
VALUES
-- 2023 Quarter 1 (Jan - Mar 2023)
('2023-01-05', 'Invoice', 'CUST-401', 'IN-2023-001', ' ', 'Incepta Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 101, 1, 'AR-IN', 'IN-2023-001', 'Bulk vaccine bottles', NULL, NULL, 520000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-01-10', 'Receipt', 'CUST-401', 'OR-2023-001', 'IN-2023-001', 'Incepta Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 102, 1, 'AR-PY', 'IN-2023-001', 'Full payment Incepta', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 520000.00, NULL, NULL, NULL, NULL, NULL),
('2023-01-15', 'Invoice', 'CUST-402', 'IN-2023-002', ' ', 'Acme Laboratories', 'AC-CORP', 'Corporate Accounts', 101, 2, 'AR-IN', 'IN-2023-002', 'Blister packing sheets', NULL, NULL, 410000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-01-18', 'Credit Note', 'CUST-402', 'CR-2023-001', 'IN-2023-002', 'Acme Laboratories', 'AC-CORP', 'Corporate Accounts', 103, 1, 'AR-CR', 'IN-2023-002', 'Quality discount Acme', NULL, NULL, NULL, NULL, 15000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-01-22', 'Receipt', 'CUST-402', 'OR-2023-002', 'IN-2023-002', 'Acme Laboratories', 'AC-CORP', 'Corporate Accounts', 102, 2, 'AR-PY', 'IN-2023-002', 'Net payment post credit', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 395000.00, NULL, NULL, NULL, NULL, NULL),
('2023-01-28', 'Advance Receipt', 'CUST-403', 'AR-2023-001', 'AR-2023-001', 'Aristopharma Ltd', 'AC-CORP', 'Corporate Accounts', 104, 1, 'AR-PI', 'AR-2023-001', 'Syrup bottle advance', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 200000.00, NULL, NULL, NULL, NULL),
('2023-02-04', 'Invoice', 'CUST-403', 'IN-2023-003', ' ', 'Aristopharma Ltd', 'AC-CORP', 'Corporate Accounts', 105, 1, 'AR-IN', 'IN-2023-003', 'Pharma PET bottles delivery', NULL, NULL, 680000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-02-08', 'Apply Document', 'CUST-403', 'AP-2023-001', 'IN-2023-003', 'Aristopharma Ltd', 'AC-CORP', 'Corporate Accounts', 106, 1, 'AR-AD', 'IN-2023-003', 'Apply advance to IN-003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200000.00, NULL, NULL),
('2023-02-12', 'Receipt', 'CUST-403', 'OR-2023-003', 'IN-2023-003', 'Aristopharma Ltd', 'AC-CORP', 'Corporate Accounts', 106, 2, 'AR-PY', 'IN-2023-003', 'Final clearing Aristo', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 480000.00, NULL, NULL, NULL, NULL, NULL),
('2023-02-17', 'Invoice', 'CUST-404', 'IN-2023-004', ' ', 'Eskayef Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 105, 2, 'AR-IN', 'IN-2023-004', 'Capsule shell consignment', NULL, NULL, 590000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-02-21', 'Debit Note', 'CUST-404', 'DN-2023-001', 'IN-2023-004', 'Eskayef Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 107, 1, 'AR-DN', 'IN-2023-004', 'Handling surcharge', NULL, NULL, NULL, 8000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-02-25', 'Receipt', 'CUST-404', 'OR-2023-004', 'IN-2023-004', 'Eskayef Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 108, 1, 'AR-PY', 'IN-2023-004', 'Full settlement Eskayef', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 598000.00, NULL, NULL, NULL, NULL, NULL),
('2023-03-03', 'Invoice', 'CUST-405', 'IN-2023-005', ' ', 'Pran Foods Ltd', 'AC-CORP', 'Corporate Accounts', 109, 1, 'AR-IN', 'IN-2023-005', 'Juice packaging cartons', NULL, NULL, 880000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-03-07', 'Unapplied Cash', 'CUST-405', 'UC-2023-001', 'N/A', 'Pran Foods Ltd', 'AC-CORP', 'Corporate Accounts', 108, 2, 'AR-UC', 'UC-2023-001', 'Unmatched wire deposit', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, NULL, NULL, 50000.00, NULL, NULL, NULL),
('2023-03-12', 'Receipt', 'CUST-405', 'OR-2023-005', 'IN-2023-005', 'Pran Foods Ltd', 'AC-CORP', 'Corporate Accounts', 110, 1, 'AR-PY', 'IN-2023-005', 'Part payment Pran', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL, NULL),
('2023-03-16', 'Invoice', 'CUST-406', 'IN-2023-006', ' ', 'Olympic Industries', 'AC-COMM', 'Commercial Accounts', 109, 2, 'AR-IN', 'IN-2023-006', 'Biscuit wrapper film', NULL, NULL, 310000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-03-21', 'Write-Off', 'CUST-407', 'WO-2023-001', 'N/A', 'Sylhet Trading Co.', 'AC-RTL', 'Retail Accounts', 111, 1, 'AR-WO', 'IN-2022-808', 'Irrecoverable customer loss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8200.00, NULL),
('2023-03-26', 'Adjustment', 'CUST-406', 'AD-2023-001', 'IN-2023-006', 'Olympic Industries', 'AC-COMM', 'Commercial Accounts', 111, 2, 'AR-AD', 'IN-2023-006', 'Small balance rounding', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350.00),
('2023-03-29', 'Receipt', 'CUST-406', 'OR-2023-006', 'IN-2023-006', 'Olympic Industries', 'AC-COMM', 'Commercial Accounts', 110, 2, 'AR-PY', 'IN-2023-006', 'Full clearing Olympic', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 310350.00, NULL, NULL, NULL, NULL, NULL),
('2023-03-31', 'Invoice', 'CUST-408', 'IN-2023-007', ' ', 'Bombay Sweets', 'AC-COMM', 'Commercial Accounts', 112, 1, 'AR-IN', 'IN-2023-007', 'Snack foil pouches', NULL, NULL, 240000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),

-- 2023 Quarter 2 (Apr - Jun 2023)
('2023-04-04', 'Receipt', 'CUST-408', 'OR-2023-007', 'IN-2023-007', 'Bombay Sweets', 'AC-COMM', 'Commercial Accounts', 113, 1, 'AR-PY', 'IN-2023-007', 'Bank transfer Bombay', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 240000.00, NULL, NULL, NULL, NULL, NULL),
('2023-04-09', 'Invoice', 'CUST-409', 'IN-2023-008', ' ', 'Akij Food & Beverage', 'AC-CORP', 'Corporate Accounts', 112, 2, 'AR-IN', 'IN-2023-008', 'Beverage preform batch', NULL, NULL, 760000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-04-14', 'Credit Note', 'CUST-409', 'CR-2023-002', 'IN-2023-008', 'Akij Food & Beverage', 'AC-CORP', 'Corporate Accounts', 114, 1, 'AR-CR', 'IN-2023-008', 'Bulk discount Akij', NULL, NULL, NULL, NULL, 25000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-04-19', 'Receipt', 'CUST-409', 'OR-2023-008', 'IN-2023-008', 'Akij Food & Beverage', 'AC-CORP', 'Corporate Accounts', 113, 2, 'AR-PY', 'IN-2023-008', 'Net settlement Akij', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 735000.00, NULL, NULL, NULL, NULL, NULL),
('2023-04-24', 'Invoice', 'CUST-410', 'IN-2023-009', ' ', 'Partex Beverage', 'AC-COMM', 'Commercial Accounts', 115, 1, 'AR-IN', 'IN-2023-009', 'PET bottle caps batch', NULL, NULL, 330000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-04-27', 'Advance Receipt', 'CUST-411', 'AR-2023-002', 'AR-2023-002', 'Igloo Ice Cream', 'AC-COMM', 'Commercial Accounts', 116, 1, 'AR-PI', 'AR-2023-002', 'Summer batch advance', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, NULL, 120000.00, NULL, NULL, NULL, NULL),
('2023-05-04', 'Invoice', 'CUST-411', 'IN-2023-010', ' ', 'Igloo Ice Cream', 'AC-COMM', 'Commercial Accounts', 115, 2, 'AR-IN', 'IN-2023-010', 'Ice cream cup lids', NULL, NULL, 450000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-05-09', 'Apply Document', 'CUST-411', 'AP-2023-002', 'IN-2023-010', 'Igloo Ice Cream', 'AC-COMM', 'Commercial Accounts', 116, 2, 'AR-AD', 'IN-2023-010', 'Apply advance to IN-010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120000.00, NULL, NULL),
('2023-05-13', 'Receipt', 'CUST-410', 'OR-2023-009', 'IN-2023-009', 'Partex Beverage', 'AC-COMM', 'Commercial Accounts', 117, 1, 'AR-PY', 'IN-2023-009', 'Full payment Partex', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 330000.00, NULL, NULL, NULL, NULL, NULL),
('2023-05-17', 'Receipt', 'CUST-411', 'OR-2023-010', 'IN-2023-010', 'Igloo Ice Cream', 'AC-COMM', 'Commercial Accounts', 117, 2, 'AR-PY', 'IN-2023-010', 'Balance payment Igloo', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 330000.00, NULL, NULL, NULL, NULL, NULL),
('2023-05-22', 'Invoice', 'CUST-412', 'IN-2023-011', ' ', 'National Polymer', 'AC-CORP', 'Corporate Accounts', 118, 1, 'AR-IN', 'IN-2023-011', 'PVC resin raw material', NULL, NULL, 640000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-05-26', 'Debit Note', 'CUST-412', 'DN-2023-002', 'IN-2023-011', 'National Polymer', 'AC-CORP', 'Corporate Accounts', 119, 1, 'AR-DN', 'IN-2023-011', 'Delayed unload fee', NULL, NULL, NULL, 5500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-06-03', 'Receipt', 'CUST-412', 'OR-2023-011', 'IN-2023-011', 'National Polymer', 'AC-CORP', 'Corporate Accounts', 120, 1, 'AR-PY', 'IN-2023-011', 'Full payment with DN', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 645500.00, NULL, NULL, NULL, NULL, NULL),
('2023-06-07', 'Invoice', 'CUST-413', 'IN-2023-012', ' ', 'RFL Plastics Ltd', 'AC-CORP', 'Corporate Accounts', 118, 2, 'AR-IN', 'IN-2023-012', 'PP granule consignment', NULL, NULL, 910000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-06-12', 'Unapplied Cash', 'CUST-413', 'UC-2023-002', 'N/A', 'RFL Plastics Ltd', 'AC-CORP', 'Corporate Accounts', 120, 2, 'AR-UC', 'UC-2023-002', 'Excess bank credit', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, NULL, NULL, 25000.00, NULL, NULL, NULL),
('2023-06-17', 'Receipt', 'CUST-413', 'OR-2023-012', 'IN-2023-012', 'RFL Plastics Ltd', 'AC-CORP', 'Corporate Accounts', 121, 1, 'AR-PY', 'IN-2023-012', 'Clearing IN-2023-012', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 910000.00, NULL, NULL, NULL, NULL, NULL),
('2023-06-21', 'Invoice', 'CUST-414', 'IN-2023-013', ' ', 'Bengal Polymer', 'AC-CORP', 'Corporate Accounts', 122, 1, 'AR-IN', 'IN-2023-013', 'Plastic Masterbatch', NULL, NULL, 480000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-06-25', 'Credit Note', 'CUST-414', 'CR-2023-003', 'IN-2023-013', 'Bengal Polymer', 'AC-CORP', 'Corporate Accounts', 119, 2, 'AR-CR', 'IN-2023-013', 'Price variance credit', NULL, NULL, NULL, NULL, 12000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-06-29', 'Receipt', 'CUST-414', 'OR-2023-013', 'IN-2023-013', 'Bengal Polymer', 'AC-CORP', 'Corporate Accounts', 121, 2, 'AR-PY', 'IN-2023-013', 'Settlement Bengal', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 468000.00, NULL, NULL, NULL, NULL, NULL),
('2023-06-30', 'Write-Off', 'CUST-415', 'WO-2023-002', 'N/A', 'Comilla Plastic House', 'AC-RTL', 'Retail Accounts', 123, 1, 'AR-WO', 'IN-2022-512', 'Mid-year bad debt write-off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5400.00, NULL),

-- 2023 Quarter 3 (Jul - Sep 2023)
('2023-07-04', 'Invoice', 'CUST-416', 'IN-2023-014', ' ', 'KSRM Steel Plant', 'AC-CORP', 'Corporate Accounts', 122, 2, 'AR-IN', 'IN-2023-014', 'Industrial lubricants', NULL, NULL, 550000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-07-08', 'Advance Receipt', 'CUST-417', 'AR-2023-003', 'AR-2023-003', 'BSRM Steels', 'AC-CORP', 'Corporate Accounts', 124, 1, 'AR-PI', 'AR-2023-003', 'Hydraulic oil advance', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 150000.00, NULL, NULL, NULL, NULL),
('2023-07-12', 'Receipt', 'CUST-416', 'OR-2023-014', 'IN-2023-014', 'KSRM Steel Plant', 'AC-CORP', 'Corporate Accounts', 125, 1, 'AR-PY', 'IN-2023-014', 'EFT payment KSRM', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 550000.00, NULL, NULL, NULL, NULL, NULL),
('2023-07-17', 'Invoice', 'CUST-417', 'IN-2023-015', ' ', 'BSRM Steels', 'AC-CORP', 'Corporate Accounts', 126, 1, 'AR-IN', 'IN-2023-015', 'Refractory oil batch', NULL, NULL, 820000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-07-21', 'Apply Document', 'CUST-417', 'AP-2023-003', 'IN-2023-015', 'BSRM Steels', 'AC-CORP', 'Corporate Accounts', 124, 2, 'AR-AD', 'IN-2023-015', 'Set off advance IN-015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150000.00, NULL, NULL),
('2023-07-26', 'Receipt', 'CUST-417', 'OR-2023-015', 'IN-2023-015', 'BSRM Steels', 'AC-CORP', 'Corporate Accounts', 125, 2, 'AR-PY', 'IN-2023-015', 'Balance payment BSRM', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 670000.00, NULL, NULL, NULL, NULL, NULL),
('2023-08-03', 'Invoice', 'CUST-418', 'IN-2023-016', ' ', 'GPH Ispat', 'AC-CORP', 'Corporate Accounts', 126, 2, 'AR-IN', 'IN-2023-016', 'Cutting fluid shipment', NULL, NULL, 370000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-08-07', 'Debit Note', 'CUST-418', 'DN-2023-003', 'IN-2023-016', 'GPH Ispat', 'AC-CORP', 'Corporate Accounts', 127, 1, 'AR-DN', 'IN-2023-016', 'Emergency delivery fee', NULL, NULL, NULL, 6500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-08-12', 'Receipt', 'CUST-418', 'OR-2023-016', 'IN-2023-016', 'GPH Ispat', 'AC-CORP', 'Corporate Accounts', 128, 1, 'AR-PY', 'IN-2023-016', 'Full settlement GPH', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 376500.00, NULL, NULL, NULL, NULL, NULL),
('2023-08-18', 'Invoice', 'CUST-419', 'IN-2023-017', ' ', 'Anwar Ispat', 'AC-COMM', 'Commercial Accounts', 129, 1, 'AR-IN', 'IN-2023-017', 'Grease barrel batch', NULL, NULL, 290000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-08-22', 'Credit Note', 'CUST-419', 'CR-2023-004', 'IN-2023-017', 'Anwar Ispat', 'AC-COMM', 'Commercial Accounts', 127, 2, 'AR-CR', 'IN-2023-017', 'Return credit Anwar', NULL, NULL, NULL, NULL, 9000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-08-27', 'Receipt', 'CUST-419', 'OR-2023-017', 'IN-2023-017', 'Anwar Ispat', 'AC-COMM', 'Commercial Accounts', 128, 2, 'AR-PY', 'IN-2023-017', 'Clearing Anwar Ispat', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 281000.00, NULL, NULL, NULL, NULL, NULL),
('2023-09-03', 'Invoice', 'CUST-420', 'IN-2023-018', ' ', 'Berger Paints BD', 'AC-CORP', 'Corporate Accounts', 129, 2, 'AR-IN', 'IN-2023-018', 'Pigment chemical resins', NULL, NULL, 610000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-09-07', 'Advance Receipt', 'CUST-420', 'AR-2023-004', 'AR-2023-004', 'Berger Paints BD', 'AC-CORP', 'Corporate Accounts', 130, 1, 'AR-PI', 'AR-2023-004', 'Solvent batch advance', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 180000.00, NULL, NULL, NULL, NULL),
('2023-09-12', 'Apply Document', 'CUST-420', 'AP-2023-004', 'IN-2023-018', 'Berger Paints BD', 'AC-CORP', 'Corporate Accounts', 130, 2, 'AR-AD', 'IN-2023-018', 'Set off advance IN-018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 180000.00, NULL, NULL),
('2023-09-16', 'Receipt', 'CUST-420', 'OR-2023-018', 'IN-2023-018', 'Berger Paints BD', 'AC-CORP', 'Corporate Accounts', 131, 1, 'AR-PY', 'IN-2023-018', 'Balance clearing Berger', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 430000.00, NULL, NULL, NULL, NULL, NULL),
('2023-09-21', 'Invoice', 'CUST-421', 'IN-2023-019', ' ', 'Asian Paints BD', 'AC-CORP', 'Corporate Accounts', 132, 1, 'AR-IN', 'IN-2023-019', 'Emulsion additives', NULL, NULL, 430000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-09-25', 'Unapplied Cash', 'CUST-421', 'UC-2023-003', 'N/A', 'Asian Paints BD', 'AC-CORP', 'Corporate Accounts', 131, 2, 'AR-UC', 'UC-2023-003', 'Unclaimed electronic credit', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, NULL, NULL, 15000.00, NULL, NULL, NULL),
('2023-09-28', 'Adjustment', 'CUST-421', 'AD-2023-002', 'IN-2023-019', 'Asian Paints BD', 'AC-CORP', 'Corporate Accounts', 133, 1, 'AR-AD', 'IN-2023-019', 'Tax withholding entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500.00),
('2023-09-30', 'Receipt', 'CUST-421', 'OR-2023-019', 'IN-2023-019', 'Asian Paints BD', 'AC-CORP', 'Corporate Accounts', 134, 1, 'AR-PY', 'IN-2023-019', 'Full clearing Asian Paints', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 430500.00, NULL, NULL, NULL, NULL, NULL),

-- 2023 Quarter 4 (Oct - Dec 2023)
('2023-10-04', 'Invoice', 'CUST-422', 'IN-2023-020', ' ', 'Roxy Paint', 'AC-COMM', 'Commercial Accounts', 132, 2, 'AR-IN', 'IN-2023-020', 'Synthetic enamel chemical', NULL, NULL, 280000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-10-08', 'Receipt', 'CUST-422', 'OR-2023-020', 'IN-2023-020', 'Roxy Paint', 'AC-COMM', 'Commercial Accounts', 134, 2, 'AR-PY', 'IN-2023-020', 'Full payment Roxy', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 280000.00, NULL, NULL, NULL, NULL, NULL),
('2023-10-13', 'Invoice', 'CUST-423', 'IN-2023-021', ' ', 'Elite Paint', 'AC-COMM', 'Commercial Accounts', 135, 1, 'AR-IN', 'IN-2023-021', 'Industrial coating batch', NULL, NULL, 360000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-10-17', 'Credit Note', 'CUST-423', 'CR-2023-005', 'IN-2023-021', 'Elite Paint', 'AC-COMM', 'Commercial Accounts', 133, 2, 'AR-CR', 'IN-2023-021', 'Special concession credit', NULL, NULL, NULL, NULL, 10000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-10-22', 'Receipt', 'CUST-423', 'OR-2023-021', 'IN-2023-021', 'Elite Paint', 'AC-COMM', 'Commercial Accounts', 136, 1, 'AR-PY', 'IN-2023-021', 'Clear IN-021 Elite Paint', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 350000.00, NULL, NULL, NULL, NULL, NULL),
('2023-10-27', 'Advance Receipt', 'CUST-424', 'AR-2023-005', 'AR-2023-005', 'Paban Textile Mills', 'AC-CORP', 'Corporate Accounts', 137, 1, 'AR-PI', 'AR-2023-005', 'Yarn chemical advance', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 220000.00, NULL, NULL, NULL, NULL),
('2023-11-03', 'Invoice', 'CUST-424', 'IN-2023-022', ' ', 'Paban Textile Mills', 'AC-CORP', 'Corporate Accounts', 135, 2, 'AR-IN', 'IN-2023-022', 'Textile dye consignment', NULL, NULL, 790000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-11-07', 'Apply Document', 'CUST-424', 'AP-2023-005', 'IN-2023-022', 'Paban Textile Mills', 'AC-CORP', 'Corporate Accounts', 137, 2, 'AR-AD', 'IN-2023-022', 'Apply advance to IN-022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 220000.00, NULL, NULL),
('2023-11-12', 'Receipt', 'CUST-424', 'OR-2023-022', 'IN-2023-022', 'Paban Textile Mills', 'AC-CORP', 'Corporate Accounts', 136, 2, 'AR-PY', 'IN-2023-022', 'Net balance Paban', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 570000.00, NULL, NULL, NULL, NULL, NULL),
('2023-11-16', 'Invoice', 'CUST-425', 'IN-2023-023', ' ', 'Envoy Textiles', 'AC-CORP', 'Corporate Accounts', 138, 1, 'AR-IN', 'IN-2023-023', 'Denim processing chemicals', NULL, NULL, 640000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-11-21', 'Debit Note', 'CUST-425', 'DN-2023-004', 'IN-2023-023', 'Envoy Textiles', 'AC-CORP', 'Corporate Accounts', 139, 1, 'AR-DN', 'IN-2023-023', 'Freight adjustment DN', NULL, NULL, NULL, 7500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-11-26', 'Receipt', 'CUST-425', 'OR-2023-023', 'IN-2023-023', 'Envoy Textiles', 'AC-CORP', 'Corporate Accounts', 140, 1, 'AR-PY', 'IN-2023-023', 'Full payment Envoy', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 647500.00, NULL, NULL, NULL, NULL, NULL),
('2023-12-03', 'Invoice', 'CUST-426', 'IN-2023-024', ' ', 'Square Textiles', 'AC-CORP', 'Corporate Accounts', 138, 2, 'AR-IN', 'IN-2023-024', 'Spinning oil lubricants', NULL, NULL, 830000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-12-07', 'Receipt', 'CUST-426', 'OR-2023-024', 'IN-2023-024', 'Square Textiles', 'AC-CORP', 'Corporate Accounts', 140, 2, 'AR-PY', 'IN-2023-024', 'EFT clearing Square Text', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 830000.00, NULL, NULL, NULL, NULL, NULL),
('2023-12-11', 'Invoice', 'CUST-427', 'IN-2023-025', ' ', 'Ha-Meem Group', 'AC-CORP', 'Corporate Accounts', 141, 1, 'AR-IN', 'IN-2023-025', 'Garments washing agent', NULL, NULL, 1100000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-12-14', 'Credit Note', 'CUST-427', 'CR-2023-006', 'IN-2023-025', 'Ha-Meem Group', 'AC-CORP', 'Corporate Accounts', 139, 2, 'AR-CR', 'IN-2023-025', 'Year-end rebate Ha-Meem', NULL, NULL, NULL, NULL, 40000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-12-17', 'Receipt', 'CUST-427', 'OR-2023-025', 'IN-2023-025', 'Ha-Meem Group', 'AC-CORP', 'Corporate Accounts', 142, 1, 'AR-PY', 'IN-2023-025', 'Net payment Ha-Meem', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 1060000.00, NULL, NULL, NULL, NULL, NULL),
('2023-12-19', 'Advance Receipt', 'CUST-428', 'AR-2023-006', 'AR-2023-006', 'Beximco Synthetics', 'AC-CORP', 'Corporate Accounts', 143, 1, 'AR-PI', 'AR-2023-006', 'Polymer batch advance', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 300000.00, NULL, NULL, NULL, NULL),
('2023-12-21', 'Invoice', 'CUST-428', 'IN-2023-026', ' ', 'Beximco Synthetics', 'AC-CORP', 'Corporate Accounts', 141, 2, 'AR-IN', 'IN-2023-026', 'Yarn raw materials batch', NULL, NULL, 950000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-12-23', 'Apply Document', 'CUST-428', 'AP-2023-006', 'IN-2023-026', 'Beximco Synthetics', 'AC-CORP', 'Corporate Accounts', 143, 2, 'AR-AD', 'IN-2023-026', 'Apply advance to IN-026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 300000.00, NULL, NULL),
('2023-12-25', 'Receipt', 'CUST-428', 'OR-2023-026', 'IN-2023-026', 'Beximco Synthetics', 'AC-CORP', 'Corporate Accounts', 142, 2, 'AR-PY', 'IN-2023-026', 'Part clearing Beximco', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 400000.00, NULL, NULL, NULL, NULL, NULL),
('2023-12-27', 'Write-Off', 'CUST-429', 'WO-2023-003', 'N/A', 'Bogra Garments Store', 'AC-RTL', 'Retail Accounts', 144, 1, 'AR-WO', 'IN-2022-104', 'Year-end bad debt clear', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7800.00, NULL),
('2023-12-28', 'Adjustment', 'CUST-428', 'AD-2023-003', 'IN-2023-026', 'Beximco Synthetics', 'AC-CORP', 'Corporate Accounts', 144, 2, 'AR-AD', 'IN-2023-026', 'Tax adjustment entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5000.00),
('2023-12-29', 'Receipt', 'CUST-428', 'OR-2023-027', 'IN-2023-026', 'Beximco Synthetics', 'AC-CORP', 'Corporate Accounts', 145, 1, 'AR-PY', 'IN-2023-026', 'Final settlement Beximco', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 245000.00, NULL, NULL, NULL, NULL, NULL),
('2023-12-30', 'Invoice', 'CUST-430', 'IN-2023-027', ' ', 'DMS Garments Ltd', 'AC-COMM', 'Commercial Accounts', 146, 1, 'AR-IN', 'IN-2023-027', 'Accessories shipment', NULL, NULL, 510000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-12-30', 'Unapplied Cash', 'CUST-430', 'UC-2023-004', 'N/A', 'DMS Garments Ltd', 'AC-COMM', 'Commercial Accounts', 145, 2, 'AR-UC', 'UC-2023-004', 'Advance closing credit', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, NULL, NULL, 30000.00, NULL, NULL, NULL),
('2023-12-31', 'Receipt', 'CUST-430', 'OR-2023-028', 'IN-2023-027', 'DMS Garments Ltd', 'AC-COMM', 'Commercial Accounts', 146, 2, 'AR-PY', 'IN-2023-027', 'Year-end payment DMS', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 480000.00, NULL, NULL, NULL, NULL, NULL),
('2023-12-31', 'Debit Note', 'CUST-430', 'DN-2023-005', 'IN-2023-027', 'DMS Garments Ltd', 'AC-COMM', 'Commercial Accounts', 147, 1, 'AR-DN', 'IN-2023-027', 'Late payment surcharge', NULL, NULL, NULL, 6000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2023-12-31', 'Credit Note', 'CUST-430', 'CR-2023-007', 'IN-2023-027', 'DMS Garments Ltd', 'AC-COMM', 'Commercial Accounts', 147, 2, 'AR-CR', 'IN-2023-027', 'Year-end closing discount', NULL, NULL, NULL, NULL, 6000.00, NULL, NULL, NULL, NULL, NULL, NULL);
GO

-- ভিউতে (View) ২০২৩ সালের নতুন ডাটা চেক করার কোয়েরি:
SELECT * FROM vw_AR_TRANSACTION
WHERE TransactionDate BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY [Customer ID], TransactionDate, [Batch Number], [Entry No];
GO


USE Demo_Database;
GO

-- ২০২২ সালের ১০০টি অতিরিক্ত ডেমো ডেটা ইনসার্ট (Row 1 - 100)
INSERT INTO dbo.AR_TRANSACTION_DEMO 
(TransactionDate, TransactionType, IDCUST, [DOC NUMBER], AppliedDocument, NAMECUST, IDACCTSET, TEXTDESC, CNTBTCH, CNTITEM, SourceCode, DocNumber, Description, BankCode, [Bank Name], Invoice, [Debit Note], [Credit Note], Receipt, [Advance Receipt], [Unapplied Cash], [Apply Document], [Write-Off], Adjustment)
VALUES
-- 2022 Quarter 1 (Jan - Mar 2022)
('2022-01-03', 'Invoice', 'CUST-101', 'IN-2022-001', ' ', 'Square Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 1, 1, 'AR-IN', 'IN-2022-001', 'Pharma raw materials', NULL, NULL, 350000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-01-06', 'Receipt', 'CUST-101', 'OR-2022-001', 'IN-2022-001', 'Square Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 2, 1, 'AR-PY', 'IN-2022-001', 'Full payment Square', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 350000.00, NULL, NULL, NULL, NULL, NULL),
('2022-01-10', 'Invoice', 'CUST-102', 'IN-2022-002', ' ', 'Beximco Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 1, 2, 'AR-IN', 'IN-2022-002', 'Chemical reagent shipment', NULL, NULL, 520000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-01-14', 'Credit Note', 'CUST-102', 'CR-2022-001', 'IN-2022-002', 'Beximco Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 3, 1, 'AR-CR', 'IN-2022-002', 'Discount rebate', NULL, NULL, NULL, NULL, 20000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-01-18', 'Receipt', 'CUST-102', 'OR-2022-002', 'IN-2022-002', 'Beximco Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 2, 2, 'AR-PY', 'IN-2022-002', 'Clearing balance Beximco', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL, NULL),
('2022-01-22', 'Advance Receipt', 'CUST-103', 'AR-2022-001', 'AR-2022-001', 'Incepta Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 4, 1, 'AR-PI', 'AR-2022-001', 'Advance for Q1 order', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 100000.00, NULL, NULL, NULL, NULL),
('2022-01-28', 'Invoice', 'CUST-103', 'IN-2022-003', ' ', 'Incepta Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 5, 1, 'AR-IN', 'IN-2022-003', 'Packaging material delivery', NULL, NULL, 400000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-02-02', 'Apply Document', 'CUST-103', 'AP-2022-001', 'IN-2022-003', 'Incepta Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 6, 1, 'AR-AD', 'IN-2022-003', 'Set off advance to IN-003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100000.00, NULL, NULL),
('2022-02-05', 'Receipt', 'CUST-103', 'OR-2022-003', 'IN-2022-003', 'Incepta Pharmaceuticals', 'AC-CORP', 'Corporate Accounts', 6, 2, 'AR-PY', 'IN-2022-003', 'Final payment Incepta', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 300000.00, NULL, NULL, NULL, NULL, NULL),
('2022-02-09', 'Invoice', 'CUST-104', 'IN-2022-004', ' ', 'Renata Limited', 'AC-CORP', 'Corporate Accounts', 5, 2, 'AR-IN', 'IN-2022-004', 'Lab equipment supply', NULL, NULL, 280000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-02-12', 'Debit Note', 'CUST-104', 'DN-2022-001', 'IN-2022-004', 'Renata Limited', 'AC-CORP', 'Corporate Accounts', 7, 1, 'AR-DN', 'IN-2022-004', 'Freight charge adjustment', NULL, NULL, NULL, 5000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-02-16', 'Receipt', 'CUST-104', 'OR-2022-004', 'IN-2022-004', 'Renata Limited', 'AC-CORP', 'Corporate Accounts', 8, 1, 'AR-PY', 'IN-2022-004', 'Full settlement Renata', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 285000.00, NULL, NULL, NULL, NULL, NULL),
('2022-02-20', 'Invoice', 'CUST-105', 'IN-2022-005', ' ', 'ACI Limited', 'AC-CORP', 'Corporate Accounts', 9, 1, 'AR-IN', 'IN-2022-005', 'Agro products supply', NULL, NULL, 600000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-02-24', 'Unapplied Cash', 'CUST-105', 'UC-2022-001', 'N/A', 'ACI Limited', 'AC-CORP', 'Corporate Accounts', 8, 2, 'AR-UC', 'UC-2022-001', 'Unidentified wire transfer', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, NULL, NULL, 25000.00, NULL, NULL, NULL),
('2022-02-27', 'Receipt', 'CUST-105', 'OR-2022-005', 'IN-2022-005', 'ACI Limited', 'AC-CORP', 'Corporate Accounts', 10, 1, 'AR-PY', 'IN-2022-005', 'Part payment ACI', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 400000.00, NULL, NULL, NULL, NULL, NULL),
('2022-03-03', 'Invoice', 'CUST-106', 'IN-2022-006', ' ', 'Walton Hi-Tech', 'AC-CORP', 'Corporate Accounts', 9, 2, 'AR-IN', 'IN-2022-006', 'Electronic components', NULL, NULL, 820000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-03-08', 'Write-Off', 'CUST-107', 'WO-2022-001', 'N/A', 'Dhaka Retail Trading', 'AC-RTL', 'Retail Accounts', 11, 1, 'AR-WO', 'IN-2021-801', 'Unrecoverable bad debt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5000.00, NULL),
('2022-03-12', 'Adjustment', 'CUST-106', 'AD-2022-001', 'IN-2022-006', 'Walton Hi-Tech', 'AC-CORP', 'Corporate Accounts', 11, 2, 'AR-AD', 'IN-2022-006', 'Small rounding adjustment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150.00),
('2022-03-17', 'Receipt', 'CUST-106', 'OR-2022-006', 'IN-2022-006', 'Walton Hi-Tech', 'AC-CORP', 'Corporate Accounts', 10, 2, 'AR-PY', 'IN-2022-006', 'Clearing IN-2022-006', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 820150.00, NULL, NULL, NULL, NULL, NULL),
('2022-03-22', 'Invoice', 'CUST-108', 'IN-2022-007', ' ', 'Singer Bangladesh', 'AC-COMM', 'Commercial Accounts', 12, 1, 'AR-IN', 'IN-2022-007', 'Appliance spare parts', NULL, NULL, 230000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),

-- 2022 Quarter 2 (Apr - Jun 2022)
('2022-04-02', 'Receipt', 'CUST-108', 'OR-2022-007', 'IN-2022-007', 'Singer Bangladesh', 'AC-COMM', 'Commercial Accounts', 13, 1, 'AR-PY', 'IN-2022-007', 'Full payment Singer', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 230000.00, NULL, NULL, NULL, NULL, NULL),
('2022-04-05', 'Invoice', 'CUST-109', 'IN-2022-008', ' ', 'Transcom Electronics', 'AC-COMM', 'Commercial Accounts', 12, 2, 'AR-IN', 'IN-2022-008', 'Display panels', NULL, NULL, 310000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-04-09', 'Credit Note', 'CUST-109', 'CR-2022-002', 'IN-2022-008', 'Transcom Electronics', 'AC-COMM', 'Commercial Accounts', 14, 1, 'AR-CR', 'IN-2022-008', 'Damage allowance', NULL, NULL, NULL, NULL, 10000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-04-14', 'Receipt', 'CUST-109', 'OR-2022-008', 'IN-2022-008', 'Transcom Electronics', 'AC-COMM', 'Commercial Accounts', 13, 2, 'AR-PY', 'IN-2022-008', 'Clearing Transcom', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 300000.00, NULL, NULL, NULL, NULL, NULL),
('2022-04-18', 'Invoice', 'CUST-110', 'IN-2022-009', ' ', 'Hamdard Laboratories', 'AC-COMM', 'Commercial Accounts', 15, 1, 'AR-IN', 'IN-2022-009', 'Herbal ingredients', NULL, NULL, 190000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-04-22', 'Advance Receipt', 'CUST-111', 'AR-2022-002', 'AR-2022-002', 'Akij Motors', 'AC-CORP', 'Corporate Accounts', 16, 1, 'AR-PI', 'AR-2022-002', 'Advance for lubricant order', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, NULL, 150000.00, NULL, NULL, NULL, NULL),
('2022-05-02', 'Invoice', 'CUST-111', 'IN-2022-010', ' ', 'Akij Motors', 'AC-CORP', 'Corporate Accounts', 15, 2, 'AR-IN', 'IN-2022-010', 'Automotive lubricants shipment', NULL, NULL, 550000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-05-06', 'Apply Document', 'CUST-111', 'AP-2022-002', 'IN-2022-010', 'Akij Motors', 'AC-CORP', 'Corporate Accounts', 16, 2, 'AR-AD', 'IN-2022-010', 'Set off advance to IN-010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150000.00, NULL, NULL),
('2022-05-10', 'Receipt', 'CUST-110', 'OR-2022-009', 'IN-2022-009', 'Hamdard Laboratories', 'AC-COMM', 'Commercial Accounts', 17, 1, 'AR-PY', 'IN-2022-009', 'EFT payment Hamdard', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 190000.00, NULL, NULL, NULL, NULL, NULL),
('2022-05-15', 'Receipt', 'CUST-111', 'OR-2022-010', 'IN-2022-010', 'Akij Motors', 'AC-CORP', 'Corporate Accounts', 17, 2, 'AR-PY', 'IN-2022-010', 'Balance settlement Akij', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 400000.00, NULL, NULL, NULL, NULL, NULL),
('2022-05-19', 'Invoice', 'CUST-112', 'IN-2022-011', ' ', 'Nitol Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 18, 1, 'AR-IN', 'IN-2022-011', 'Commercial tyre batch', NULL, NULL, 680000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-05-23', 'Debit Note', 'CUST-112', 'DN-2022-002', 'IN-2022-011', 'Nitol Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 19, 1, 'AR-DN', 'IN-2022-011', 'Urgent delivery charge', NULL, NULL, NULL, 8000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-05-28', 'Receipt', 'CUST-112', 'OR-2022-011', 'IN-2022-011', 'Nitol Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 20, 1, 'AR-PY', 'IN-2022-011', 'Full payment Nitol', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 688000.00, NULL, NULL, NULL, NULL, NULL),
('2022-06-03', 'Invoice', 'CUST-113', 'IN-2022-012', ' ', 'Runner Automobiles', 'AC-CORP', 'Corporate Accounts', 18, 2, 'AR-IN', 'IN-2022-012', 'Motorcycle components', NULL, NULL, 410000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-06-08', 'Unapplied Cash', 'CUST-113', 'UC-2022-002', 'N/A', 'Runner Automobiles', 'AC-CORP', 'Corporate Accounts', 20, 2, 'AR-UC', 'UC-2022-002', 'Excess wire credit', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, NULL, NULL, 15000.00, NULL, NULL, NULL),
('2022-06-12', 'Receipt', 'CUST-113', 'OR-2022-012', 'IN-2022-012', 'Runner Automobiles', 'AC-CORP', 'Corporate Accounts', 21, 1, 'AR-PY', 'IN-2022-012', 'Settlement payment Runner', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 410000.00, NULL, NULL, NULL, NULL, NULL),
('2022-06-17', 'Invoice', 'CUST-114', 'IN-2022-013', ' ', 'Uttara Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 22, 1, 'AR-IN', 'IN-2022-013', 'Engine spare parts', NULL, NULL, 360000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-06-21', 'Credit Note', 'CUST-114', 'CR-2022-003', 'IN-2022-013', 'Uttara Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 19, 2, 'AR-CR', 'IN-2022-003', 'Promotional rebate', NULL, NULL, NULL, NULL, 12000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-06-25', 'Receipt', 'CUST-114', 'OR-2022-013', 'IN-2022-013', 'Uttara Motors Ltd.', 'AC-CORP', 'Corporate Accounts', 21, 2, 'AR-PY', 'IN-2022-013', 'Net payment Uttara', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 348000.00, NULL, NULL, NULL, NULL, NULL),
('2022-06-29', 'Write-Off', 'CUST-115', 'WO-2022-002', 'N/A', 'Chittagong Traders', 'AC-RTL', 'Retail Accounts', 23, 1, 'AR-WO', 'IN-2021-502', 'Old balance write-off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3800.00, NULL),

-- 2022 Quarter 3 (Jul - Sep 2022)
('2022-07-02', 'Invoice', 'CUST-116', 'IN-2022-014', ' ', 'Navana Group', 'AC-CORP', 'Corporate Accounts', 22, 2, 'AR-IN', 'IN-2022-014', 'Construction material batch', NULL, NULL, 580000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-07-06', 'Advance Receipt', 'CUST-117', 'AR-2022-003', 'AR-2022-003', 'Magura Group', 'AC-COMM', 'Commercial Accounts', 24, 1, 'AR-PI', 'AR-2022-003', 'Advance for paper supply', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 120000.00, NULL, NULL, NULL, NULL),
('2022-07-10', 'Receipt', 'CUST-116', 'OR-2022-014', 'IN-2022-014', 'Navana Group', 'AC-CORP', 'Corporate Accounts', 25, 1, 'AR-PY', 'IN-2022-014', 'Cheque clearing Navana', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 580000.00, NULL, NULL, NULL, NULL, NULL),
('2022-07-15', 'Invoice', 'CUST-117', 'IN-2022-015', ' ', 'Magura Group', 'AC-COMM', 'Commercial Accounts', 26, 1, 'AR-IN', 'IN-2022-015', 'Paper pulp shipment', NULL, NULL, 300000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-07-19', 'Apply Document', 'CUST-117', 'AP-2022-003', 'IN-2022-015', 'Magura Group', 'AC-COMM', 'Commercial Accounts', 24, 2, 'AR-AD', 'IN-2022-015', 'Set off advance IN-015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120000.00, NULL, NULL),
('2022-07-24', 'Receipt', 'CUST-117', 'OR-2022-015', 'IN-2022-015', 'Magura Group', 'AC-COMM', 'Commercial Accounts', 25, 2, 'AR-PY', 'IN-2022-015', 'Balance payment Magura', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 180000.00, NULL, NULL, NULL, NULL, NULL),
('2022-08-01', 'Invoice', 'CUST-118', 'IN-2022-016', ' ', 'Bashundhara Paper', 'AC-CORP', 'Corporate Accounts', 26, 2, 'AR-IN', 'IN-2022-016', 'Paper chemicals delivery', NULL, NULL, 790000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-08-05', 'Debit Note', 'CUST-118', 'DN-2022-003', 'IN-2022-016', 'Bashundhara Paper', 'AC-CORP', 'Corporate Accounts', 27, 1, 'AR-DN', 'IN-2022-016', 'Demurrage surcharge', NULL, NULL, NULL, 6000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-08-10', 'Receipt', 'CUST-118', 'OR-2022-016', 'IN-2022-016', 'Bashundhara Paper', 'AC-CORP', 'Corporate Accounts', 28, 1, 'AR-PY', 'IN-2022-016', 'Full payment Bashundhara', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 796000.00, NULL, NULL, NULL, NULL, NULL),
('2022-08-15', 'Invoice', 'CUST-119', 'IN-2022-017', ' ', 'Meghna Paper Mills', 'AC-COMM', 'Commercial Accounts', 29, 1, 'AR-IN', 'IN-2022-017', 'Packaging board reels', NULL, NULL, 380000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-08-19', 'Credit Note', 'CUST-119', 'CR-2022-004', 'IN-2022-017', 'Meghna Paper Mills', 'AC-COMM', 'Commercial Accounts', 27, 2, 'AR-CR', 'IN-2022-017', 'GSM rebate adjustment', NULL, NULL, NULL, NULL, 8000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-08-24', 'Receipt', 'CUST-119', 'OR-2022-017', 'IN-2022-017', 'Meghna Paper Mills', 'AC-COMM', 'Commercial Accounts', 28, 2, 'AR-PY', 'IN-2022-017', 'Net payment Meghna', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 372000.00, NULL, NULL, NULL, NULL, NULL),
('2022-09-01', 'Invoice', 'CUST-120', 'IN-2022-018', ' ', 'Hakkani Pulp & Paper', 'AC-COMM', 'Commercial Accounts', 29, 2, 'AR-IN', 'IN-2022-018', 'Tissue jumbo rolls', NULL, NULL, 240000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-09-05', 'Advance Receipt', 'CUST-120', 'AR-2022-004', 'AR-2022-004', 'Hakkani Pulp & Paper', 'AC-COMM', 'Commercial Accounts', 30, 1, 'AR-PI', 'AR-2022-004', 'Advance deposit Hakkani', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, NULL, 80000.00, NULL, NULL, NULL, NULL),
('2022-09-10', 'Apply Document', 'CUST-120', 'AP-2022-004', 'IN-2022-018', 'Hakkani Pulp & Paper', 'AC-COMM', 'Commercial Accounts', 30, 2, 'AR-AD', 'IN-2022-018', 'Set off advance IN-018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80000.00, NULL, NULL),
('2022-09-14', 'Receipt', 'CUST-120', 'OR-2022-018', 'IN-2022-018', 'Hakkani Pulp & Paper', 'AC-COMM', 'Commercial Accounts', 31, 1, 'AR-PY', 'IN-2022-018', 'Full balance Hakkani', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 160000.00, NULL, NULL, NULL, NULL, NULL),
('2022-09-18', 'Invoice', 'CUST-121', 'IN-2022-019', ' ', 'Sonali Paper Mills', 'AC-CORP', 'Corporate Accounts', 32, 1, 'AR-IN', 'IN-2022-019', 'Media paper stock delivery', NULL, NULL, 490000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-09-22', 'Unapplied Cash', 'CUST-121', 'UC-2022-003', 'N/A', 'Sonali Paper Mills', 'AC-CORP', 'Corporate Accounts', 31, 2, 'AR-UC', 'UC-2022-003', 'Unallocated bank credit', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, NULL, NULL, 10000.00, NULL, NULL, NULL),
('2022-09-26', 'Adjustment', 'CUST-121', 'AD-2022-002', 'IN-2022-019', 'Sonali Paper Mills', 'AC-CORP', 'Corporate Accounts', 33, 1, 'AR-AD', 'IN-2022-019', 'Tax deduction adjustment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500.00),
('2022-09-29', 'Receipt', 'CUST-121', 'OR-2022-019', 'IN-2022-019', 'Sonali Paper Mills', 'AC-CORP', 'Corporate Accounts', 34, 1, 'AR-PY', 'IN-2022-019', 'Net clearing Sonali', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 490500.00, NULL, NULL, NULL, NULL, NULL),

-- 2022 Quarter 4 (Oct - Dec 2022)
('2022-10-02', 'Invoice', 'CUST-122', 'IN-2022-020', ' ', 'Monno Ceramic Industries', 'AC-CORP', 'Corporate Accounts', 32, 2, 'AR-IN', 'IN-2022-020', 'Glazing clay materials', NULL, NULL, 420000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-10-06', 'Receipt', 'CUST-122', 'OR-2022-020', 'IN-2022-020', 'Monno Ceramic Industries', 'AC-CORP', 'Corporate Accounts', 34, 2, 'AR-PY', 'IN-2022-020', 'Full payment Monno', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 420000.00, NULL, NULL, NULL, NULL, NULL),
('2022-10-11', 'Invoice', 'CUST-123', 'IN-2022-021', ' ', 'Shinepukur Ceramics', 'AC-CORP', 'Corporate Accounts', 35, 1, 'AR-IN', 'IN-2022-021', 'Decal paper batch', NULL, NULL, 360000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-10-15', 'Credit Note', 'CUST-123', 'CR-2022-005', 'IN-2022-021', 'Shinepukur Ceramics', 'AC-CORP', 'Corporate Accounts', 33, 2, 'AR-CR', 'IN-2022-021', 'Transit damage allowance', NULL, NULL, NULL, NULL, 15000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-10-20', 'Receipt', 'CUST-123', 'OR-2022-021', 'IN-2022-021', 'Shinepukur Ceramics', 'AC-CORP', 'Corporate Accounts', 36, 1, 'AR-PY', 'IN-2022-021', 'Clearing Shinepukur post CR', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 345000.00, NULL, NULL, NULL, NULL, NULL),
('2022-10-25', 'Advance Receipt', 'CUST-124', 'AR-2022-005', 'AR-2022-005', 'RAK Ceramics BD', 'AC-CORP', 'Corporate Accounts', 37, 1, 'AR-PI', 'AR-2022-005', 'Advance for frit batch', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 200000.00, NULL, NULL, NULL, NULL),
('2022-11-01', 'Invoice', 'CUST-124', 'IN-2022-022', ' ', 'RAK Ceramics BD', 'AC-CORP', 'Corporate Accounts', 35, 2, 'AR-IN', 'IN-2022-022', 'Frit and pigment delivery', NULL, NULL, 710000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-11-05', 'Apply Document', 'CUST-124', 'AP-2022-005', 'IN-2022-022', 'RAK Ceramics BD', 'AC-CORP', 'Corporate Accounts', 37, 2, 'AR-AD', 'IN-2022-022', 'Set off advance RAK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200000.00, NULL, NULL),
('2022-11-10', 'Receipt', 'CUST-124', 'OR-2022-022', 'IN-2022-022', 'RAK Ceramics BD', 'AC-CORP', 'Corporate Accounts', 36, 2, 'AR-PY', 'IN-2022-022', 'Clear balance RAK', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 510000.00, NULL, NULL, NULL, NULL, NULL),
('2022-11-15', 'Invoice', 'CUST-125', 'IN-2022-023', ' ', 'Fu-Wang Ceramic', 'AC-COMM', 'Commercial Accounts', 38, 1, 'AR-IN', 'IN-2022-023', 'Feldspar powder supply', NULL, NULL, 410000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-11-19', 'Debit Note', 'CUST-125', 'DN-2022-004', 'IN-2022-023', 'Fu-Wang Ceramic', 'AC-COMM', 'Commercial Accounts', 39, 1, 'AR-DN', 'IN-2022-023', 'Special packing fee', NULL, NULL, NULL, 3500.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-11-24', 'Receipt', 'CUST-125', 'OR-2022-023', 'IN-2022-023', 'Fu-Wang Ceramic', 'AC-COMM', 'Commercial Accounts', 40, 1, 'AR-PY', 'IN-2022-023', 'Full clearing Fu-Wang', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 413500.00, NULL, NULL, NULL, NULL, NULL),
('2022-12-01', 'Invoice', 'CUST-126', 'IN-2022-024', ' ', 'Mir Ceramic Ltd.', 'AC-COMM', 'Commercial Accounts', 38, 2, 'AR-IN', 'IN-2022-024', 'Kiln furniture batch', NULL, NULL, 270000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-12-05', 'Receipt', 'CUST-126', 'OR-2022-024', 'IN-2022-024', 'Mir Ceramic Ltd.', 'AC-COMM', 'Commercial Accounts', 40, 2, 'AR-PY', 'IN-2022-024', 'Wire transfer Mir Ceramic', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, 270000.00, NULL, NULL, NULL, NULL, NULL),
('2022-12-09', 'Invoice', 'CUST-127', 'IN-2022-025', ' ', 'Marico Bangladesh', 'AC-CORP', 'Corporate Accounts', 41, 1, 'AR-IN', 'IN-2022-025', 'Coconut oil raw material', NULL, NULL, 750000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-12-12', 'Credit Note', 'CUST-127', 'CR-2022-006', 'IN-2022-025', 'Marico Bangladesh', 'AC-CORP', 'Corporate Accounts', 39, 2, 'AR-CR', 'IN-2022-025', 'Year-end volume rebate', NULL, NULL, NULL, NULL, 30000.00, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-12-16', 'Receipt', 'CUST-127', 'OR-2022-025', 'IN-2022-025', 'Marico Bangladesh', 'AC-CORP', 'Corporate Accounts', 42, 1, 'AR-PY', 'IN-2022-025', 'EFT clearing Marico', 'EBL', 'Eastern Bank Ltd', NULL, NULL, NULL, 720000.00, NULL, NULL, NULL, NULL, NULL),
('2022-12-18', 'Advance Receipt', 'CUST-128', 'AR-2022-006', 'AR-2022-006', 'Unilever Bangladesh', 'AC-CORP', 'Corporate Accounts', 43, 1, 'AR-PI', 'AR-2022-006', 'Advance for detergent batch', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, NULL, 400000.00, NULL, NULL, NULL, NULL),
('2022-12-20', 'Invoice', 'CUST-128', 'IN-2022-026', ' ', 'Unilever Bangladesh', 'AC-CORP', 'Corporate Accounts', 41, 2, 'AR-IN', 'IN-2022-026', 'Detergent raw materials', NULL, NULL, 1100000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-12-22', 'Apply Document', 'CUST-128', 'AP-2022-006', 'IN-2022-026', 'Unilever Bangladesh', 'AC-CORP', 'Corporate Accounts', 43, 2, 'AR-AD', 'IN-2022-026', 'Apply advance to IN-026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 400000.00, NULL, NULL),
('2022-12-24', 'Receipt', 'CUST-128', 'OR-2022-026', 'IN-2022-026', 'Unilever Bangladesh', 'AC-CORP', 'Corporate Accounts', 42, 2, 'AR-PY', 'IN-2022-026', 'Part payment Unilever', 'HSBC', 'HSBC Bangladesh', NULL, NULL, NULL, 500000.00, NULL, NULL, NULL, NULL, NULL),
('2022-12-26', 'Write-Off', 'CUST-129', 'WO-2022-003', 'N/A', 'Sylhet Mart', 'AC-RTL', 'Retail Accounts', 44, 1, 'AR-WO', 'IN-2021-102', 'Year-end bad debt write-off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7200.00, NULL),
('2022-12-28', 'Adjustment', 'CUST-128', 'AD-2022-003', 'IN-2022-026', 'Unilever Bangladesh', 'AC-CORP', 'Corporate Accounts', 44, 2, 'AR-AD', 'IN-2022-026', 'Tax deduction adjustment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5000.00),
('2022-12-29', 'Receipt', 'CUST-128', 'OR-2022-027', 'IN-2022-026', 'Unilever Bangladesh', 'AC-CORP', 'Corporate Accounts', 45, 1, 'AR-PY', 'IN-2022-026', 'Final settlement Unilever', 'CBL', 'City Bank Ltd', NULL, NULL, NULL, 195000.00, NULL, NULL, NULL, NULL, NULL),
('2022-12-30', 'Invoice', 'CUST-130', 'IN-2022-027', ' ', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 46, 1, 'AR-IN', 'IN-2022-027', 'Soap base noodles batch', NULL, NULL, 850000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-12-30', 'Unapplied Cash', 'CUST-130', 'UC-2022-004', 'N/A', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 45, 2, 'AR-UC', 'UC-2022-004', 'Year-end advance deposit', 'DBBL', 'Dutch-Bangla Bank', NULL, NULL, NULL, NULL, NULL, 50000.00, NULL, NULL, NULL),
('2022-12-31', 'Receipt', 'CUST-130', 'OR-2022-028', 'IN-2022-027', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 46, 2, 'AR-PY', 'IN-2022-027', 'Year-end closing payment', 'SCB', 'Standard Chartered Bank', NULL, NULL, NULL, 800000.00, NULL, NULL, NULL, NULL, NULL),
('2022-12-31', 'Debit Note', 'CUST-130', 'DN-2022-005', 'IN-2022-027', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 47, 1, 'AR-DN', 'IN-2022-027', 'Late payment interest', NULL, NULL, NULL, 5000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2022-12-31', 'Credit Note', 'CUST-130', 'CR-2022-007', 'IN-2022-027', 'Square Toiletries', 'AC-CORP', 'Corporate Accounts', 47, 2, 'AR-CR', 'IN-2022-027', 'Year-end rebate balance', NULL, NULL, NULL, NULL, 5000.00, NULL, NULL, NULL, NULL, NULL, NULL);
GO

-- ভিউতে (View) নতুন ২০২২ সালের ডাটা চেক করার জন্য কোয়েরি:
SELECT * FROM vw_AR_TRANSACTION
WHERE TransactionDate BETWEEN '2022-01-01' AND '2022-12-31'
ORDER BY [Customer ID], TransactionDate, [Batch Number], [Entry No];
GO


-- ৫. রেজাল্ট আউটপুট পরীক্ষা
SELECT * FROM vw_AR_TRANSACTION;