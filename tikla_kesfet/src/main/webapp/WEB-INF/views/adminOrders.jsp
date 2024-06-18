<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.tikla_kesfet.Model.Order" %>
<%@ include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Siparişler</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            background-color: #f4f6f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #1c1e21;
            margin-bottom: 20px;
        }
        .table {
            background-color: #ffffff;
        }
        .table th {
            background-color: #004080;
            color: #ffffff;
        }
        .table td {
            vertical-align: middle;
        }
        .table thead th {
            border-top: none;
        }
        .table tbody tr:hover {
            background-color: #e9ecef;
        }
        .btn-info {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-info:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #bd2130;
            border-color: #b21f2d;
        }
        .footer {
            margin-top: 20px;
            text-align: center;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Siparişler</h2>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Kullanıcı ID</th>
                    <th>Toplam Tutar</th>
                    <th>Oluşturulma Tarihi</th>
                    <th>Adres</th>
                    <th>Durum</th>
                    <th>İşlemler</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Order> orders = (List<Order>) request.getAttribute("orders");
                    if (orders != null) {
                        for (Order order : orders) {
                %>
                <tr>
                    <td><%= order.getId() %></td>
                    <td><%= order.getUserId() %></td>
                    <td><%= order.getTotalAmount() %></td>
                    <td><%= order.getCreatedAt() %></td>
                    <td><%= order.getAddress() %></td>
                    <td><%= order.getStatus() %></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/admin/orders/details/<%= order.getId() %>" class="btn btn-info btn-sm">Detaylar</a>
                        <a href="<%= request.getContextPath() %>/admin/orders/delete/<%= order.getId() %>" class="btn btn-danger btn-sm">Sil</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7" class="text-center">Sipariş bulunamadı.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
