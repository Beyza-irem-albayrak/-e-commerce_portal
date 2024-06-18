package com.example.tikla_kesfet.Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.tikla_kesfet.Dao.AdminDao;
import com.example.tikla_kesfet.Dao.UserDao;
import com.example.tikla_kesfet.Dao.OrderDao;
import com.example.tikla_kesfet.Dao.OrderDetailDao;
import com.example.tikla_kesfet.Dao.ProductDao;
import com.example.tikla_kesfet.Model.Admin;
import com.example.tikla_kesfet.Model.User;
import com.example.tikla_kesfet.Model.Order;
import com.example.tikla_kesfet.Model.OrderDetail;
import com.example.tikla_kesfet.Model.Product;

@Controller
public class AdminController {
    @Autowired
    AdminDao adminDao;

    @Autowired
    OrderDao orderDao;
    @Autowired
    OrderDetailDao orderDetailDao;
    @Autowired
    ProductDao productDao;

    @Autowired
    UserDao userDao;

    @GetMapping("/admin/dashboard")
    public ModelAndView dashboard() {
        return new ModelAndView("adminDashboard");
    }

    @GetMapping("/admin/products")
    public ModelAndView adminProducts() {
        ModelAndView modelAndView = new ModelAndView("adminProducts");
        List<Product> productList = productDao.getAllProducts();
        modelAndView.addObject("products", productList);
        return modelAndView;
    }

    @GetMapping("/admin/products/add")
    public ModelAndView adminAddProduct() {
        ModelAndView modelAndView = new ModelAndView("adminProductDetails");
        modelAndView.addObject("product", new Product());
        return modelAndView;
    }

    @PostMapping("/admin/products/add")
    public void adminCreateProduct(
            @RequestParam("name") String name, 
            @RequestParam("description") String description,
            @RequestParam("price") String price,
            @RequestParam("imageUrl") String imageUrl,
            HttpServletResponse response) throws IOException {
        
        try {
            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(new BigDecimal(price));
            product.setImageUrl(imageUrl);
            
            productDao.addProduct(product);
            response.sendRedirect("/tikla_kesfet/admin/products");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/tikla_kesfet/admin/products/add?error");
        }
    }

    @GetMapping("/admin/products/edit/{productId}")
    public ModelAndView editProduct(@PathVariable int productId) {
        Product product = productDao.getProductById(productId);
        ModelAndView modelAndView = new ModelAndView("adminProductDetails");
        modelAndView.addObject("product", product);
        return modelAndView;
    }

    @PostMapping("/admin/products/update")
    public void updateProduct(
            @RequestParam("id") int id,
            @RequestParam("name") String name, 
            @RequestParam("description") String description,
            @RequestParam("price") String price,
            @RequestParam("imageUrl") String imageUrl,
            HttpServletResponse response) throws IOException {
        
        try {
            Product product = productDao.getProductById(id);
            product.setName(name);
            product.setDescription(description);
            product.setPrice(new BigDecimal(price));
            product.setImageUrl(imageUrl);
            
            productDao.updateProduct(product);
            response.sendRedirect("/tikla_kesfet/admin/products");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/tikla_kesfet/admin/products/edit/" + id + "?error");
        }
    }

    @GetMapping("/admin/products/delete/{productId}")
    public void deleteProduct(@PathVariable int productId, HttpServletResponse response) throws IOException {
        try {
            productDao.deleteProduct(productId);
            response.sendRedirect("/tikla_kesfet/admin/products");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/tikla_kesfet/admin/products?error");
        }
    }

    @GetMapping("/admin/users")
    public ModelAndView adminUsers() {
        ModelAndView modelAndView = new ModelAndView("adminUsers");
        List<User> userList = userDao.getAllUsers();
        modelAndView.addObject("users", userList);
        return modelAndView;
    }

    @GetMapping("/admin/users/delete/{userId}")
    public void deleteUser(@PathVariable int userId, HttpServletResponse response) throws IOException {
        try {
            userDao.deleteUser(userId);
            response.sendRedirect("/tikla_kesfet/admin/users");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/tikla_kesfet/admin/users?error=true");
        }
    }

    @GetMapping("/admin/orders")
    public ModelAndView adminOrders() {
        ModelAndView modelAndView = new ModelAndView("adminOrders");
        List<Order> orderList = orderDao.getAllOrders();
        modelAndView.addObject("orders", orderList);
        return modelAndView;
    }

    @GetMapping("/admin/orders/details/{orderId}")
    public ModelAndView orderDetails(@PathVariable int orderId) {
        Order order = orderDao.getOrderById(orderId);
        List<OrderDetail> orderDetails = orderDetailDao.getOrderDetailsByOrderId(orderId);  // Corrected the DAO call
        ModelAndView modelAndView = new ModelAndView("adminOrderDetails");
        modelAndView.addObject("orderDetails", orderDetails);
        return modelAndView;
    }

    @GetMapping("/admin/orders/delete/{orderId}")
    public void deleteOrder(@PathVariable int orderId, HttpServletResponse response) throws IOException {
        try {
            List<OrderDetail> orderDetails = orderDetailDao.getOrderDetailsByOrderId(orderId);
            for (OrderDetail detail : orderDetails) {
                orderDetailDao.deleteOrderDetail(detail.getId());
            }
            orderDao.deleteOrder(orderId);
            response.sendRedirect("/tikla_kesfet/admin/orders");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/tikla_kesfet/admin/orders?error");
        }
    }
}
