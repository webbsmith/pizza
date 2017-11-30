package swe3313.group5.pizza;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String houseNumber;
    private String street;
    private String city;
    private String state;
    private String postalCode;
    private String subdivision;
    private String closestMajorIntersection;
    private String deliveryNotes;
}
