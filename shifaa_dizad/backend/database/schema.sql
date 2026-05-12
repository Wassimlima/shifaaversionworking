CREATE DATABASE IF NOT EXISTS shifaa_dizad CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE shifaa_dizad;

CREATE TABLE IF NOT EXISTS pharmacies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    wilaya VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    rating FLOAT NOT NULL DEFAULT 4.0,
    review_count INT NOT NULL DEFAULT 0,
    is_open TINYINT(1) NOT NULL DEFAULT 1,
    opening_hours VARCHAR(50) DEFAULT '08:00 - 22:00',
    image_url TEXT,
    latitude FLOAT,
    longitude FLOAT,
    plan ENUM('free','professional','enterprise') NOT NULL DEFAULT 'free',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS medicines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    name_ar VARCHAR(255),
    active_ingredient TEXT,
    type ENUM('medicine','device','parapharmacy','emergency','special_needs','home_care') NOT NULL DEFAULT 'medicine',
    pharmacy_id INT NOT NULL,
    wilaya VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    availability ENUM('available','limited','unavailable') NOT NULL DEFAULT 'available',
    quantity INT NOT NULL DEFAULT 0,
    rating FLOAT NOT NULL DEFAULT 4.0,
    distance FLOAT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_ar VARCHAR(255) NOT NULL,
    name_en VARCHAR(255) NOT NULL,
    icon VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    product_count INT NOT NULL DEFAULT 0,
    slug VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS donations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    item_name_ar VARCHAR(255) NOT NULL,
    description TEXT,
    wilaya VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    donor_name VARCHAR(255) NOT NULL,
    `condition` ENUM('new','good','fair') NOT NULL,
    category VARCHAR(100) NOT NULL,
    image_url TEXT,
    is_available TINYINT(1) NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS prescriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url TEXT NOT NULL,
    status ENUM('pending','verified','rejected') NOT NULL DEFAULT 'pending',
    patient_name VARCHAR(255) NOT NULL,
    notes TEXT,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT NOT NULL,
    pharmacy_id INT NOT NULL,
    medicine_name VARCHAR(255) NOT NULL,
    pharmacy_name VARCHAR(255) NOT NULL,
    patient_name VARCHAR(255) NOT NULL,
    patient_phone VARCHAR(30) NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    notes TEXT,
    status ENUM('pending','confirmed','ready','completed','cancelled') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pharmacy_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    status ENUM('available','limited','unavailable') NOT NULL DEFAULT 'available',
    price FLOAT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    category VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS med_reps (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS rep_products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rep_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    total_stock INT NOT NULL DEFAULT 0,
    low_stock_pharmacies INT NOT NULL DEFAULT 0,
    status ENUM('good','warning','critical') NOT NULL DEFAULT 'good'
);

CREATE TABLE IF NOT EXISTS rep_alerts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rep_id INT NOT NULL,
    pharmacy_name VARCHAR(255) NOT NULL,
    pharmacy_id INT,
    pharmacy_phone VARCHAR(30),
    product_name VARCHAR(255) NOT NULL,
    remaining_stock INT NOT NULL,
    severity ENUM('low','medium','high') NOT NULL DEFAULT 'medium',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS partnership_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rep_id INT NOT NULL,
    pharmacy_id INT NOT NULL,
    status ENUM('pending','accepted','rejected','revoked') NOT NULL DEFAULT 'pending',
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS resupply_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rep_id INT NOT NULL,
    pharmacy_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    requested_quantity INT NOT NULL DEFAULT 1,
    message TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS contact_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS labs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    name_ar VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    wilaya VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    is_open TINYINT(1) NOT NULL DEFAULT 1,
    opening_hours VARCHAR(50) DEFAULT '07:00 - 18:00',
    maps_link TEXT,
    rating FLOAT NOT NULL DEFAULT 4.0,
    review_count INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS lab_analyses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lab_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    name_ar VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL DEFAULT 'general',
    price FLOAT NOT NULL DEFAULT 0,
    preparation_time VARCHAR(100) NOT NULL DEFAULT 'لا يوجد',
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
