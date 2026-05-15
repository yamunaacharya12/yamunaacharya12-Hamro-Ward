-- ============================================================
--  HAMRO WARD DATABASE SETUP SCRIPT
--  Ward No. 4, Kathmandu — Admin Panel Tables
--  Run this in SQL Server Management Studio (SSMS)
-- ============================================================

USE HamroWardDB;
GO

-- ── 1. ADMINS (login table) ──────────────────────────────────
CREATE TABLE Admins (
    AdminID       INT IDENTITY(1,1) PRIMARY KEY,
    FullName      NVARCHAR(100)  NOT NULL,
    Email         NVARCHAR(150)  NOT NULL UNIQUE,
    PasswordHash  NVARCHAR(256)  NOT NULL,   -- store BCrypt hash, never plaintext
    Role          NVARCHAR(50)   NOT NULL DEFAULT 'Staff',
                                 -- 'SuperAdmin' | 'WardAdmin' | 'Staff'
    WardNo        INT            NOT NULL DEFAULT 4,
    IsActive      BIT            NOT NULL DEFAULT 1,
    CreatedDate   DATETIME       NOT NULL DEFAULT GETDATE(),
    LastLogin     DATETIME       NULL
);
GO

-- ── 2. CITIZENS ─────────────────────────────────────────────
CREATE TABLE Citizens (
    CitizenID     INT IDENTITY(1,1) PRIMARY KEY,
    FullName      NVARCHAR(150)  NOT NULL,
    FullNameNep   NVARCHAR(150)  NULL,        -- Devanagari name
    Phone         NVARCHAR(20)   NOT NULL UNIQUE,
    Email         NVARCHAR(150)  NULL,
    DateOfBirth   DATE           NULL,
    Gender        NVARCHAR(10)   NULL,
    WardNo        INT            NOT NULL DEFAULT 4,
    ToleName      NVARCHAR(100)  NULL,        -- local area name
    PasswordHash  NVARCHAR(256)  NOT NULL,
    IsVerified    BIT            NOT NULL DEFAULT 0,
    RegisteredDate DATETIME      NOT NULL DEFAULT GETDATE()
);
GO

-- ── 3. APPLICATIONS ─────────────────────────────────────────
CREATE TABLE Applications (
    ApplicationID   INT IDENTITY(1,1) PRIMARY KEY,
    CitizenID       INT            NOT NULL REFERENCES Citizens(CitizenID),
    CitizenName     NVARCHAR(150)  NOT NULL,   -- denormalised for quick display
    ServiceType     NVARCHAR(100)  NOT NULL,
                    -- 'Birth Registration' | 'Death Registration'
                    -- 'Citizenship' | 'Migration' | 'Property Tax'
                    -- 'Business Registration' | 'Address Verification'
    Status          NVARCHAR(30)   NOT NULL DEFAULT 'Pending',
                    -- 'Pending' | 'Under Review' | 'Approved' | 'Rejected'
    WardNo          INT            NOT NULL DEFAULT 4,
    SubmittedDate   DATETIME       NOT NULL DEFAULT GETDATE(),
    UpdatedDate     DATETIME       NULL,
    UpdatedBy       INT            NULL REFERENCES Admins(AdminID),
    Remarks         NVARCHAR(500)  NULL,
    DocumentPath    NVARCHAR(500)  NULL        -- path to uploaded scanned docs
);
GO

-- ── 4. BIRTH REGISTRATION DETAILS ───────────────────────────
CREATE TABLE BirthRegistrations (
    RegID           INT IDENTITY(1,1) PRIMARY KEY,
    ApplicationID   INT            NOT NULL REFERENCES Applications(ApplicationID),
    ChildName       NVARCHAR(150)  NOT NULL,
    ChildNameNep    NVARCHAR(150)  NULL,
    DateOfBirth     DATE           NOT NULL,
    PlaceOfBirth    NVARCHAR(200)  NOT NULL,
    Gender          NVARCHAR(10)   NOT NULL,
    FatherName      NVARCHAR(150)  NOT NULL,
    MotherName      NVARCHAR(150)  NOT NULL,
    FatherCitizenNo NVARCHAR(50)   NULL,
    MotherCitizenNo NVARCHAR(50)   NULL,
    CertificateNo   NVARCHAR(50)   NULL,       -- filled after approval
    IssuedDate      DATE           NULL
);
GO

-- ── 5. DEATH REGISTRATION DETAILS ───────────────────────────
CREATE TABLE DeathRegistrations (
    RegID           INT IDENTITY(1,1) PRIMARY KEY,
    ApplicationID   INT            NOT NULL REFERENCES Applications(ApplicationID),
    DeceasedName    NVARCHAR(150)  NOT NULL,
    DateOfDeath     DATE           NOT NULL,
    PlaceOfDeath    NVARCHAR(200)  NOT NULL,
    CauseOfDeath    NVARCHAR(200)  NULL,
    ReporterName    NVARCHAR(150)  NOT NULL,
    ReporterRelation NVARCHAR(50)  NOT NULL,
    CertificateNo   NVARCHAR(50)   NULL,
    IssuedDate      DATE           NULL
);
GO

-- ── 6. CITIZENSHIP DETAILS ──────────────────────────────────
CREATE TABLE CitizenshipApplications (
    AppDetailID     INT IDENTITY(1,1) PRIMARY KEY,
    ApplicationID   INT            NOT NULL REFERENCES Applications(ApplicationID),
    ApplicantName   NVARCHAR(150)  NOT NULL,
    DOB             DATE           NOT NULL,
    BirthDistrict   NVARCHAR(100)  NOT NULL,
    FatherName      NVARCHAR(150)  NOT NULL,
    MotherName      NVARCHAR(150)  NOT NULL,
    PermanentAddress NVARCHAR(300) NOT NULL,
    CitizenshipType NVARCHAR(50)   NOT NULL DEFAULT 'Descent',
                    -- 'Descent' | 'Birth' | 'Naturalisation'
    RecommendationNo NVARCHAR(50)  NULL,
    IssuedDate      DATE           NULL
);
GO

-- ── 7. MIGRATION REGISTRATION ───────────────────────────────
CREATE TABLE MigrationRegistrations (
    RegID           INT IDENTITY(1,1) PRIMARY KEY,
    ApplicationID   INT            NOT NULL REFERENCES Applications(ApplicationID),
    MigrationType   NVARCHAR(20)   NOT NULL,   -- 'In' | 'Out'
    FromAddress     NVARCHAR(300)  NULL,
    ToAddress       NVARCHAR(300)  NULL,
    FamilyMembers   INT            NOT NULL DEFAULT 1,
    MigrationDate   DATE           NOT NULL,
    Reason          NVARCHAR(300)  NULL
);
GO

-- ── 8. PROPERTY TAX ─────────────────────────────────────────
CREATE TABLE PropertyTaxPayments (
    PaymentID       INT IDENTITY(1,1) PRIMARY KEY,
    CitizenID       INT            NOT NULL REFERENCES Citizens(CitizenID),
    ApplicationID   INT            NULL REFERENCES Applications(ApplicationID),
    PropertyNo      NVARCHAR(50)   NOT NULL,
    PropertyAddress NVARCHAR(300)  NOT NULL,
    LandArea        DECIMAL(10,2)  NULL,        -- in Ropani or sqft
    TaxYear         INT            NOT NULL,
    TaxAmount       DECIMAL(12,2)  NOT NULL,
    PaidAmount      DECIMAL(12,2)  NULL,
    PaymentDate     DATETIME       NULL,
    PaymentMethod   NVARCHAR(50)   NULL,        -- 'Online' | 'Counter'
    ReceiptNo       NVARCHAR(50)   NULL,
    Status          NVARCHAR(20)   NOT NULL DEFAULT 'Unpaid'
                    -- 'Unpaid' | 'Paid' | 'Overdue'
);
GO

-- ── 9. NOTICE BOARD ─────────────────────────────────────────
CREATE TABLE Notices (
    NoticeID        INT IDENTITY(1,1) PRIMARY KEY,
    Title           NVARCHAR(300)  NOT NULL,
    Body            NVARCHAR(MAX)  NOT NULL,
    Category        NVARCHAR(50)   NOT NULL DEFAULT 'General',
                    -- 'General' | 'Service' | 'Holiday' | 'Tender' | 'Urgent'
    PublishedDate   DATETIME       NOT NULL DEFAULT GETDATE(),
    ExpiryDate      DATETIME       NULL,
    PublishedBy     INT            NOT NULL REFERENCES Admins(AdminID),
    IsActive        BIT            NOT NULL DEFAULT 1
);
GO

-- ── 10. COMPLAINTS ──────────────────────────────────────────
CREATE TABLE Complaints (
    ComplaintID     INT IDENTITY(1,1) PRIMARY KEY,
    CitizenID       INT            NOT NULL REFERENCES Citizens(CitizenID),
    Subject         NVARCHAR(200)  NOT NULL,
    Description     NVARCHAR(MAX)  NOT NULL,
    Category        NVARCHAR(50)   NULL,
    Status          NVARCHAR(30)   NOT NULL DEFAULT 'Open',
                    -- 'Open' | 'In Progress' | 'Resolved' | 'Closed'
    SubmittedDate   DATETIME       NOT NULL DEFAULT GETDATE(),
    ResolvedDate    DATETIME       NULL,
    AssignedTo      INT            NULL REFERENCES Admins(AdminID),
    Resolution      NVARCHAR(500)  NULL
);
GO

-- ── 11. ADMIN AUDIT LOG ─────────────────────────────────────
CREATE TABLE AdminLogs (
    LogID           INT IDENTITY(1,1) PRIMARY KEY,
    AdminID         INT            NOT NULL REFERENCES Admins(AdminID),
    ApplicationID   INT            NULL REFERENCES Applications(ApplicationID),
    Action          NVARCHAR(300)  NOT NULL,
    LogDate         DATETIME       NOT NULL DEFAULT GETDATE(),
    IPAddress       NVARCHAR(45)   NULL
);
GO

-- ============================================================
--  INDEXES for performance
-- ============================================================
CREATE INDEX IX_Apps_Status       ON Applications(Status);
CREATE INDEX IX_Apps_ServiceType  ON Applications(ServiceType);
CREATE INDEX IX_Apps_SubmittedDate ON Applications(SubmittedDate);
CREATE INDEX IX_Apps_CitizenID    ON Applications(CitizenID);
CREATE INDEX IX_Notices_Active    ON Notices(IsActive, PublishedDate DESC);
GO

-- ============================================================
--  SEED DATA — default SuperAdmin
--  Password below is BCrypt hash of 'Admin@1234'
--  Change immediately after first login!
-- ============================================================
INSERT INTO Admins (FullName, Email, PasswordHash, Role, WardNo)
VALUES (
    N'Ward Administrator',
    'admin@ward4.gov.np',
    '$2a$11$REPLACETHISWITHREALBCRYPTHASH',   -- ← replace with actual hash
    'SuperAdmin',
    4
);
GO

-- ============================================================
--  USEFUL VIEWS
-- ============================================================

-- Dashboard stats view
CREATE VIEW vw_DashboardStats AS
SELECT
    COUNT(*)                                                  AS TotalApplications,
    SUM(CASE WHEN Status = 'Pending'     THEN 1 ELSE 0 END)  AS PendingCount,
    SUM(CASE WHEN Status = 'Approved'
         AND CAST(UpdatedDate AS DATE) = CAST(GETDATE() AS DATE)
         THEN 1 ELSE 0 END)                                   AS ApprovedToday,
    SUM(CASE WHEN Status = 'Rejected'    THEN 1 ELSE 0 END)  AS RejectedCount
FROM Applications;
GO

-- Monthly service volume
CREATE VIEW vw_MonthlyServiceVolume AS
SELECT
    ServiceType,
    COUNT(*) AS Count,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS INT) AS Percentage
FROM Applications
WHERE MONTH(SubmittedDate) = MONTH(GETDATE())
  AND YEAR(SubmittedDate)  = YEAR(GETDATE())
GROUP BY ServiceType;
GO
