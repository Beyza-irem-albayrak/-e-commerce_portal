<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hakkımızda</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .about-section {
            padding: 60px 0;
        }
        .about-section h2 {
            font-size: 2.5rem;
            margin-bottom: 30px;
        }
        .about-section p {
            font-size: 1.1rem;
            line-height: 1.8;
        }
        .about-section .about-content {
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container about-section">
    <h2 class="text-center mb-5">Hakkımızda</h2>
    <div class="about-content">
        <p>
            Tıkla Keşfet, en iyi ürünleri ve hizmetleri müşterilerimize sunmayı amaçlayan öncü bir e-ticaret platformudur. Müşteri memnuniyetini en üst düzeyde tutmak için sürekli olarak kendimizi yeniliyor ve geliştiriyoruz. 
        </p>
        <p>
            Kuruluşumuzdan bu yana, geniş ürün yelpazemiz ve hızlı teslimat hizmetimizle sektörde öncü konumda yer alıyoruz. Amacımız, müşterilerimize en iyi alışveriş deneyimini sunmaktır.
        </p>
        <p>
            Tıkla Keşfet ailesi olarak, dürüstlük, güvenilirlik ve müşteri memnuniyeti değerlerimize sıkı sıkıya bağlıyız. Siz değerli müşterilerimize daha iyi hizmet verebilmek için her geçen gün daha da büyüyor ve gelişiyoruz.
        </p>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
