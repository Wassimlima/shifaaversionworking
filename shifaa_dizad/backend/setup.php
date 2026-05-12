<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
<meta charset="UTF-8">
<title>إعداد قاعدة البيانات — شفاء ديزاد</title>
<style>
  body { font-family: 'Segoe UI', sans-serif; max-width: 700px; margin: 2rem auto; padding: 1rem; background:#f8fafc; }
  h1 { color: #0ea5e9; }
  .step { background: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 1.25rem; margin-bottom: 1rem; }
  .step h2 { font-size: 1rem; margin-bottom: 0.5rem; color: #0f172a; }
  .ok  { color: #16a34a; font-weight: 700; }
  .err { color: #dc2626; font-weight: 700; }
  pre  { background: #1e293b; color: #e2e8f0; padding: 1rem; border-radius: 0.5rem; font-size: 0.85rem; overflow-x: auto; }
  .btn { display: inline-block; background: #0ea5e9; color: white; padding: 0.6rem 1.5rem; border-radius: 9999px; text-decoration: none; font-weight: 600; border: none; cursor: pointer; }
</style>
</head>
<body>
<h1>⚙️ إعداد قاعدة البيانات — شفاء ديزاد</h1>

<?php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'shifaa_dizad');

$run = isset($_POST['run']);
?>

<div class="step">
  <h2>الخطوة 1: اختبار الاتصال بـ MySQL</h2>
  <?php
  $conn = new mysqli(DB_HOST, DB_USER, DB_PASS);
  if ($conn->connect_error) {
    echo '<p class="err">✗ فشل الاتصال: ' . htmlspecialchars($conn->connect_error) . '</p>';
    echo '<p>تأكد من تشغيل WampServer وأن MySQL يعمل.</p>';
    die();
  } else {
    echo '<p class="ok">✓ تم الاتصال بـ MySQL بنجاح</p>';
  }
  ?>
</div>

<div class="step">
  <h2>الخطوة 2: إنشاء قاعدة البيانات والجداول</h2>
  <?php if (!$run): ?>
    <p>انقر على الزر أدناه لإنشاء قاعدة البيانات <strong>shifaa_dizad</strong> وكل الجداول وملئها بالبيانات التجريبية.</p>
    <form method="POST">
      <button type="submit" name="run" value="1" class="btn">🚀 إنشاء قاعدة البيانات الآن</button>
    </form>
  <?php else:
    $schema = file_get_contents(__DIR__ . '/database/schema.sql');
    $seed   = file_get_contents(__DIR__ . '/database/seed.sql');
    $conn->set_charset('utf8mb4');
    $queries = array_merge(
      array_filter(array_map('trim', explode(';', $schema))),
      array_filter(array_map('trim', explode(';', $seed)))
    );
    $errors = 0;
    foreach ($queries as $q) {
      if (!$q) continue;
      if (!$conn->query($q)) { echo '<p class="err">✗ ' . htmlspecialchars($conn->error) . '</p><pre>' . htmlspecialchars($q) . '</pre>'; $errors++; }
    }
    if (!$errors) {
      echo '<p class="ok">✓ تم إنشاء قاعدة البيانات وإدخال البيانات التجريبية بنجاح!</p>';
    } else {
      echo '<p class="err">⚠ اكتملت العملية مع ' . $errors . ' خطأ (قد تكون بسبب وجود البيانات مسبقاً)</p>';
    }
  endif; ?>
</div>

<div class="step">
  <h2>الخطوة 3: اختبار الـ API</h2>
  <?php
  $conn->select_db(DB_NAME);
  $tables = ['pharmacies','medicines','categories','donations','inventory','med_reps'];
  foreach ($tables as $t) {
    $r = $conn->query("SELECT COUNT(*) as c FROM $t");
    if ($r) {
      $c = $r->fetch_assoc()['c'];
      echo "<p class='ok'>✓ جدول <strong>$t</strong>: $c سجل</p>";
    } else {
      echo "<p class='err'>✗ جدول <strong>$t</strong>: غير موجود بعد</p>";
    }
  }
  ?>
  <p style="margin-top:1rem">روابط الاختبار:</p>
  <ul style="font-size:0.875rem;color:#0ea5e9;line-height:2">
    <li><a href="api/medicines/popular.php" target="_blank">api/medicines/popular.php</a></li>
    <li><a href="api/categories/index.php" target="_blank">api/categories/index.php</a></li>
    <li><a href="api/pharmacies/index.php" target="_blank">api/pharmacies/index.php</a></li>
    <li><a href="api/dashboard/platform-stats.php" target="_blank">api/dashboard/platform-stats.php</a></li>
  </ul>
</div>

<div class="step">
  <h2>✅ كل شيء جاهز!</h2>
  <p>افتح الموقع على: <a href="../frontend/index.html" style="color:#0ea5e9"><strong>/shifaa-dizad/frontend/index.html</strong></a></p>
  <p style="color:#dc2626;font-size:0.875rem;margin-top:0.5rem">⚠ احذف هذا الملف (setup.php) بعد الانتهاء من الإعداد.</p>
</div>

<?php $conn->close(); ?>
</body>
</html>
