<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kayıt Ol</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #004080;
            margin: 0;
            padding: 0;
            flex-direction: column;
        }
        .container {
            max-width: 400px;
            width: 100%;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
            margin: 20px;
        }
        .container img {
            margin-bottom: 20px;
        }
        .input-area {
            margin-bottom: 15px;
            text-align: left;
        }
        .input-area label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        .input-area input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #004080;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background-color: #003366;
        }
        .form-footer {
            margin-top: 15px;
            font-size: 14px;
        }
        .form-footer a {
            color: #007bff;
            text-decoration: none;
        }
        .form-footer a:hover {
            text-decoration: underline;
        }
        .footer-text {
            text-align: center;
            font-size: 14px;
            color: #fff;
            margin-top: auto;
            padding-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="${pageContext.request.contextPath}/register" method="post">
            <img src="${pageContext.request.contextPath}/resources/images/logo.webp" alt="Tıkla Keşfet" width="200" height="auto">
            <h3>Kayıt Ol</h3>
            <div class="input-area">
                <label for="username">Kullanıcı Adı</label>
                <input type="text" name="username" placeholder="Kullanıcı Adı" id="username" required>
            </div>
            <div class="input-area">
                <label for="email">Email</label>
                <input type="email" name="email" placeholder="Email" id="email" required>
            </div>
            <div class="input-area">
                <label for="password">Şifre</label>
                <input type="password" name="password" placeholder="Şifre" id="password" required>
            </div>
            <button type="submit">Kayıt Ol</button>
        </form>
        <div class="form-footer">
            <p>Zaten bir hesabınız var mı? <a href="${pageContext.request.contextPath}/login">Giriş Yap</a></p>
        </div>
    </div>
    <div class="footer-text">
        Güvenli alışveriş <br>
        © Copyright 1998 - 2024 D-Market Elektronik Hizmetler Tic. A.Ş.
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
