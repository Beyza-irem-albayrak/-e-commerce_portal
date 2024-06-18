<%@ page import="com.example.tikla_kesfet.Model.Category"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h2 class="text-center">Kategoriler</h2>
    <div class="row">
        <%
            List<Category> categories = (List<Category>) request.getAttribute("categories");
            if (categories != null) {
                for (Category category : categories) {
        %>
        <div class="col-md-3 mb-4">
            <div class="card h-100">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title"><%= category.getName() %></h5>
                    <p class="card-text"><%= category.getDescription() %></p>
                </div>
            </div>
        </div>
        <% 
                }
            } else {
        %>
        <p>No categories available.</p>
        <% 
            } 
        %>
    </div>
</div>

<%@ include file="footer.jsp" %>
