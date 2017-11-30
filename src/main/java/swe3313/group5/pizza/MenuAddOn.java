package swe3313.group5.pizza;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class MenuAddOn {
    @Id
    private Integer id;
    private String name;
    @Column(precision = 19, scale = 4)
    private Double amount;
}
