package swe3313.group5.pizza;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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
}
