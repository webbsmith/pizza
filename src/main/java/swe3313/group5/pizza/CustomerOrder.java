package swe3313.group5.pizza;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Data
@ToString(exclude = "customer")
public class CustomerOrder {
    @Id
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    private String paymentMethod;
    @Column(precision = 19, scale = 4)
    private Double amount;
    private String notes;
    private Date time;
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "customer_order_item", joinColumns = @JoinColumn(name = "customer_order_id"), inverseJoinColumns = @JoinColumn(name = "order_item_id"))
    private List<OrderItem> orderItems;
}
