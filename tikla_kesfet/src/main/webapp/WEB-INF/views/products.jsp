<%@ page import="java.util.List"%>
<%@ page import="com.example.tikla_kesfet.Model.Product"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h2 class="text-center mb-5">Ürünler</h2>
    <div class="row">
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null) {
                for (Product product : products) {
        %>
        <div class="col-md-3 mb-4">
            <div class="card h-100">
                <img src="<%= product.getImageUrl() %>" class="card-img-top product-img" alt="<%= product.getName() %>">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <p class="card-text"><%= product.getDescription() %></p>
                    <div class="mt-auto">
                        <p class="card-text text-danger"><%= product.getPrice() %> TL</p>
                        <a href="<%= request.getContextPath() + "/addToCart/" + product.getId() %>" class="btn btn-primary">Sepete Ekle</a>
                    </div>
                </div>
            </div>
        </div>
        <% 
                }
            } else {
        %>
        <p>No products available.</p>
        <% 
            } 
        %>
    </div>
</div>

<%@ include file="footer.jsp" %>

<style>
    .product-img {
        height: 200px;
        object-fit: cover;
    }
</style>
