package com.example.tikla_kesfet.Dao;

import com.example.tikla_kesfet.Model.Order;
import com.example.tikla_kesfet.Model.OrderDetail;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class OrderDao {

    private static final String URL = "jdbc:mysql://localhost:3306/beyzschema";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "123456";

    // Get all orders
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM orders")) {
            while (resultSet.next()) {
                Order order = new Order(
                        resultSet.getInt("id"),
                        resultSet.getInt("user_id"),
                        resultSet.getDouble("total_amount"),
                        resultSet.getTimestamp("created_at").toLocalDateTime(),
                        resultSet.getInt("payment_method_id"),
                        resultSet.getString("status"),
                        resultSet.getString("address"),
                        getOrderDetailsByOrderId(resultSet.getInt("id"))
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Get order by ID
    public Order getOrderById(int id) {
        Order order = null;
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM orders WHERE id = ?")) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    order = new Order(
                            resultSet.getInt("id"),
                            resultSet.getInt("user_id"),
                            resultSet.getDouble("total_amount"),
                            resultSet.getTimestamp("created_at").toLocalDateTime(),
                            resultSet.getInt("payment_method_id"),
                            resultSet.getString("status"),
                            resultSet.getString("address"),
                            getOrderDetailsByOrderId(resultSet.getInt("id"))
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    // Get orders by user ID
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM orders WHERE user_id = ?")) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Order order = new Order(
                            resultSet.getInt("id"),
                            resultSet.getInt("user_id"),
                            resultSet.getDouble("total_amount"),
                            resultSet.getTimestamp("created_at").toLocalDateTime(),
                            resultSet.getInt("payment_method_id"),
                            resultSet.getString("status"),
                            resultSet.getString("address"),
                            getOrderDetailsByOrderId(resultSet.getInt("id"))
                    );
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Get order details by order ID
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {  // Bu yöntemi public yaptık
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
                    orderDetails.add(orderDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    // Add new order
    public void addOrder(Order order) {
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("INSERT INTO orders (user_id, total_amount, created_at, payment_method_id, status, address) VALUES (?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, order.getUserId());
            statement.setDouble(2, order.getTotalAmount());
            statement.setTimestamp(3, Timestamp.valueOf(order.getCreatedAt()));
            statement.setInt(4, order.getPaymentMethodId());
            statement.setString(5, order.getStatus());
            statement.setString(6, order.getAddress());
            statement.executeUpdate();

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    order.setId(generatedKeys.getInt(1));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
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

    // Update order
    public void updateOrder(Order order) {
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("UPDATE orders SET user_id = ?, total_amount = ?, created_at = ?, payment_method_id = ?, status = ?, address = ? WHERE id = ?")) {
            statement.setInt(1, order.getUserId());
            statement.setDouble(2, order.getTotalAmount());
            statement.setTimestamp(3, Timestamp.valueOf(order.getCreatedAt()));
            statement.setInt(4, order.getPaymentMethodId());
            statement.setString(5, order.getStatus());
            statement.setString(6, order.getAddress());
            statement.setInt(7, order.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete order
    public void deleteOrder(int id) {
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("DELETE FROM orders WHERE id = ?")) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
