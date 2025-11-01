package vn.vvm1004.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.vvm1004.laptopshop.domain.Role;
import vn.vvm1004.laptopshop.domain.User;
import vn.vvm1004.laptopshop.repository.RoleRepository;
import vn.vvm1004.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public String handleHello() {
        return "Hello from service";
    }

    public List<User> getAllUsers() {
        System.out.println("Get all users");
        return this.userRepository.findAll();
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User handleSaveUser(User user) {
        User vvm1004 = this.userRepository.save(user);
        System.out.println("Saved user: " + vvm1004);
        return vvm1004;
    }

    public void deleteUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

}
