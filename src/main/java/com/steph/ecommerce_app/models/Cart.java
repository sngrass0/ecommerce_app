package com.steph.ecommerce_app.models;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<Product> items;
    private float total;

    public Cart() {
        this.items = new ArrayList<>();
        this.total = 0;
    }

    public List<Product> getItems() {
        return this.items;
    }

    public void setItems(List<Product> products) {
        this.items = products;
    }

    public float getTotal() {
        return this.total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public void addCartItem(Product item) {
        this.items.add(item);
        this.setTotal(this.getTotal() + item.getPrice());
    }
    
    public void removeCartItem(Integer index) {
        for (int i = 0; i < items.size(); i++) {
            if (i == index) {
                this.setTotal(this.getTotal() - this.items.get(i).getPrice());
                this.items.remove(i);
                return;
            }
        }
    }

}
