<?php
function sendJSON($data, $status = 200) {
    http_response_code($status);
    echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function sendError($message, $status = 400) {
    sendJSON(['error' => $message], $status);
}

function getBody() {
    $raw = file_get_contents('php://input');
    return json_decode($raw, true) ?? [];
}
