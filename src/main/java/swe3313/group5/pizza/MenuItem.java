package swe3313.group5.pizza;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Data
public class MenuItem {
    @Id
    private Integer id;
    private String name;
    @Column(precision = 19, scale = 4)
    private Double amount;
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "menu_item_available_add_on", joinColumns = @JoinColumn(name = "menu_item_id"), inverseJoinColumns = @JoinColumn(name = "menu_add_on_id"))
    private List<MenuAddOn> availableAddOns;
}
