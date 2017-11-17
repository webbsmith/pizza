package swe3313.group5.pizza;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
public class CustomerOrder {
    @Id
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    private String paymentMethod;
    @Column(precision = 19, scale = 4)
    private Double amount;
    private Date time;
    private String description;
}
