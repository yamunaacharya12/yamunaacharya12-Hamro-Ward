-- ============================================================
-- HamroWard - BirthApplications Table
-- Run this in SQL Server Management Studio
-- ============================================================

CREATE TABLE BirthApplications (
    ApplicationID       INT IDENTITY(1,1) PRIMARY KEY,
    TokenNumber         NVARCHAR(50)  NOT NULL UNIQUE,
    ServiceType         NVARCHAR(50)  NOT NULL,  -- 'New Birth Registration', 'Certified Copy', 'Correction', 'Late Registration', 'Transfer/Migration'
    Status              NVARCHAR(30)  NOT NULL DEFAULT 'Pending',

    -- Child Info
    ChildNameNep        NVARCHAR(200) NULL,
    ChildNameEng        NVARCHAR(200) NULL,
    DOBAD               DATE          NULL,
    DOBBS               NVARCHAR(20)  NULL,
    Gender              NVARCHAR(20)  NULL,
    BirthOrder          NVARCHAR(10)  NULL,

    -- Place of Birth
    Province            NVARCHAR(100) NULL,
    BirthDistrict       NVARCHAR(100) NULL,
    BirthMunicipality   NVARCHAR(200) NULL,
    BirthWardNo         INT           NULL,
    BirthPlaceType      NVARCHAR(50)  NULL,
    HospitalName        NVARCHAR(200) NULL,

    -- Parents
    FatherNameNep       NVARCHAR(200) NULL,
    FatherNameEng       NVARCHAR(200) NULL,
    FatherCitizenshipNo NVARCHAR(50)  NULL,
    FatherMobile        NVARCHAR(20)  NULL,
    MotherNameNep       NVARCHAR(200) NULL,
    MotherNameEng       NVARCHAR(200) NULL,
    MotherCitizenshipNo NVARCHAR(50)  NULL,
    MotherMobile        NVARCHAR(20)  NULL,

    -- Permanent Address
    District            NVARCHAR(100) NULL,
    Municipality        NVARCHAR(200) NULL,
    WardNo              INT           NULL,
    Tole                NVARCHAR(200) NULL,

    -- Certified Copy fields
    RegNo               NVARCHAR(50)  NULL,
    Mobile              NVARCHAR(20)  NULL,
    CopiesRequired      INT           NULL,
    Purpose             NVARCHAR(100) NULL,

    -- Correction fields
    CorrectionFields    NVARCHAR(500) NULL,
    CurrentValue        NVARCHAR(500) NULL,
    CorrectValue        NVARCHAR(500) NULL,
    Notes               NVARCHAR(MAX) NULL,

    -- Transfer/Migration fields
    OldDistrict         NVARCHAR(100) NULL,
    OldMunicipality     NVARCHAR(200) NULL,
    OldWardNo           INT           NULL,
    NewDistrict         NVARCHAR(100) NULL,
    NewMunicipality     NVARCHAR(200) NULL,
    NewWardNo           INT           NULL,

    -- Late Registration
    Reason              NVARCHAR(MAX) NULL,

    -- Admin / tracking
    Remarks             NVARCHAR(MAX) NULL,
    SubmittedDate       DATETIME      NOT NULL DEFAULT GETDATE(),
    LastUpdatedDate     DATETIME      NOT NULL DEFAULT GETDATE(),
    Step1Date           DATETIME      NULL,
    Step2Date           DATETIME      NULL,
    Step3Date           DATETIME      NULL
);
GO

CREATE TRIGGER trg_BirthStep1Date
ON BirthApplications
AFTER INSERT
AS
BEGIN
    UPDATE BirthApplications
    SET Step1Date = GETDATE()
    WHERE ApplicationID IN (SELECT ApplicationID FROM inserted);
END;
GO
