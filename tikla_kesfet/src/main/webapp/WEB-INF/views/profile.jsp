<%@ page import="com.example.tikla_kesfet.Model.User"%>
<%@ page import="com.example.tikla_kesfet.Model.Order"%>
<%@ page import="com.example.tikla_kesfet.Model.OrderDetail"%>
<%@ page import="com.example.tikla_kesfet.Model.Product"%>
<%@ page import="com.example.tikla_kesfet.Dao.ProductDao"%>
<%@ page import="java.util.List"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilim - Tıkla Keşfet</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
    <style>
        .profile-container {
            margin-top: 30px;
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
            font-weight: bold;
            font-size: 24px;
            color: #004080;
        }
        .profile-info, .order-list {
            margin-bottom: 20px;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .profile-info h4, .order-list h4 {
            font-weight: bold;
            color: #004080;
            margin-bottom: 15px;
        }
        .order-card {
            margin-bottom: 20px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background: #ffffff;
        }
        .order-card h5 {
            font-weight: bold;
            color: #004080;
            margin-bottom: 15px;
        }
        .order-card table {
            width: 100%;
            margin-bottom: 15px;
        }
        .order-card table th, .order-card table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .order-card table th {
            background: #004080;
            color: #ffffff;
        }
        .order-card table td {
            background: #f8f9fa;
        }
        .order-card .order-details {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container profile-container">
        <div class="profile-header">
            <h2>Profilim</h2>
        </div>
        <div class="profile-info">
            <h4>Bilgilerim</h4>
            <p><strong>Kullanıcı Adı:</strong> <%= ((User) session.getAttribute("user")).getName() %></p>
            <p><strong>Email:</strong> <%= ((User) session.getAttribute("user")).getEmail() %></p>
        </div>
        <div class="order-list">
            <h4>Siparişlerim</h4>
            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
                ProductDao productDao = context.getBean(ProductDao.class);
                if (orders != null && !orders.isEmpty()) {
                    for (Order order : orders) {
            %>
            <div class="order-card">
                <h5>Sipariş Numarası: <%= order.getId() %></h5>
                <table class="table">
                    <tr>
                        <th>Tarih</th>
                        <td><%= order.getCreatedAt() %></td>
                    </tr>
                    <tr>
                        <th>Toplam Tutar</th>
                        <td><%= order.getTotalAmount() %> TL</td>
                    </tr>
                    <tr>
                        <th>Durum</th>
                        <td><%= order.getStatus() %></td>
                    </tr>
                    <tr>
                        <th>Adres</th>
                        <td><%= order.getAddress() %></td>
                    </tr>
                </table>
                <div class="order-details">
                    <h5>Sipariş Detayları</h5>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Ürün İsmi</th>
                                <th>Adet</th>
                                <th>Fiyat</th>
                                <th>Toplam</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<OrderDetail> orderDetails = order.getOrderDetails();
                                if (orderDetails != null && !orderDetails.isEmpty()) {
                                    for (OrderDetail detail : orderDetails) {
                                        Product product = productDao.getProductById(detail.getProductId());
                            %>
                            <tr>
                                <td><%= product.getName() %></td>
                                <td><%= detail.getQuantity() %></td>
                                <td><%= detail.getPrice() %> TL</td>
                                <td><%= detail.getPrice() * detail.getQuantity() %> TL</td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="4">Sipariş detayı bulunamadı.</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <div class="no-orders">
                Henüz siparişiniz yok.
            </div>
            <%
                }
            %>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
