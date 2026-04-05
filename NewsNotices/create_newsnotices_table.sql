-- =============================================
-- Hamro Ward — NewsNotices Table
-- Run this once in your SQL Server database
-- =============================================

CREATE TABLE NewsNotices (
    Id               INT IDENTITY(1,1) PRIMARY KEY,
    Title            NVARCHAR(300)  NOT NULL,
    ShortDescription NVARCHAR(500)  NOT NULL,
    FullDescription  NVARCHAR(MAX)  NULL,         -- used on a detail page
    Category         NVARCHAR(20)   NOT NULL       -- 'News' | 'Notice' | 'Event'
                         CHECK (Category IN ('News', 'Notice', 'Event')),
    PublishedDate    DATETIME       NOT NULL DEFAULT GETDATE(),
    IsActive         BIT            NOT NULL DEFAULT 1,  -- 0 = soft-deleted / hidden
    CreatedAt        DATETIME       NOT NULL DEFAULT GETDATE()
);

-- ── Index for fast filtering by category ──
CREATE INDEX IX_NewsNotices_Category ON NewsNotices (Category);

-- ── Index for latest-first ordering ──
CREATE INDEX IX_NewsNotices_PublishedDate ON NewsNotices (PublishedDate DESC);


-- =============================================
-- Sample Data (delete when going live)
-- =============================================

INSERT INTO NewsNotices (Title, ShortDescription, Category, PublishedDate) VALUES
(
    N'वडा स्तरीय स्वास्थ्य शिविर संचालन सम्बन्धी सूचना',
    N'यस वडा कार्यालयको आयोजनामा मिति २०८०/१०/१५ गते निःशुल्क स्वास्थ्य शिविर सञ्चालन गरिनेछ।',
    'Notice',
    '2024-01-13'
),
(
    N'Ward-Level Health Camp Notice',
    N'A free health camp will be conducted on 2024-01-15. All citizens are requested to attend.',
    'News',
    '2024-01-12'
),
(
    N'नागरिकता सिफारिस सम्बन्धी सूचना',
    N'नागरिकता सिफारिसका लागि आवश्यक कागजात साथमा ल्याउनुहोस्।',
    'Notice',
    '2024-01-11'
),
(
    N'सामाजिक सुरक्षा भत्ता वितरण',
    N'सामाजिक सुरक्षा भत्ता वितरण मिति २०८०/१०/१२ गते हुनेछ।',
    'Event',
    '2024-01-10'
),
(
    N'कर तिर्न बाँकी रहेका नागरिकहरुलाई सूचना',
    N'घर जग्गा सम्बन्धी कर समयमै तिर्नुहोस्।',
    'Notice',
    '2024-01-09'
),
(
    N'जेष्ठ नागरिक परिचयपत्र वितरण',
    N'परिचयपत्र वितरण कार्यक्रम वडा कार्यालयमा हुनेछ।',
    'Event',
    '2024-01-08'
),
(
    N'खानेपानी महसुल सम्बन्धी सूचना',
    N'खानेपानी सेवा सम्बन्धी महसुल समयमै तिर्न अनुरोध।',
    'Notice',
    '2024-01-07'
),
(
    N'वडा सभा आयोजना सम्बन्धी सूचना',
    N'वडा सभा मिति २०८०/१०/०८ गते बस्नेछ।',
    'Event',
    '2024-01-06'
);
