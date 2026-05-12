<?php
define('DB_SOCK', '/home/runner/mysql-run/mysql.sock');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'shifaa_dizad');

function getDB() {
    $conn = new mysqli(null, DB_USER, DB_PASS, DB_NAME, null, DB_SOCK);
    if ($conn->connect_error) {
        http_response_code(500);
        echo json_encode(['error' => 'Database connection failed: ' . $conn->connect_error]);
        exit;
    }
    $conn->set_charset('utf8mb4');
    return $conn;
}
