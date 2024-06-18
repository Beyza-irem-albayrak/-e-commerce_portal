<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.tikla_kesfet.Model.Product" %>
<%@ include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Ürün Detayları</title>
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
        .form-group label {
            font-weight: bold;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Ürün Detayları</h2>
        <% 
            String formAction;
            Product product = (Product) request.getAttribute("product");
            String buttonText;
            if (product == null || product.getId() == 0) {
                formAction = request.getContextPath() + "/admin/products/add";
                buttonText = "Ekle";
            } else {
                formAction = request.getContextPath() + "/admin/products/update";
                buttonText = "Güncelle";
            }
        %>
        <form action="<%= formAction %>" method="post">
            <input type="hidden" name="id" value="<%= (product != null && product.getId() != 0) ? product.getId() : "" %>">
            <div class="form-group">
                <label for="name">Ürün İsmi</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= (product != null && product.getName() != null) ? product.getName() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="description">Açıklama</label>
                <textarea class="form-control" id="description" name="description" required><%= (product != null && product.getDescription() != null) ? product.getDescription() : "" %></textarea>
            </div>
            <div class="form-group">
                <label for="price">Fiyat</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" value="<%= (product != null && product.getPrice() != null) ? product.getPrice() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="imageUrl">Resim URL</label>
                <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="<%= (product != null && product.getImageUrl() != null) ? product.getImageUrl() : "" %>" required>
            </div>
            <button type="submit" class="btn btn-success"><%= buttonText %></button>
        </form>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
