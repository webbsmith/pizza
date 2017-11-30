package swe3313.group5.pizza;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@RepositoryRestResource(collectionResourceRel = "menu", path = "menu")
@CrossOrigin
public interface MenuRepository extends PagingAndSortingRepository<MenuItem, Integer> {
}
