package vn.vvm1004.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import vn.vvm1004.laptopshop.domain.Product;
import vn.vvm1004.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public List<Product> getProductsByName(String name) {
        return this.productRepository.findOneByName(name);
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public Product createProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Product updateProduct(Product product) {
        return this.productRepository.save(product);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

}
