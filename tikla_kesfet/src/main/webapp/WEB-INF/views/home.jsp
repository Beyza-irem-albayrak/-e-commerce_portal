<%@ page import="com.example.tikla_kesfet.Model.User"%>
<%@ page import="com.example.tikla_kesfet.Model.Product"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- /WEB-INF/views/home.jsp -->
<%@ include file="header.jsp" %>

<div class="container mt-4">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100 carousel-img" src="https://reimg-teknosa-cloud-prod.mncdn.com/bannerimage/anasayfa_macbook_indirim_210319_0_MC/8883322552370.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                    <div class="carousel-caption-bg">
                        <h5>Bayrama özel süper indirimleri yakala</h5>
                        <p>Fırsatları kaçırma!</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100 carousel-img" src="https://reimg-teknosa-cloud-prod.mncdn.com/bannerimage/anasayfa_ipad_macbook_indirim_210127_0_MC/8878243577906.jpg" alt="Second slide">
                <div class="carousel-caption d-none d-md-block">
                    <div class="carousel-caption-bg">
                        <h5>En iyi taksitli fiyat garantisi</h5>
                        <p>%0 faizli 1000 TL indirim</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100 carousel-img" src="https://reimg-teknosa-cloud-prod.mncdn.com/bannerimage/anasayfa_samsung_tablet_210128_0_MC/8878050246706.jpg" alt="Third slide">
                <div class="carousel-caption d-none d-md-block">
                    <div class="carousel-caption-bg">
                        <h5>Süper fiyat, süper teklif</h5>
                        <p>En iyi fiyatlar burada</p>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

<div class="container mt-5">
    <h2 class="text-center mb-5">Süper Fiyat, Süper Teklif</h2>
    <div class="row">
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null) {
                System.out.println("Products found: " + products.size());  // Debugging için
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
                        <form action="${pageContext.request.contextPath}/cart/add" method="post">
                            <input type="hidden" name="productId" value="<%= product.getId() %>">
                            <button type="submit" class="btn btn-primary">Sepete Ekle</button>
                        </form>
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
    .carousel-inner img {
        height: 400px;
        object-fit: cover;
    }

    .carousel-caption-bg {
        background: rgba(0, 0, 0, 0.5);
        padding: 10px;
        border-radius: 5px;
    }

    .product-img {
        height: 200px;
        object-fit: cover;
    }

    .card-body {
        display: flex;
        flex-direction: column;
    }

    .card-title {
        font-size: 1.25rem;
        margin-bottom: 0.75rem;
    }

    .card-text {
        font-size: 0.875rem;
        margin-bottom: 1rem;
    }

    .card-text.text-danger {
        font-weight: bold;
        font-size: 1.125rem;
    }

    .btn-primary {
        width: 100%;
        text-align: center;
        padding: 0.75rem;
    }

    .carousel-caption {
        position: absolute;
        bottom: 20px;
        left: 0;
        right: 0;
        text-align: center;
    }

    .carousel-caption h5,
    .carousel-caption p {
        margin: 0;
        padding: 0;
        font-size: 1.5rem;
        color: #fff;
    }
</style>

<script>
    $(document).ready(function(){
        $('.carousel').carousel();
    });
</script>
