<%@ page import="com.example.tikla_kesfet.Model.Order"%>
<%@ page import="com.example.tikla_kesfet.Model.OrderDetail"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%
    Order order = (Order) request.getAttribute("order");
%>

<div class="container mt-5">
    <h2 class="text-center">Sipariş Detayları</h2>
    <div class="row">
        <div class="col-md-6">
            <h4>Sipariş Bilgileri</h4>
            <p><strong>Sipariş Numarası:</strong> <%= order.getId() %></p>
            <p><strong>Tarih:</strong> <%= order.getCreatedAt() %></p>
            <p><strong>Toplam Tutar:</strong> <%= order.getTotalAmount() %> TL</p>
            <p><strong>Durum:</strong> <%= order.getStatus() %></p>
            <p><strong>Adres:</strong> <%= order.getAddress() %></p>
        </div>
        <div class="col-md-6">
            <h4>Ödeme Yöntemi</h4>
            <p><strong>Yöntem:</strong> 
                <%
                    int paymentMethodId = order.getPaymentMethodId();
                    if (paymentMethodId == 1) {
                        out.print("Kredi Kartı");
                    } else if (paymentMethodId == 2) {
                        out.print("Havale");
                    } else if (paymentMethodId == 3) {
                        out.print("Kapıda Ödeme");
                    } else {
                        out.print("Bilinmiyor");
                    }
                %>
            </p>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12">
            <h4>Ürün Detayları</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Ürün ID</th>
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
                    %>
                    <tr>
                        <td><%= detail.getProductId() %></td>
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
</div>

<%@ include file="footer.jsp" %>
