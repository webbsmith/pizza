package swe3313.group5.pizza;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Data
public class OrderItem {
    @Id
    private Integer id;
    @OneToOne
    @JoinColumn(name = "menu_item_id")
    private MenuItem menuItem;
    private Integer quantity;
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "order_item_add_on", joinColumns = @JoinColumn(name = "order_item_id"), inverseJoinColumns = @JoinColumn(name = "menu_add_on_id"))
    private List<MenuAddOn> addOns;
}
