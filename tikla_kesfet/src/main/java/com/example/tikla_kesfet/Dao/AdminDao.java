package com.example.tikla_kesfet.Dao;

import com.example.tikla_kesfet.Model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Get all admins
    public List<Admin> getAllAdmins() {
        String sql = "SELECT * FROM admins";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new Admin(
                rs.getInt("id"),
                rs.getString("email"),
                rs.getString("password")
        ));
    }

    // Get admin by ID
    public Admin getAdminById(int id) {
        String sql = "SELECT * FROM admins WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> new Admin(
                rs.getInt("id"),
                rs.getString("email"),
                rs.getString("password")
        ));
    }

    // Add new admin
    public void addAdmin(Admin admin) {
        String sql = "INSERT INTO admins (email, password) VALUES (?, ?)";
        jdbcTemplate.update(sql, admin.getEmail(), admin.getPassword());
    }

    // Update admin
    public void updateAdmin(Admin admin) {
        String sql = "UPDATE admins SET email = ?, password = ? WHERE id = ?";
        jdbcTemplate.update(sql, admin.getEmail(), admin.getPassword(), admin.getId());
    }

    // Delete admin
    public void deleteAdmin(int id) {
        String sql = "DELETE FROM admins WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    // Get admin by email
    public Admin getAdminByEmail(String email) {
        String sql = "SELECT * FROM admins WHERE email = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{email}, (rs, rowNum) -> new Admin(
                rs.getInt("id"),
                rs.getString("email"),
                rs.getString("password")
        ));
    }
}
