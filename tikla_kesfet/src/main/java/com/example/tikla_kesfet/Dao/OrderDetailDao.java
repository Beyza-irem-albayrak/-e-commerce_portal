package com.example.tikla_kesfet.Dao;

import com.example.tikla_kesfet.Model.OrderDetail;
import com.example.tikla_kesfet.Model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class OrderDetailDao {

    private static final String URL = "jdbc:mysql://localhost:3306/beyzschema";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "123456";

    @Autowired
    private ProductDao productDao;

    // Get all order details
    public List<OrderDetail> getAllOrderDetails() {
        List<OrderDetail> orderDetails = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM order_details")) {
            while (resultSet.next()) {
                OrderDetail orderDetail = new OrderDetail(
                        resultSet.getInt("id"),
                        resultSet.getInt("order_id"),
                        resultSet.getInt("product_id"),
                        resultSet.getInt("quantity"),
                        resultSet.getDouble("price")
                );
                Product product = productDao.getProductById(orderDetail.getProductId());
                orderDetail.setProduct(product);
                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    // Get order details by order ID
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM order_details WHERE order_id = ?")) {
            statement.setInt(1, orderId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    OrderDetail orderDetail = new OrderDetail(
                            resultSet.getInt("id"),
                            resultSet.getInt("order_id"),
                            resultSet.getInt("product_id"),
                            resultSet.getInt("quantity"),
                            resultSet.getDouble("price")
                    );
                    Product product = productDao.getProductById(orderDetail.getProductId());
                    orderDetail.setProduct(product);
                    orderDetails.add(orderDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    // Add new order detail
    public void addOrderDetail(OrderDetail orderDetail) {
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("INSERT INTO order_details (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)")) {
            statement.setInt(1, orderDetail.getOrderId());
            statement.setInt(2, orderDetail.getProductId());
            statement.setInt(3, orderDetail.getQuantity());
            statement.setDouble(4, orderDetail.getPrice());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update order detail
    public void updateOrderDetail(OrderDetail orderDetail) {
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("UPDATE order_details SET order_id = ?, product_id = ?, quantity = ?, price = ? WHERE id = ?")) {
            statement.setInt(1, orderDetail.getOrderId());
            statement.setInt(2, orderDetail.getProductId());
            statement.setInt(3, orderDetail.getQuantity());
            statement.setDouble(4, orderDetail.getPrice());
            statement.setInt(5, orderDetail.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete order detail
    public void deleteOrderDetail(int id) {
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("DELETE FROM order_details WHERE id = ?")) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
