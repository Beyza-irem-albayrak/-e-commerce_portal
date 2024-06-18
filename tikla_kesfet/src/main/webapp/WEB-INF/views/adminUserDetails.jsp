<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.tikla_kesfet.Model.User" %>
<%@ include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Kullanıcı Detayları</title>
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
            color: #1c1e21;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
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
        <h2>Kullanıcı Detayları</h2>
        <form action="${empty user ? pageContext.request.contextPath + '/admin/users/add' : pageContext.request.contextPath + '/admin/users/update'}" method="post">
            <input type="hidden" name="id" value="${user != null ? user.getId() : ''}">
            <div class="form-group">
                <label for="name">Adı</label>
                <input type="text" class="form-control" id="name" name="name" value="${user != null ? user.getName() : ''}" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${user != null ? user.getEmail() : ''}" required>
            </div>
            <div class="form-group">
                <label for="password">Şifre</label>
                <input type="password" class="form-control" id="password" name="password" value="${user != null ? user.getPassword() : ''}" required>
            </div>
            <div class="form-group">
                <label for="role">Rol</label>
                <input type="text" class="form-control" id="role" name="role" value="${user != null ? user.getRole() : ''}" required>
            </div>
            <button type="submit" class="btn btn-success">${user == null ? 'Ekle' : 'Güncelle'}</button>
        </form>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
