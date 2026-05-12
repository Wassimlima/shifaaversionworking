# 💊 Shifaa Dizad — Algerian Medical Platform

## Overview

Shifaa Dizad is a modern Algerian health-tech platform designed to help users quickly find:

* Medicines
* Pharmacies
* Medical devices
* Laboratory analyses
* Medical donations
* Emergency pharmacies
* Prescription assistance

The platform is built using:

* HTML
* CSS
* Vanilla JavaScript
* PHP
* MySQL

No frameworks are used.

---

# ✨ Features

## 🔍 Smart Medicine Search

Users can search for:

* Medicines
* Medical supplies
* Medical devices
* Cosmetics
* Emergency products

Features:

* Fast search
* Filters by category
* Availability status
* Nearby pharmacies
* Responsive UI

---

## 🏥 Pharmacies System

Users can:

* Find nearby pharmacies
* Check if pharmacies are open or closed
* View night-duty pharmacies
* Open Google Maps directions

---

## 🧪 Laboratory Analysis System

Users can:

* Search medical analyses
* View laboratory prices
* Check preparation times
* See open/closed status
* Access maps links

---

## 📋 Prescription Upload (AI Feature)

Feature under construction.

Planned functionality:

* Upload prescription image
* OCR text extraction
* Detect medicine names
* Suggest available alternatives
* AI-assisted medicine recommendations

---

## 🎁 Health Solidarity

Donation system where users can:

* Add medical donations
* Upload donation images
* Help people in need

---

## 💳 Subscription System

### Pharmacists

* Monthly plans
* Yearly plans
* Pharmacy dashboard access

### Medical Representatives

* Monthly plans
* Yearly plans
* Representative portal access

### Analysis Laboratories

* Freemium plan
* Premium plan

---

# 🎨 Design

The UI uses a modern medical-tech aesthetic inspired by:

* Stripe
* Linear
* Apple Health
* Modern SaaS platforms

Design includes:

* Glassmorphism
* Smooth animations
* Responsive layout
* Modern gradients
* RTL Arabic support
* Premium health-tech color palette

---

# 📁 Project Structure

```txt
backend/
frontend/
```

## Backend

```txt
backend/
├── api/
├── config/
├── database/
├── uploads/
└── utils/
```

## Frontend

```txt
frontend/
├── css/
├── js/
├── pages/
└── assets/
```

---

# 🛠️ Technologies

## Frontend

* HTML5
* CSS3
* Vanilla JavaScript

## Backend

* PHP
* MySQL / MariaDB
* mysqli

---

# 🚀 Local Installation

## Requirements

* WAMP or XAMPP
* PHP 8+
* MySQL / MariaDB

---

## Installation Steps

### 1. Move project

Copy project into:

```txt
C:\wamp64\www\shifaa_dizad
```

---

### 2. Import database

Open:

```txt
phpMyAdmin
```

Create database:

```txt
shifaa_dizad
```

Import:

```txt
backend/database/schema.sql
backend/database/seed.sql
```

---

### 3. Start WAMP

Start:

* Apache
* MySQL

---

### 4. Open website

```txt
http://localhost/shifaa_dizad/frontend/index.html
```

---

# ⚙️ API

Base API:

```txt
/backend/api
```

Example:

```txt
/backend/api/medicines/search.php?q=doliprane
```

---

# 📱 Responsive Design

The platform is fully responsive:

* Desktop
* Tablet
* Mobile

---

# 🔐 Future Improvements

Planned features:

* Authentication system
* Real AI OCR integration
* Real-time notifications
* Online pharmacy reservations
* Advanced analytics dashboard
* Geolocation
* Admin dashboard
* Mobile application

---

# 🇩🇿 Vision

Shifaa Dizad aims to modernize access to healthcare services in Algeria through a fast, clean, and intelligent digital platform.

---

# 👨‍💻 Developer Notes

Important rules:

* Keep project simple
* Do not add React/Vue/Node
* Do not create unnecessary folders
* Keep frontend/backend structure only
* Maintain vanilla architecture

---

# 📄 License

Personal educational and startup project.
