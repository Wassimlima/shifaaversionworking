USE shifaa_dizad;

INSERT INTO pharmacies (name, address, wilaya, city, phone, rating, review_count, is_open, plan) VALUES
('صيدلية الأمل', '12 شارع العربي بن مهيدي', 'الجزائر', 'الجزائر العاصمة', '0550000001', 4.8, 120, 1, 'professional'),
('صيدلية النور', '5 طريق الاستقلال', 'الجزائر', 'باب الوادي', '0550000002', 4.5, 85, 1, 'free'),
('صيدلية الشفاء', '23 شارع الثورة', 'وهران', 'وهران', '0550000003', 4.7, 200, 1, 'professional'),
('صيدلية الرحمة', '8 حي المرادية', 'قسنطينة', 'قسنطينة', '0550000004', 4.3, 60, 0, 'free'),
('صيدلية الصحة', '31 شارع ابن خلدون', 'عنابة', 'عنابة', '0550000005', 4.6, 150, 1, 'enterprise'),
('صيدلية الهلال الأحمر', '4 شارع دحلب', 'البليدة', 'البليدة', '0550000006', 4.9, 300, 1, 'professional'),
('صيدلية السلامة', '15 ساحة الشهداء', 'تيزي وزو', 'تيزي وزو', '0550000007', 4.4, 75, 1, 'free'),
('صيدلية الحياة', '7 شارع أول نوفمبر', 'سطيف', 'سطيف', '0550000008', 4.7, 180, 1, 'professional'),
('صيدلية الجزائر', '20 شارع زيغود يوسف', 'الجزائر', 'حسين داي', '0550000009', 4.5, 90, 1, 'free'),
('صيدلية الوفاء', '3 طريق اوحيل', 'تلمسان', 'تلمسان', '0550000010', 4.6, 110, 1, 'free');

INSERT INTO medicines (name, name_ar, active_ingredient, type, pharmacy_id, wilaya, city, availability, quantity, rating) VALUES
('Doliprane 1000mg', 'دولبران 1000 ملغ', 'Paracetamol', 'medicine', 1, 'الجزائر', 'الجزائر العاصمة', 'available', 150, 4.8),
('Ventoline 100mcg', 'فانتولين', 'Salbutamol', 'medicine', 1, 'الجزائر', 'الجزائر العاصمة', 'limited', 12, 4.7),
('Amoxicilline 500mg', 'أموكسيسيلين', 'Amoxicillin', 'medicine', 2, 'الجزائر', 'باب الوادي', 'available', 80, 4.5),
('Insuline Glargine', 'أنسولين', 'Insulin Glargine', 'medicine', 3, 'وهران', 'وهران', 'limited', 5, 4.9),
('Metformine 850mg', 'ميتفورمين', 'Metformin', 'medicine', 4, 'قسنطينة', 'قسنطينة', 'available', 200, 4.3),
('Oméprazole 20mg', 'أوميبرازول', 'Omeprazole', 'medicine', 5, 'عنابة', 'عنابة', 'available', 90, 4.6),
('Ibuprofène 400mg', 'إيبوبروفين', 'Ibuprofen', 'medicine', 6, 'البليدة', 'البليدة', 'available', 300, 4.7),
('Augmentin 1g', 'أوغمانتين', 'Amoxicillin+Clavulanate', 'medicine', 7, 'تيزي وزو', 'تيزي وزو', 'limited', 8, 4.8),
('Bisoprolol 5mg', 'بيسوبرولول', 'Bisoprolol', 'medicine', 8, 'سطيف', 'سطيف', 'available', 60, 4.4),
('Loratadine 10mg', 'لوراتادين', 'Loratadine', 'medicine', 9, 'الجزائر', 'حسين داي', 'unavailable', 0, 4.5);

INSERT INTO categories (name_ar, name_en, icon, color, product_count, slug) VALUES
('الأدوية العامة', 'General Medicines', '💊', '#0ea5e9', 245, 'general'),
('الأجهزة الطبية', 'Medical Devices', '🩺', '#16a34a', 89, 'devices'),
('شبه صيدلاني', 'Parapharmacy', '🧴', '#d97706', 156, 'parapharmacy'),
('طوارئ', 'Emergency', '🚑', '#dc2626', 34, 'emergency'),
('الاحتياجات الخاصة', 'Special Needs', '♿', '#7c3aed', 67, 'special-needs'),
('العناية المنزلية', 'Home Care', '🏠', '#0891b2', 112, 'home-care');

INSERT INTO donations (item_name, item_name_ar, description, wilaya, city, donor_name, `condition`, category) VALUES
('Wheelchair', 'كرسي متحرك', 'كرسي متحرك بحالة جيدة، استعمال خفيف', 'الجزائر', 'الجزائر العاصمة', 'محمد بن علي', 'good', 'special_needs'),
('Crutches', 'عكازات', 'عكازات طبية لم تستعمل', 'وهران', 'وهران', 'فاطمة زهراء', 'new', 'special_needs'),
('Blood Pressure Monitor', 'جهاز قياس الضغط', 'جهاز قياس الضغط الرقمي', 'قسنطينة', 'قسنطينة', 'أحمد كريم', 'good', 'device'),
('Nebulizer', 'جهاز البخار', 'جهاز استنشاق للأطفال بحالة ممتازة', 'عنابة', 'عنابة', 'سارة حداد', 'new', 'device'),
('Walker', 'واكر طبي', 'واكر للمساعدة على المشي', 'البليدة', 'البليدة', 'يوسف مقداد', 'fair', 'special_needs'),
('Medicines Lot', 'تشكيلة أدوية', 'مجموعة أدوية متنوعة صالحة للاستعمال', 'الجزائر', 'حسين داي', 'خديجة بوعلام', 'good', 'medicine');

INSERT INTO inventory (pharmacy_id, product_name, quantity, status, price, category) VALUES
(1, 'Doliprane 1000mg', 45, 'available', 180, 'medicine'),
(1, 'Ventoline 100mcg', 8, 'limited', 320, 'medicine'),
(1, 'Insuline Glargine', 3, 'limited', 2500, 'medicine'),
(1, 'Amoxicilline 500mg', 60, 'available', 420, 'medicine'),
(1, 'Oméprazole 20mg', 0, 'unavailable', 280, 'medicine'),
(1, 'Metformine 850mg', 35, 'available', 160, 'medicine'),
(1, 'Ibuprofène 400mg', 25, 'available', 200, 'medicine'),
(1, 'Loratadine 10mg', 5, 'limited', 350, 'medicine');

INSERT INTO med_reps (name, region, email, phone) VALUES
('كريم بن صالح', 'الجزائر العاصمة - البليدة - تيبازة', 'karim.ben@medpharm.dz', '0770 123 456'),
('أمين حداد', 'وهران - مستغانم - تلمسان', 'amin.haddad@pharma.dz', '0555123456'),
('سارة بن عمر', 'قسنطينة - عنابة - سكيكدة', 'sara.benomar@pharma.dz', '0666789012');

INSERT INTO rep_products (rep_id, name, total_stock, low_stock_pharmacies, status) VALUES
(1, 'Doliprane 1000mg', 450, 2, 'warning'),
(1, 'Ventoline 100mcg', 120, 5, 'critical'),
(1, 'Metformine 850mg', 280, 1, 'good'),
(1, 'Loratadine 10mg', 190, 3, 'warning'),
(2, 'Amoxicilline 500mg', 250, 3, 'warning'),
(2, 'Oméprazole 20mg', 15, 4, 'critical'),
(3, 'Insuline Glargine', 45, 0, 'good');

INSERT INTO rep_alerts (rep_id, pharmacy_name, pharmacy_id, pharmacy_phone, product_name, remaining_stock, severity) VALUES
(1, 'صيدلية النور', 2, '0550000002', 'Ventoline 100mcg', 2, 'high'),
(1, 'صيدلية الرحمة', 4, '0550000004', 'Doliprane 1000mg', 5, 'high'),
(1, 'صيدلية الصحة', 5, '0550000005', 'Loratadine 10mg', 3, 'medium'),
(1, 'صيدلية الحياة', 8, '0550000008', 'Metformine 850mg', 8, 'low'),
(2, 'صيدلية الأمل', 1, '0550000001', 'Doliprane 1000mg', 3, 'high'),
(2, 'صيدلية الشفاء', 3, '0550000003', 'Oméprazole 20mg', 0, 'high');

INSERT INTO partnership_requests (rep_id, pharmacy_id, status, message) VALUES
(1, 1, 'accepted', 'أرغب في متابعة مخزون منتجاتي في صيدليتكم'),
(1, 6, 'accepted', 'شراكة استراتيجية لتحسين التموين'),
(1, 2, 'pending', 'أرغب في التعاون معكم لتحسين توفر منتجاتنا'),
(2, 1, 'pending', 'مرحباً، أنا مندوب شركة النور للأدوية. أرغب في متابعة مخزون منتجاتنا لديكم وتحسين التموين.'),
(3, 1, 'pending', 'أنا مندوب الجزائر للصيدلانيات. لدينا خط منتجات جديد ونريد التعاون معكم.'),
(1, 4, 'revoked', NULL);

INSERT INTO resupply_requests (rep_id, pharmacy_id, product_name, requested_quantity, message, status) VALUES
(1, 1, 'Doliprane 1000mg', 50, 'نفذت الكمية بسرعة. يرجى إعادة التموين في أقرب وقت.', 'pending'),
(1, 6, 'Ventoline 100mcg', 20, NULL, 'confirmed'),
(1, 1, 'Insuline Glargine', 10, 'منتج حساس — يرجى التخزين في الثلاجة.', 'sent');

INSERT INTO labs (name, name_ar, address, wilaya, city, phone, is_open, opening_hours, maps_link, rating, review_count) VALUES
('Laboratoire Central Alger', 'مخبر الجزائر المركزي', '5 شارع ديدوش مراد', 'الجزائر', 'الجزائر العاصمة', '0550100001', 1, '07:00 - 18:00', 'https://maps.google.com/?q=Alger+Centre', 4.7, 320),
('Laboratoire El Shifa', 'مخبر الشفاء', '12 شارع الثورة', 'وهران', 'وهران', '0550100002', 1, '07:30 - 17:30', 'https://maps.google.com/?q=Oran+Labo', 4.5, 180),
('Laboratoire Ibn Sina', 'مخبر ابن سينا', '8 شارع زيغود يوسف', 'قسنطينة', 'قسنطينة', '0550100003', 0, '08:00 - 17:00', 'https://maps.google.com/?q=Constantine+Labo', 4.3, 95),
('BioLab Annaba', 'مخبر بيولاب عنابة', '3 شارع ابن خلدون', 'عنابة', 'عنابة', '0550100004', 1, '07:00 - 19:00', 'https://maps.google.com/?q=Annaba+Labo', 4.6, 210),
('Laboratoire Tizi Ouzou', 'مخبر تيزي وزو', '20 شارع أول نوفمبر', 'تيزي وزو', 'تيزي وزو', '0550100005', 1, '07:30 - 17:00', 'https://maps.google.com/?q=Tizi+Ouzou+Labo', 4.4, 140);

INSERT INTO lab_analyses (lab_id, name, name_ar, category, price, preparation_time, description) VALUES
(1, 'NFS (Numération Formule Sanguine)', 'تعداد الدم الكامل', 'hematologie', 600, 'فوري - نتيجة خلال ساعة', 'يقيس خلايا الدم الحمراء والبيضاء والصفائح الدموية'),
(1, 'Glycémie à jeun', 'سكر الدم على الريق', 'biochimie', 300, 'فوري', 'قياس مستوى السكر في الدم بعد الصيام'),
(1, 'Bilan hépatique complet', 'بيلان الكبد الكامل', 'biochimie', 1200, 'نتيجة خلال 24 ساعة', 'تقييم وظائف الكبد'),
(1, 'Bilan rénal', 'بيلان الكلى', 'biochimie', 900, 'نتيجة خلال 4 ساعات', 'تقييم وظائف الكلى: urée، créatinine، acide urique'),
(1, 'TSH (Thyroïde)', 'هرمون الغدة الدرقية', 'hormonologie', 1500, 'نتيجة خلال 24 ساعة', 'قياس هرمون TSH للكشف عن اضطرابات الغدة الدرقية'),
(2, 'NFS (Numération Formule Sanguine)', 'تعداد الدم الكامل', 'hematologie', 550, 'فوري - نتيجة خلال ساعة', 'يقيس خلايا الدم الحمراء والبيضاء والصفائح الدموية'),
(2, 'Glycémie à jeun', 'سكر الدم على الريق', 'biochimie', 280, 'فوري', 'قياس مستوى السكر في الدم بعد الصيام'),
(2, 'Bilan lipidique', 'بيلان الدهون', 'biochimie', 1100, 'نتيجة خلال 24 ساعة', 'كوليسترول كامل، HDL، LDL، الدهون الثلاثية'),
(2, 'ECBU (Examen Cytobactériologique des Urines)', 'تحليل البول البكتيري', 'microbiologie', 800, 'نتيجة خلال 48-72 ساعة', 'الكشف عن عدوى الجهاز البولي'),
(3, 'Glycémie à jeun', 'سكر الدم على الريق', 'biochimie', 300, 'فوري', 'قياس مستوى السكر في الدم بعد الصيام'),
(3, 'HbA1c (Hémoglobine glyquée)', 'الهيموغلوبين السكري', 'biochimie', 1200, 'نتيجة خلال 4 ساعات', 'يعكس متوسط السكر خلال الأشهر الثلاثة الماضية'),
(4, 'NFS (Numération Formule Sanguine)', 'تعداد الدم الكامل', 'hematologie', 580, 'فوري - نتيجة خلال ساعة', 'يقيس خلايا الدم الحمراء والبيضاء والصفائح الدموية'),
(4, 'CRP (Protéine C Réactive)', 'بروتين سي التفاعلي', 'immunologie', 700, 'فوري', 'مؤشر الالتهاب في الجسم'),
(4, 'Bilan lipidique', 'بيلان الدهون', 'biochimie', 1050, 'نتيجة خلال 24 ساعة', 'كوليسترول كامل، HDL، LDL، الدهون الثلاثية'),
(5, 'NFS (Numération Formule Sanguine)', 'تعداد الدم الكامل', 'hematologie', 600, 'فوري - نتيجة خلال ساعة', 'يقيس خلايا الدم الحمراء والبيضاء والصفائح الدموية'),
(5, 'Groupage sanguin', 'تحديد فصيلة الدم', 'hematologie', 400, 'فوري', 'تحديد فصيلة الدم ABO و Rhésus');
