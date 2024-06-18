<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .dashboard-container {
            padding: 30px;
            text-align: center;
        }
        .dashboard-container h2 {
            margin-bottom: 30px;
            font-size: 24px;
            color: #004080;
        }
        .dashboard-container .btn {
            background-color: #004080;
            color: #fff;
            border: none;
            margin: 10px;
            padding: 15px 30px;
            font-size: 16px;
            border-radius: 5px;
        }
        .dashboard-container .btn:hover {
            background-color: #003060;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Dashboard</h2>
        <a href="${pageContext.request.contextPath}/admin/products" class="btn">Ürünler</a>
        <a href="${pageContext.request.contextPath}/admin/users" class="btn">Kullanıcılar</a>
        <a href="${pageContext.request.contextPath}/admin/orders" class="btn">Siparişler</a>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
