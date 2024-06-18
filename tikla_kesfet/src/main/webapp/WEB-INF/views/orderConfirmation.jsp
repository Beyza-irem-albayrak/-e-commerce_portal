<%@ page import="com.example.tikla_kesfet.Model.OrderDetail"%>
<%@ page import="com.example.tikla_kesfet.Model.Order"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!-- Stil kodlarını buraya ekliyoruz -->
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }

    .container {
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2, h4 {
        color: #343a40;
    }

    .table {
        margin-bottom: 20px;
    }

    .alert-success {
        background-color: #d4edda;
        color: #155724;
        border-color: #c3e6cb;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004085;
    }

    .text-right {
        text-align: right;
    }

    .text-center {
        text-align: center;
    }
</style>

<div class="container mt-5">
    <h2 class="text-center">Sipariş Onayı</h2>
    <div class="alert alert-success mt-4" role="alert">
        Siparişiniz başarıyla oluşturuldu. Sipariş detaylarınız aşağıdadır:
    </div>
    <div class="row mt-4">
        <div class="col-md-6">
            <h4>Sipariş Detayları</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Ürün Adı</th>
                        <th>Adet</th>
                        <th>Fiyat</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Order order = (Order) request.getAttribute("order");
                        List<OrderDetail> orderDetails = (List<OrderDetail>) request.getAttribute("orderDetails");
                        double totalAmount = order.getTotalAmount();
                        if (orderDetails != null) {
                            for (OrderDetail detail : orderDetails) {
                    %>
                    <tr>
                        <td><%= detail.getProduct().getName() %></td>
                        <td><%= detail.getQuantity() %></td>
                        <td><%= detail.getPrice() %> TL</td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
            <h4 class="text-right">Toplam: <%= totalAmount %> TL</h4>
        </div>
        <div class="col-md-6">
            <h4>Ödeme ve Teslimat Bilgileri</h4>
            <table class="table table-bordered">
                <tr>
                    <th>Sipariş Tarihi</th>
                    <td><%= order.getCreatedAt().toLocalDate() %></td>
                </tr>
                <tr>
                    <th>Adres</th>
                    <td><%= order.getAddress() %></td>
                </tr>
                <tr>
                    <th>Ödeme Yöntemi</th>
                    <td><%= order.getPaymentMethodId() == 1 ? "Kredi Kartı" : order.getPaymentMethodId() == 2 ? "Havale" : "Kapıda Ödeme" %></td>
                </tr>
                <tr>
                    <th>Toplam Tutar</th>
                    <td><%= totalAmount %> TL</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Alışverişe Devam Et</a>
    </div>
</div>

<%@ include file="footer.jsp" %>
