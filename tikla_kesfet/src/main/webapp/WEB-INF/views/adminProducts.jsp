<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.tikla_kesfet.Model.Product" %>
<%@ include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Ürünler</title>
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
            background-color: #17a2b8;
            border-color: #17a2b8;
        }
        .btn-info:hover {
            background-color: #138496;
            border-color: #117a8b;
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
        <h2 class="mb-4">Ürünler</h2>
        <a href="<%= request.getContextPath() %>/admin/products/add" class="btn btn-info mb-4">Yeni Ürün Ekle</a>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Ürün Adı</th>
                    <th>Açıklama</th>
                    <th>Fiyat</th>
                    <th>Resim</th>
                    <th>İşlemler</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Product> products = (List<Product>) request.getAttribute("products");
                    if (products != null) {
                        for (int i = 0; i < products.size(); i++) {
                            Product product = products.get(i);
                %>
                <tr>
                    <td><%= product.getId() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getDescription() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>" style="width: 100px; height: auto;"></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/admin/products/edit/<%= product.getId() %>" class="btn btn-info btn-sm">Düzenle</a>
                        <a href="<%= request.getContextPath() %>/admin/products/delete/<%= product.getId() %>" class="btn btn-danger btn-sm">Sil</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6" class="text-center">Ürün bulunamadı.</td>
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
