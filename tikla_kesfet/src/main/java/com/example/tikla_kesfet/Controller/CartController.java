package com.example.tikla_kesfet.Controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.tikla_kesfet.Dao.CartDao;
import com.example.tikla_kesfet.Dao.CartItemDao;
import com.example.tikla_kesfet.Dao.ProductDao;
import com.example.tikla_kesfet.Model.Cart;
import com.example.tikla_kesfet.Model.CartItem;
import com.example.tikla_kesfet.Model.Product;
import com.example.tikla_kesfet.Model.User;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartDao cartDao;

    @Autowired
    private CartItemDao cartItemDao;

    @Autowired
    private ProductDao productDao;

    @GetMapping
    public ModelAndView viewCart(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("redirect:/login");
        }

        Cart cart = cartDao.getCartByUserId(user.getId());
        List<CartItem> cartItems = (cart != null) ? cartItemDao.getCartItemsByCartId(cart.getId()) : null;

        ModelAndView modelAndView = new ModelAndView("cart");
        modelAndView.addObject("cartItems", cartItems);
        return modelAndView;
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam("productId") int productId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Cart cart = cartDao.getCartByUserId(user.getId());
        if (cart == null) {
            cart = new Cart();
            cart.setUserId(user.getId());
            cartDao.addCart(cart);
        }

        CartItem cartItem = cartItemDao.getCartItemByCartIdAndProductId(cart.getId(), productId);
        if (cartItem == null) {
            Product product = productDao.getProductById(productId);
            if (product != null) {
                cartItem = new CartItem(cart.getId(), productId, 1, product.getPrice().doubleValue());
                cartItemDao.addCartItem(cartItem);
            } else {
                return "redirect:/"; // Ürün bulunamazsa anasayfaya yönlendir
            }
        } else {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
            cartItemDao.updateCartItem(cartItem);
        }

        return "redirect:/cart";
    }

    @PostMapping("/remove")
    public String removeCartItem(@RequestParam("productId") int productId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Cart cart = cartDao.getCartByUserId(user.getId());
        if (cart != null) {
            cartItemDao.deleteCartItem(cart.getId(), productId);
        }
        return "redirect:/cart";
    }

    @PostMapping("/update")
    public String updateCartItem(@RequestParam("productId") int productId, @RequestParam("quantity") int quantity, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Cart cart = cartDao.getCartByUserId(user.getId());
        CartItem cartItem = cartItemDao.getCartItemByCartIdAndProductId(cart.getId(), productId);
        if (cartItem != null) {
            cartItem.setQuantity(quantity);
            cartItemDao.updateCartItem(cartItem);
        }

        return "redirect:/cart";
    }
}
