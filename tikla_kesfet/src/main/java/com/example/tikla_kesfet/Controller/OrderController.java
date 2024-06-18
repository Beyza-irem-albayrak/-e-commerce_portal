package com.example.tikla_kesfet.Controller;

import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.tikla_kesfet.Dao.OrderDao;
import com.example.tikla_kesfet.Dao.OrderDetailDao;
import com.example.tikla_kesfet.Dao.CartDao;
import com.example.tikla_kesfet.Dao.CartItemDao;
import com.example.tikla_kesfet.Model.Order;
import com.example.tikla_kesfet.Model.OrderDetail;
import com.example.tikla_kesfet.Model.CartItem;
import com.example.tikla_kesfet.Model.User;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private OrderDetailDao orderDetailDao;

    @Autowired
    private CartDao cartDao;

    @Autowired
    private CartItemDao cartItemDao;

    @PostMapping("/checkout")
    public ModelAndView checkout(@RequestParam("address") String address,
                                 @RequestParam("paymentMethod") int paymentMethod,
                                 HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("redirect:/login");
        }

        List<CartItem> cartItems = cartItemDao.getCartItemsByCartId(cartDao.getCartByUserId(user.getId()).getId());
        if (cartItems == null || cartItems.isEmpty()) {
            return new ModelAndView("redirect:/cart");
        }

        Order order = new Order();
        order.setUserId(user.getId());
        order.setTotalAmount(cartItems.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum());
        order.setCreatedAt(LocalDateTime.now());
        order.setPaymentMethodId(paymentMethod);
        order.setStatus("Pending");
        order.setAddress(address);
        orderDao.addOrder(order);

        for (CartItem cartItem : cartItems) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrderId(order.getId());
            orderDetail.setProductId(cartItem.getProductId());
            orderDetail.setQuantity(cartItem.getQuantity());
            orderDetail.setPrice(cartItem.getPrice());
            orderDetailDao.addOrderDetail(orderDetail);
        }

        // Sepeti temizle
        cartItemDao.clearCart(cartDao.getCartByUserId(user.getId()).getId());

        ModelAndView modelAndView = new ModelAndView("orderConfirmation");
        modelAndView.addObject("order", order);
        modelAndView.addObject("orderDetails", orderDetailDao.getOrderDetailsByOrderId(order.getId()));

        return modelAndView;
    }

    @GetMapping("/myOrders")
    public ModelAndView myOrders(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("redirect:/login");
        }

        List<Order> orders = orderDao.getOrdersByUserId(user.getId());
        for (Order order : orders) {
            order.setOrderDetails(orderDetailDao.getOrderDetailsByOrderId(order.getId()));
        }

        ModelAndView modelAndView = new ModelAndView("profile");
        modelAndView.addObject("orders", orders);
        return modelAndView;
    }
}
