package com.example.tikla_kesfet.Model;

import java.util.List;

public class Cart {
    private int id;
    private int userId;
    private List<CartItem> cartItems;

    // Constructors
    public Cart() {}

    public Cart(int id, int userId) {
        this.id = id;
        this.userId = userId;
    }

    public Cart(int id, int userId, List<CartItem> cartItems) {
        this.id = id;
        this.userId = userId;
        this.cartItems = cartItems;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public void addCartItem(CartItem item) {
        this.cartItems.add(item);
    }

    public void removeCartItem(CartItem item) {
        this.cartItems.remove(item);
    }
}
