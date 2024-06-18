<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Footer</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    
    <style>
        footer {
            background-color: #004080; /* Header ile aynı arka plan rengi */
            color: white;
            padding: 20px 0;
        }
        footer h5 {
            color: white;
        }
        footer a {
            color: white;
            text-decoration: none;
        }
        footer a:hover {
            text-decoration: underline;
        }
        .btn-outline-success {
            color: white;
            border-color: white;
        }
        .btn-outline-success:hover {
            color: #004080;
            background-color: white;
            border-color: white;
        }
    </style>
</head>
<body>
    <footer class="container-fluid mt-5">
        <div class="row px-xl-5 py-4">
            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                <h5 class="font-weight-bold mb-3">Kurumsal</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Hakkımızda</a></li>
                    <li><a href="#">İş Ortaklarımız</a></li>
                    <li><a href="#">Yatırımcı İlişkileri</a></li>
                    <li><a href="#">Müşteri Hizmetleri</a></li>
                    <li><a href="#">Kariyer</a></li>
                    <li><a href="#">Kişisel Verilerin Korunması</a></li>
                    <li><a href="#">Bilgi Güvenliği Politikası</a></li>
                    <li><a href="#">İş Sağlığı ve Güvenliği Çevre Politikamız</a></li>
                    <li><a href="#">İletişim</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                <h5 class="font-weight-bold mb-3">Tıkla Keşfet</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Satıcı Olmak İstiyorum</a></li>
                    <li><a href="#">Hepsipay İşyeri Olmak İstiyorum</a></li>
                    <li><a href="#">Tedarikçi Davranış Kuralları</a></li>
                    <li><a href="#">Girişimci Kadınlara Teknoloji Gücü</a></li>
                    <li><a href="#">Teslimat Noktası Olmak İstiyorum</a></li>
                    <li><a href="#">Ödeme Seçenekleri</a></li>
                    <li><a href="#">Banka Kampanyaları</a></li>
                    <li><a href="#">İşlem Rehberi</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                <h5 class="font-weight-bold mb-3">Bizi Takip Edin</h5>
                <ul class="list-unstyled">
                    <li><a href="#"><i class="fab fa-instagram"></i> Instagram</a></li>
                    <li><a href="#"><i class="fab fa-youtube"></i> Youtube</a></li>
                    <li><a href="#"><i class="fab fa-facebook"></i> Facebook</a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i> X</a></li>
                    <li><a href="#"><i class="fab fa-linkedin"></i> Linkedin</a></li>
                    <li><a href="#"><i class="fab fa-pinterest"></i> Pinterest</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                <h5 class="font-weight-bold mb-3">Mobil Uygulamalar</h5>
                <ul class="list-unstyled">
                    <li><a href="#"><i class="fab fa-apple"></i> APP STORE'dan İNDİREBİLİRSİNİZ</a></li>
                    <li><a href="#"><i class="fab fa-google-play"></i> GOOGLE PLAY'dan İNDİREBİLİRSİNİZ</a></li>
                </ul>
            </div>
        </div>
        <div class="container text-center py-3">
            <p>Her şey ayağına gelsin! &copy; Copyright 1998 - 2024 D-MARKET Elektronik Hizmetler Tic. A.Ş. Her Hakkı Saklıdır.</p>
            <p><a href="https://web.whatsapp.com/send?phone=+908502524000" class="btn btn-outline-success"><i class="fab fa-whatsapp"></i> WhatsApp Destek</a></p>
        </div>
    </footer>
</body>
</html>
