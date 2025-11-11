package vn.vvm1004.laptopshop.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import vn.vvm1004.laptopshop.domain.Role;
import vn.vvm1004.laptopshop.repository.RoleRepository;

@Component
public class DataInitializer implements CommandLineRunner {

    private final RoleRepository roleRepository;

    public DataInitializer(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        // Check and create USER role
        Role userRole = roleRepository.findByName("USER");
        if (userRole == null) {
            userRole = new Role();
            userRole.setName("USER");
            userRole.setDescription("Normal user role");
            roleRepository.save(userRole);
            System.out.println(">>>>>> Created USER role");
        }

        // Check and create ADMIN role
        Role adminRole = roleRepository.findByName("ADMIN");
        if (adminRole == null) {
            adminRole = new Role();
            adminRole.setName("ADMIN");
            adminRole.setDescription("Administrator role");
            roleRepository.save(adminRole);
            System.out.println(">>>>>> Created ADMIN role");
        }
    }
}
