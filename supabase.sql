-- WebMaster Pro - Supabase Database Setup
-- יצירת טבלת אתרים עם כל הפרטים המקצועיים

CREATE TABLE websites (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT,
    price INTEGER,
    content TEXT,
    business_name TEXT,
    phone TEXT,
    email TEXT,
    address TEXT,
    whatsapp TEXT,
    primary_color TEXT DEFAULT '#4f46e5',
    secondary_color TEXT DEFAULT '#7c3aed',
    description TEXT,
    features TEXT[], -- רשימת תכונות
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- יצירת טבלת שינויים למעקב
CREATE TABLE website_changes (
    id SERIAL PRIMARY KEY,
    website_id TEXT REFERENCES websites(id),
    change_type TEXT,
    element_selector TEXT,
    old_value TEXT,
    new_value TEXT,
    user_id TEXT,
    timestamp TIMESTAMP DEFAULT NOW()
);

-- יצירת טבלת הגדרות מערכת
CREATE TABLE system_settings (
    id SERIAL PRIMARY KEY,
    setting_key TEXT UNIQUE NOT NULL,
    setting_value TEXT,
    description TEXT,
    updated_at TIMESTAMP DEFAULT NOW()
);

-- הכנסת 11 האתרים המקצועיים עם כל הפרטים
INSERT INTO websites (id, name, category, price, business_name, phone, email, address, description, features) VALUES
('dr-michal-rosen', 'ד"ר מיכל רוזן - רפואה אסתטית', 'רפואה', 2800, 'ד"ר מיכל רוזן', '052-1234567', 'info@dr-michal-rosen.co.il', 'רחוב הרצל 45, תל אביב', 'מומחית ברפואה אסתטית ובטיפולי יופי מתקדמים', ARRAY['בוטוקס', 'חומצה היאלורונית', 'לייזר', 'פילינג כימי']),

('fitness-coach', 'דני פיט - מאמן כושר', 'ספורט', 2200, 'דני פיט', '054-1234567', 'danny@fitness.co.il', 'מכון כושר פרמיום, תל אביב', 'מאמן כושר אישי - הגשמת חלומות הכושר שלך', ARRAY['אימונים אישיים', 'תוכניות אימון', 'ייעוץ תזונה', 'מעקב התקדמות']),

('yoga-studio', 'סטודיו אוהם - יוגה ומדיטציה', 'בריאות', 1900, 'סטודיו אוהם', '052-3456789', 'info@yoga-studio.co.il', 'רחוב שלום עליכם 15, תל אביב', 'מרחב של שלווה, איזון ותנועה מודעת', ARRAY['האטה יוגה', 'וינייסה פלו', 'מדיטציה', 'שיעורים פרטיים']),

('nutritionist', 'ד"ר שרה כהן - תזונאית קלינית', 'בריאות', 2400, 'ד"ר שרה כהן', '052-4567890', 'info@nutritionist.co.il', 'רמת השרון', 'תזונאית קלינית מוסמכת - דרכך לאורח חיים בריא', ARRAY['ייעוץ תזונתי אישי', 'ירידה במשקל', 'תפריטים בריאים', 'מעקב תזונתי']),

('law-firm', 'משרד ברקוביץ - עורכי דין', 'משפטי', 2500, 'משרד ברקוביץ', '052-5678901', 'info@law-firm.co.il', 'רחוב רוטשילד 15, תל אביב', 'עורכי דין מובילים עם ניסיון רב בכל תחומי המשפט', ARRAY['דיני משפחה', 'דיני עבודה', 'דיני נדלן', 'ייעוץ משפטי']),

('accountant', 'רינה לוי - חשבת שכר', 'חשבונאות', 2000, 'רינה לוי', '08-9998887', 'rina@payroll.co.il', 'רחוב העסקים 234, באר שבע', 'חשבת שכר מוסמכת עם התמחות בחברות הייטק', ARRAY['חישוב שכר חודשי', 'דוחות שכר', 'ביטוח לאומי', 'ייעוץ פנסיוני']),

('beauty-salon', 'מספרה BELLA - יופי', 'יופי', 1700, 'מספרה BELLA', '054-7890123', 'info@bella-salon.co.il', 'רחוב הנחל 88, חיפה', 'המקום שבו יופי פוגש מקצועיות', ARRAY['תספורת ועיצוב', 'צביעה והבהרה', 'מניקור ופדיקור', 'טיפולי פנים']),

('tutor', 'ד"ר רונית לוי - מורה פרטית', 'חינוך', 2100, 'ד"ר רונית לוי', '052-8901234', 'ronit@tutor.co.il', 'רחוב הרצל 3, ירושלים', 'מורה פרטית למתמטיקה, פיזיקה ואנגלית - הצלחה מובטחת', ARRAY['מתמטיקה', 'פיזיקה', 'אנגלית', 'הכנה לבגרות']),

('aesthetic-clinic', 'קליניקת יופי פרמיום', 'אסתטיקה', 3200, 'קליניקת יופי פרמיום', '052-0000000', 'info@premium-clinic.co.il', 'מגדל עזריאלי, תל אביב', 'מרכז רפואה אסתטית מתקדמת לחידוש העור והיופי הטבעי', ARRAY['בוטוקס פרמיום', 'לייזר פרקציונלי', 'פילינג יהלום', 'טיפולי היפו']),

('multibrawn', 'מולטיבראון - נופש ואירועים', 'נופש', 2300, 'מולטיבראון', '052-1111111', 'info@multibrawn.co.il', 'רחוב הירקון 100, תל אביב', 'חברה מובילה בתחום הנופש והאירועים עם שירות VIP ויעדים יוקרתיים', ARRAY['נופש יוקרתי', 'ארגון אירועים', 'חבילות VIP', 'יעדים בינלאומיים']),

('real-estate', 'נדל"ן פרמיום', 'נדלן', 2700, 'נדל"ן פרמיום', '052-2222222', 'info@real-estate-premium.co.il', 'רחוב רוטשילד 50, תל אביב', 'חברת נדל"ן מובילה המתמחה בנכסי פרמיום ויוקרה באזורי הביקוש', ARRAY['נכסי יוקרה', 'ייעוץ השקעות', 'הערכות נכסים', 'ליווי משפטי']);

-- הגדרת הרשאות
ALTER TABLE websites ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Enable all operations" ON websites FOR ALL USING (true);

ALTER TABLE website_changes ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Enable all operations" ON website_changes FOR ALL USING (true);

ALTER TABLE system_settings ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Enable all operations" ON system_settings FOR ALL USING (true);

-- הכנסת הגדרות בסיסיות
INSERT INTO system_settings (setting_key, setting_value, description) VALUES
('site_title', 'WebMaster Pro', 'כותרת האתר הראשית'),
('contact_email', 'info@webmaster-pro.co.il', 'אימייל ליצירת קשר'),
('business_phone', '052-1234567', 'טלפון עסקי'),
('total_value', '26900', 'ערך כולל של כל האתרים'),
('website_count', '11', 'מספר אתרים במערכת'),
('last_updated', NOW()::TEXT, 'זמן עדכון אחרון');
