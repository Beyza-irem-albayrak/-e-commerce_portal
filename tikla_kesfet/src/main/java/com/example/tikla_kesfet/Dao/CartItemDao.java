package com.example.tikla_kesfet.Dao;

import com.example.tikla_kesfet.Model.CartItem;
import com.example.tikla_kesfet.Model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartItemDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private ProductDao productDao;

    // Get all cart items
    public List<CartItem> getAllCartItems() {
        String sql = "SELECT * FROM cart_items";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            CartItem cartItem = new CartItem(
                rs.getInt("id"),
                rs.getInt("cart_id"),
                rs.getInt("product_id"),
                rs.getInt("quantity"),
                rs.getDouble("price")
            );
            Product product = productDao.getProductById(rs.getInt("product_id"));
            cartItem.setProduct(product);
            return cartItem;
        });
    }

    // Get cart items by cart ID
    public List<CartItem> getCartItemsByCartId(int cartId) {
        String sql = "SELECT * FROM cart_items WHERE cart_id = ?";
        return jdbcTemplate.query(sql, new Object[]{cartId}, (rs, rowNum) -> {
            CartItem cartItem = new CartItem(
                rs.getInt("id"),
                rs.getInt("cart_id"),
                rs.getInt("product_id"),
                rs.getInt("quantity"),
                rs.getDouble("price")
            );
            Product product = productDao.getProductById(rs.getInt("product_id"));
            cartItem.setProduct(product);
            return cartItem;
        });
    }

    // Get cart item by cart ID and product ID
    public CartItem getCartItemByCartIdAndProductId(int cartId, int productId) {
        String sql = "SELECT * FROM cart_items WHERE cart_id = ? AND product_id = ?";
        List<CartItem> results = jdbcTemplate.query(sql, new Object[]{cartId, productId}, (rs, rowNum) -> {
            CartItem cartItem = new CartItem(
                rs.getInt("id"),
                rs.getInt("cart_id"),
                rs.getInt("product_id"),
                rs.getInt("quantity"),
                rs.getDouble("price")
            );
            Product product = productDao.getProductById(rs.getInt("product_id"));
            cartItem.setProduct(product);
            return cartItem;
        });
        // Return the first result if found, otherwise null
        return results.isEmpty() ? null : results.get(0);
    }

    // Add new cart item
    public void addCartItem(CartItem cartItem) {
        String sql = "INSERT INTO cart_items (cart_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, cartItem.getCartId(), cartItem.getProductId(), cartItem.getQuantity(), cartItem.getPrice());
    }

    // Update cart item
    public void updateCartItem(CartItem cartItem) {
        String sql = "UPDATE cart_items SET quantity = ?, price = ? WHERE cart_id = ? AND product_id = ?";
        jdbcTemplate.update(sql, cartItem.getQuantity(), cartItem.getPrice(), cartItem.getCartId(), cartItem.getProductId());
    }

    // Delete cart item
    public void deleteCartItem(int cartId, int productId) {
        String sql = "DELETE FROM cart_items WHERE cart_id = ? AND product_id = ?";
        jdbcTemplate.update(sql, cartId, productId);
    }

    // Clear all items in a cart
    public void clearCart(int cartId) {
        String sql = "DELETE FROM cart_items WHERE cart_id = ?";
        jdbcTemplate.update(sql, cartId);
    }
}
