<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="sidebar" id="sidebar">

 <div class="d-flex justify-content-end d-md-none">
        <button class="btn btn-light btn-sm" onclick="closeSidebar()">✕</button>
    </div>

  <a href="/" class="menu-item ${page == 'dashboard' ? 'active' : ''}">
        📋 <span>Dashboard</span>
    </a>

    <a href="/expenses" class="menu-item ${page == 'expenses' ? 'active' : ''}">
        📄 <span>Expenses</span>
    </a>

    <a href="/analytics" class="menu-item ${page == 'analytics' ? 'active' : ''}">
        📊 <span>Analytics</span>
    </a>

</div>