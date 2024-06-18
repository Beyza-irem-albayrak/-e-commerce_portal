<%@ page import="com.example.tikla_kesfet.Model.CartItem"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h2 class="text-center">Sepetim</h2>
    <div class="row">
        <div class="col-md-8">
            <h4>Sepetiniz</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Ürün</th>
                        <th>Fiyat</th>
                        <th>Adet</th>
                        <th>Toplam</th>
                        <th>İşlem</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
                        double totalAmount = 0;
                        if (cartItems != null) {
                            for (CartItem cartItem : cartItems) {
                                double itemTotal = cartItem.getPrice() * cartItem.getQuantity();
                                totalAmount += itemTotal;
                    %>
                    <tr>
                        <td><%= cartItem.getProduct().getName() %></td>
                        <td><%= cartItem.getPrice() %> TL</td>
                        <td><%= cartItem.getQuantity() %></td>
                        <td><%= itemTotal %> TL</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/cart/remove" method="post" style="display:inline;">
                                <input type="hidden" name="productId" value="<%= cartItem.getProductId() %>">
                                <button type="submit" class="btn btn-danger">Sil</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5">Sepetiniz boş.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <h4 class="text-right">Toplam: <%= totalAmount %> TL</h4>
        </div>
        <div class="col-md-4">
            <h4>Ödeme Bilgileri</h4>
            <form action="${pageContext.request.contextPath}/order/checkout" method="post">
                <div class="form-group">
                    <label for="address">Adres</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>
                <div class="form-group">
                    <label for="paymentMethod">Ödeme Yöntemi</label>
                    <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                        <option value="1">Kredi Kartı</option>
                        <option value="2">Havale</option>
                        <option value="3">Kapıda Ödeme</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success btn-block">Ödemeyi Tamamla</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
