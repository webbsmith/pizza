package swe3313.group5.pizza;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@RepositoryRestResource(collectionResourceRel = "order", path = "order")
@CrossOrigin
public interface OrderRepository extends PagingAndSortingRepository<CustomerOrder, Integer> {
}
