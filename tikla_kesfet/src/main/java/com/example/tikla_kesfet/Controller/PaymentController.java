package com.example.tikla_kesfet.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.tikla_kesfet.Dao.OrderDao;
import com.example.tikla_kesfet.Dao.CartDao;
import com.example.tikla_kesfet.Dao.CartItemDao;
import com.example.tikla_kesfet.Model.Cart;
import com.example.tikla_kesfet.Model.CartItem;
import com.example.tikla_kesfet.Model.Order;
import com.example.tikla_kesfet.Model.OrderDetail;
import com.example.tikla_kesfet.Model.User;

@Controller
public class PaymentController {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private CartDao cartDao;

    @Autowired
    private CartItemDao cartItemDao;

    @GetMapping("/checkout")
    public ModelAndView checkout(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("redirect:/login");
        }

        Cart cart = cartDao.getCartByUserId(user.getId());
        List<CartItem> cartItems = cartItemDao.getCartItemsByCartId(cart.getId());

        ModelAndView modelAndView = new ModelAndView("checkout");
        modelAndView.addObject("cartItems", cartItems);
        return modelAndView;
    }

    @PostMapping("/processPayment")
    public ModelAndView processPayment(@RequestParam("paymentMethod") int paymentMethod, HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("redirect:/login");
        }

        Cart cart = cartDao.getCartByUserId(user.getId());
        List<CartItem> cartItems = cartItemDao.getCartItemsByCartId(cart.getId());

        if (cartItems.isEmpty()) {
            return new ModelAndView("checkout").addObject("message", "Sepetinizde ürün bulunmamaktadır.");
        }

        double totalAmount = cartItems.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();

        Order order = new Order();
        order.setUserId(user.getId());
        order.setTotalAmount(totalAmount);
        order.setPaymentMethodId(paymentMethod);
        order.setStatus("Pending");
        order.setAddress("Default Address"); // Bu kısımda kullanıcının adres bilgisi alınmalıdır.

        orderDao.addOrder(order);

        for (CartItem cartItem : cartItems) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrderId(order.getId());
            orderDetail.setProductId(cartItem.getProductId());
            orderDetail.setQuantity(cartItem.getQuantity());
            orderDetail.setPrice(cartItem.getPrice());
            orderDao.addOrderDetail(orderDetail);
        }

        cartItemDao.clearCart(cart.getId());

        return new ModelAndView("redirect:/orderDetails/" + order.getId());
    }
}
