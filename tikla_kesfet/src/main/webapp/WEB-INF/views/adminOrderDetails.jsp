<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.tikla_kesfet.Model.OrderDetail" %>
<%@ include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Sipariş Detayları</title>
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
        .footer {
            margin-top: 20px;
            text-align: center;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Sipariş Detayları</h2>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Ürün ID</th>
                    <th>Adet</th>
                    <th>Fiyat</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<OrderDetail> orderDetails = (List<OrderDetail>) request.getAttribute("orderDetails");
                    if (orderDetails != null) {
                        for (OrderDetail detail : orderDetails) {
                %>
                <tr>
                    <td><%= detail.getProductId() %></td>
                    <td><%= detail.getQuantity() %></td>
                    <td><%= detail.getPrice() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3">Sipariş detayları bulunamadı.</td>
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
