package com.example.tikla_kesfet.Controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.tikla_kesfet.Dao.UserDao;
import com.example.tikla_kesfet.Dao.CartDao;
import com.example.tikla_kesfet.Dao.CartItemDao;
import com.example.tikla_kesfet.Dao.OrderDao; // OrderDao'yu ekleyelim
import com.example.tikla_kesfet.Model.User;
import com.example.tikla_kesfet.Model.Cart;
import com.example.tikla_kesfet.Model.CartItem;
import com.example.tikla_kesfet.Model.Order; // Order modelini ekleyelim

@Controller
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private CartDao cartDao;

    @Autowired
    private CartItemDao cartItemDao;
    
    @Autowired
    private OrderDao orderDao; // OrderDao'yu enjekte edelim

    @GetMapping(value = "/register")
    public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return new ModelAndView("register");
    }

    @GetMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return new ModelAndView("login");
    }
    
    @GetMapping(value = "/profile")
    public ModelAndView profile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("redirect:/login");
        }

        List<Order> orders = orderDao.getOrdersByUserId(user.getId());
        for (Order order : orders) {
            order.setOrderDetails(orderDao.getOrderDetailsByOrderId(order.getId())); // Sipariş detaylarını ayarlıyoruz
        }

        ModelAndView modelAndView = new ModelAndView("profile");
        modelAndView.addObject("user", user);
        modelAndView.addObject("orders", orders); // Siparişleri profile sayfasına ekliyoruz
        return modelAndView;
    }

    @PostMapping(value = "/register")
    public ModelAndView registerPost(@RequestParam("username") String username, 
                                     @RequestParam("email") String email, 
                                     @RequestParam("password") String password, 
                                     HttpServletRequest request, 
                                     HttpServletResponse response) throws IOException {
        try {
            User user = new User();
            user.setEmail(email);
            user.setName(username);
            user.setPassword(password);
            user.setRole("USER");

            int createdUserId = userDao.addUser(user);

            Cart cart = new Cart();
            cart.setUserId(createdUserId);

            cartDao.addCart(cart);

            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userId", createdUserId);

            response.sendRedirect(request.getContextPath() + "/");
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("register");
        }
    }

    @PostMapping(value = "/login")
    public ModelAndView loginPost(@RequestParam("email") String email, 
                                  @RequestParam("password") String password, 
                                  HttpServletRequest request, 
                                  HttpServletResponse response) throws IOException {
        try {
            User user = userDao.getUserByEmailAndPassword(email, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userId", user.getId());

                // Admin login control
                String adminEmail = "admin@example.com";
                String adminPassword = "admin123";
                
                if (email.equals(adminEmail) && password.equals(adminPassword)) {
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/");
                }
                return null;
            } else {
                ModelAndView modelAndView = new ModelAndView("login");
                modelAndView.addObject("message", "E-posta veya şifre yanlış!");
                return modelAndView;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("login");
        }
    }

    @GetMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }
}
