package com.example.tikla_kesfet.Dao;

import com.example.tikla_kesfet.Model.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.dao.EmptyResultDataAccessException;

import java.util.List;

@Repository
public class CartDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Get all carts
    public List<Cart> getAllCarts() {
        String sql = "SELECT * FROM carts";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new Cart(
                rs.getInt("id"),
                rs.getInt("user_id")
        ));
    }

    // Get cart by ID
    public Cart getCartById(int id) {
        String sql = "SELECT * FROM carts WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> new Cart(
                rs.getInt("id"),
                rs.getInt("user_id")
        ));
    }

    // Add new cart
    public void addCart(Cart cart) {
        String sql = "INSERT INTO carts (user_id) VALUES (?)";
        jdbcTemplate.update(sql, cart.getUserId());
    }

    // Get cart by user ID
    public Cart getCartByUserId(int userId) {
        String sql = "SELECT * FROM carts WHERE user_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{userId}, (rs, rowNum) -> new Cart(
                    rs.getInt("id"),
                    rs.getInt("user_id")
            ));
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    // Update cart
    public void updateCart(Cart cart) {
        String sql = "UPDATE carts SET user_id = ? WHERE id = ?";
        jdbcTemplate.update(sql, cart.getUserId(), cart.getId());
    }

    // Delete cart
    public void deleteCart(int id) {
        String sql = "DELETE FROM carts WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
