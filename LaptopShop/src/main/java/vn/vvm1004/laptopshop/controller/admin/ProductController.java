package vn.vvm1004.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.RequestParam;

import vn.vvm1004.laptopshop.domain.Product;
import vn.vvm1004.laptopshop.service.ProductService;
import vn.vvm1004.laptopshop.service.UploadService;

import java.io.IOException;
import java.util.List;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @RequestMapping("/admin/product")
    public String getProduct(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping(value = "/admin/product/create")
    public String createProduct(Model model,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam(value = "productFile", required = false) MultipartFile file) {

        // Validate
        if (newProductBindingResult.hasErrors()) {
            List<FieldError> errors = newProductBindingResult.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println(" >>>>>>> " + error.getField() + " - " + error.getDefaultMessage());
            }
            return "admin/product/create";
        }
        // Upload image if provided
        if (file != null && !file.isEmpty()) {
            try {
                String imagePath = uploadService.uploadProductImage(file);
                if (imagePath != null) {
                    product.setImage(imagePath);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // Save product
        productService.createProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetail(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.getProductById(id);
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam(value = "productFile", required = false) MultipartFile file) {

        // Validate
        if (newProductBindingResult.hasErrors()) {
            List<FieldError> errors = newProductBindingResult.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println(" >>>>>>> " + error.getField() + " - " + error.getDefaultMessage());
            }
            return "admin/product/update";
        }

        Product existingProduct = this.productService.getProductById(product.getId());
        if (existingProduct != null) {
            existingProduct.setName(product.getName());
            existingProduct.setPrice(product.getPrice());
            existingProduct.setDetailDesc(product.getDetailDesc());
            existingProduct.setShortDesc(product.getShortDesc());
            existingProduct.setQuantity(product.getQuantity());
            existingProduct.setFactory(product.getFactory());
            existingProduct.setTarget(product.getTarget());

            // Update image if new file is uploaded
            if (file != null && !file.isEmpty()) {
                try {
                    String imagePath = uploadService.uploadProductImage(file);
                    if (imagePath != null) {
                        existingProduct.setImage(imagePath);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            this.productService.updateProduct(existingProduct);
        }
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product product) {
        this.productService.deleteProduct(product.getId());
        return "redirect:/admin/product";
    }
}
