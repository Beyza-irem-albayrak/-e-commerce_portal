<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Giriş Yap</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background-color: #004080;
        flex-direction: column;
    }
    .container {
        margin-top: 20px;
        width: 100%;
        max-width: 400px;
        padding: 20px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        margin-bottom: 20px;
    }
    .container img {
        max-width: 150px;
        margin-bottom: 20px;
    }
    .form-group {
        text-align: left;
        margin-bottom: 15px;
    }
    .form-control {
        border-radius: 5px;
        padding: 10px;
    }
    .btn-primary {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        background-color: #004080;
        border-color: #004080;
    }
    .btn-primary:hover {
        background-color: #003366;
        border-color: #003366;
    }
    .text-muted a {
        color: #004080;
    }
    .input-group-text {
        cursor: pointer;
    }
    .social-login {
        margin-top: 20px;
        padding: 10px;
        border-radius: 5px;
        background-color: #f0f0f0;
        text-align: center;
    }
    .social-login p {
        font-weight: bold;
        margin-bottom: 10px;
    }
    .social-login .social-icons {
        display: flex;
        justify-content: center;
        gap: 20px;
    }
    .social-login .social-icons a {
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 50%;
        padding: 10px;
        transition: background-color 0.3s, transform 0.3s;
    }
    .social-login .social-icons a:hover {
        background-color: #e0e0e0;
        transform: scale(1.1);
    }
    .social-login .social-icons img {
        width: 24px;
        height: 24px;
    }
    .footer-text {
        text-align: center;
        margin-top: 20px;
        font-size: 14px;
        color: #fff;
    }
</style>
</head>
<body>
    <div class="container">
        <img src="${pageContext.request.contextPath}/resources/images/logo.webp" alt="logo">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="email">E-posta adresi</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Şifre</label>
                <div class="input-group">
                    <input type="password" class="form-control" id="password" name="password" required>
                    <div class="input-group-append">
                        <span class="input-group-text" id="toggle-password">
                            <i class="fas fa-eye"></i>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form-group text-right">
                <a href="#" class="text-muted">Şifremi unuttum</a>
            </div>
            <button type="submit" class="btn btn-primary">Giriş yap</button>
        </form>
        <div class="social-login">
            <p>Sosyal hesabın ile giriş yap</p>
            <div class="social-icons">
                <a href="#"><img src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg" alt="Apple"></a>
                <a href="#"><img src="https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png" alt="Google"></a>
                <a href="#"><img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg" alt="Facebook"></a>
            </div>
        </div>
    </div>
    <div class="footer-text">
        Güvenli alışveriş <br>
        © Copyright 1998 - 2024 D-Market Elektronik Hizmetler Tic. A.Ş.
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script>
        $('#toggle-password').on('click', function() {
            const passwordField = $('#password');
            const passwordFieldType = passwordField.attr('type');
            const icon = $(this).find('i');

            if (passwordFieldType === 'password') {
                passwordField.attr('type', 'text');
                icon.removeClass('fa-eye').addClass('fa-eye-slash');
            } else {
                passwordField.attr('type', 'password');
                icon.removeClass('fa-eye-slash').addClass('fa-eye');
            }
        });
    </script>
</body>
</html>
