package com.example.tikla_kesfet.Dao;

import com.example.tikla_kesfet.Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Get all users
    public List<User> getAllUsers() {
        String sql = "SELECT * FROM users";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new User(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("role"),
                rs.getInt("cart_id")
        ));
    }

    // Get user by ID
    public User getUserById(int id) {
        String sql = "SELECT * FROM users WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> new User(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("role"),
                rs.getInt("cart_id")
        ));
    }

    // Add new user
    public int addUser(User user) {
        String sql = "INSERT INTO users (name, email, password, role, cart_id) VALUES (?, ?, ?, ?, ?)";
        KeyHolder keyHolder = new GeneratedKeyHolder(); // To hold the generated keys
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());
            ps.setInt(5, user.getCartId());
            return ps;
        }, keyHolder);

        // Retrieve and return the generated ID
        return keyHolder.getKey().intValue();
    }

    // Update user
    public void updateUser(User user) {
        String sql = "UPDATE users SET name = ?, email = ?, password = ?, role = ?, cart_id = ? WHERE id = ?";
        jdbcTemplate.update(sql, user.getName(), user.getEmail(), user.getPassword(), user.getRole(), user.getCartId(), user.getId());
    }

    // Delete associated cart entries for user
    public void deleteUserAssociatedData(int userId) {
        String deleteCartSql = "DELETE FROM carts WHERE user_id = ?";
        jdbcTemplate.update(deleteCartSql, userId);

        // Diğer ilişkili veriler için gerekli silme işlemlerini ekleyin
    }

    // Delete user
    public void deleteUser(int id) {
        deleteUserAssociatedData(id);  // İlk olarak ilişkili verileri sil
        String sql = "DELETE FROM users WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    // Get user by email
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{email}, (rs, rowNum) -> new User(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("role"),
                rs.getInt("cart_id")
        ));
    }

    // Get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{email, password}, (rs, rowNum) -> new User(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("role"),
                rs.getInt("cart_id")
        ));
    }
}
