package vn.vvm1004.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.vvm1004.laptopshop.domain.Product;
import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product vvm1004);

    List<Product> findOneByName(String name);

    List<Product> findAll();

    Optional<Product> findById(long id);

    void deleteById(long id);
}
