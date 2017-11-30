package swe3313.group5.pizza;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
public class Customer {
    @Id
    private Integer id;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String cardType;
    @ManyToOne
    @JoinColumn(name = "address_id")
    private Address address;
    @OneToMany(mappedBy = "customer")
    private List<CustomerOrder> orders;
}
