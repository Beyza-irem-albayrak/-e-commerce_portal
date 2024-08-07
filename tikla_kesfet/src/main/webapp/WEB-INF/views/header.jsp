<%@ page import="com.example.tikla_kesfet.Model.User"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tıkla Keşfet</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <!-- Bootstrap Bundle JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">

    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #004080;
            padding: 10px 20px;
            color: white;
        }
        .navbar img {
            height: 50px;
            margin-right: 2px;
        }
        .navbar ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }
        .navbar ul li {
            margin: 0 10px;
        }
        .navbar ul li a {
            color: white;
            text-decoration: none;
        }
        .navbar-button a {
            margin-right: 10px;
        }
        .navbar-brand {
            display: flex;
            align-items: center;
        }
        .navbar-brand h1 {
            font-size: 24px;
            margin: 0;
            color: white;
            padding-left: 10px;
            display: inline;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">
            <img src="${pageContext.request.contextPath}/resources/images/logo.webp" alt="logo">
            <h1>Tıkla Keşfet</h1>
        </div>
        <ul>
            <li><a href="${pageContext.request.contextPath}/">Anasayfa</a></li>
            <li><a href="${pageContext.request.contextPath}/products">Ürünler</a></li>
            <li><a href="${pageContext.request.contextPath}/categories">Kategoriler</a></li>
            <li><a href="${pageContext.request.contextPath}/about">Hakkımızda</a></li>
        </ul>
        <div class="navbar-button">
            <%
                User user = (User) session.getAttribute("user");
                if (user != null) {
            %>
                    <a href="${pageContext.request.contextPath}/cart" class="btn btn-secondary">Sepete Git</a>
                    <a href="${pageContext.request.contextPath}/profile" class="btn btn-secondary">Profile Git</a>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-secondary">Çıkış Yap</a>
            <%
                } else {
            %>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary">Giriş Yap</a>
                    <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary">Kaydol</a>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
