<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Expense Tracker</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>

/* ===== GLOBAL ===== */
body {
    margin: 0;
    background: #f4f6f9;
    font-family: system-ui;
}

/* ===== SIDEBAR ===== */
.sidebar {
    width: 240px;
    height: 100vh;
    background: #1e3c72;
    color: white;
    position: fixed;
    top: 0;
    left: -100%;  /* 🔥 hidden on mobile */
    padding: 20px;
    transition: 0.3s;
    z-index: 2000;
}

.sidebar.active {
    left: 0;
}

.sidebar a {
    display: block;
    padding: 12px;
    margin-bottom: 10px;
    color: white;
    text-decoration: none;
    border-radius: 8px;
}

.sidebar a:hover {
    background: rgba(255,255,255,0.2);
}

/* ===== HEADER ===== */
.header {
    position: fixed;
    top: 0;
    left: 0;   /* 🔥 full width on mobile */
    right: 0;
    height: 60px;
    background: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 15px;
    border-bottom: 1px solid #eee;
    z-index: 1000;
}

/* ===== CONTENT ===== */
.content {
    margin-top: 60px;
    padding: 15px;
}

/* ===== CARD ===== */
.card-box {
    background: white;
    padding: 15px;
    border-radius: 12px;
    margin-bottom: 15px;
}

/* ===== DESKTOP ===== */
@media (min-width: 768px) {

    .sidebar {
        left: 0;   /* always visible */
    }

    .header {
        left: 240px;   /* shift header */
        width: calc(100% - 240px);
    }

    .content {
        margin-left: 240px;
        padding: 20px;
    }
}

/* ===== OVERLAY ===== */
#overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.4);
    display: none;
    z-index: 1500;
}

#overlay.active {
    display: block;
}

</style>

<script>
function toggleSidebar() {
    if (window.innerWidth >= 768) return; // 🔥 ignore on desktop

    const sidebar = document.querySelector(".sidebar");
    const overlay = document.getElementById("overlay");

    sidebar.classList.toggle("active");
    overlay.classList.toggle("active");
}

function closeSidebar() {
    const overlay = document.getElementById("overlay");

    document.querySelector(".sidebar").classList.remove("active");

    if (overlay) {
        overlay.classList.remove("active");
    }
}
</script>

</head>

<body>

<!-- ===== HEADER ===== -->
<div class="header">

    <!-- LEFT: Hamburger + App name -->
    <div class="d-flex align-items-center gap-2">

        <!-- Hamburger -->
        <button class="btn btn-light" onclick="toggleSidebar()">
            <i class="bi bi-list"></i>
        </button>

        <h6 class="m-0">💸 Expense Tracker</h6>
    </div>

    <!-- RIGHT: User + Logout -->
    <div class="d-flex align-items-center gap-3">

        <span class="fw-semibold">${userName}</span>

        <a href="/logout" class="text-danger text-decoration-none">
            Logout
        </a>
    </div>

</div>
<div id="overlay" onclick="closeSidebar()"></div>
</body>