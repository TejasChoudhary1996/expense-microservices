<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>Analytics Dashboard</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body {
    background: #f4f6f9;
    font-family: 'Poppins', sans-serif;
}

.content {
    margin-left: 220px;
    padding: 20px;
}

.card-box {
    background: white;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 20px;
}

canvas {
    max-height: 300px !important;
}
</style>

</head>

<body>
<%@ include file="../layout/header.jsp" %>
<%@ include file="../layout/sidebar.jsp" %>

<div class="content">

<h3>📊 Analytics Dashboard</h3>

<!-- ================= SUMMARY ================= -->
<div class="row">

    <div class="col-md-6">
        <div class="card-box text-center">
            <h6>Total Expenses</h6>
            <h3>&#8377; ${totalExpenses}</h3>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card-box text-center">
            <h6>This Month</h6>
            <h3>&#8377; ${monthlyExpenses}</h3>
        </div>
    </div>


</div>

<!-- ================= CHARTS ================= -->

<div class="row">

    <!-- CATEGORY -->
    <div class="col-md-6">
        <div class="card-box">
            <h5>Category Breakdown</h5>
            <canvas id="categoryChart"></canvas>
        </div>
    </div>

    <!-- PAYMENT -->
    <div class="col-md-6">
        <div class="card-box">
            <h5>Payment Method</h5>
            <canvas id="paymentChart"></canvas>
        </div>
    </div>

</div>
<%-- 
<!-- MONTHLY TREND -->
<div class="card-box">
    <h5>Monthly Trend</h5>
    <canvas id="monthlyChart"></canvas>
</div> --%>

</div>

<script>

/* ================= CATEGORY ================= */
const categoryData = ${categoryAnalyticsJson};

new Chart(document.getElementById('categoryChart'), {
    type: 'doughnut',
    data: {
        labels: Object.keys(categoryData),
        datasets: [{
            data: Object.values(categoryData)
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false
    }
});

/* ================= PAYMENT ================= */
const paymentData = ${paymentAnalyticsJson};

new Chart(document.getElementById('paymentChart'), {
    type: 'bar',
    data: {
        labels: Object.keys(paymentData),
        datasets: [{
            data: Object.values(paymentData)
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false
    }
});

/* ================= MONTHLY ================= */
/* const monthlyData = ${monthlyTrendJson};

new Chart(document.getElementById('monthlyChart'), {
    type: 'line',
    data: {
        labels: Object.keys(monthlyData),
        datasets: [{
            label: "Expenses",
            data: Object.values(monthlyData),
            fill: false,
            tension: 0.3
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false
    }
}); */

</script>

</body>
</html>