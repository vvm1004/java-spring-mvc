package vn.vvm1004.laptopshop.controller.admin;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import vn.vvm1004.laptopshop.domain.User;
import vn.vvm1004.laptopshop.service.UserService;
import vn.vvm1004.laptopshop.service.UploadService;

import java.io.IOException;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomeHome(Model model) {
        List<User> users = this.userService.getAllUsersByEmail("cdcd@gmail.com");
        System.out.println("Users: " + users);
        String test = this.userService.handleHello();
        model.addAttribute("vvm1004", test);
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("vvm1004File") MultipartFile file) {
        try {
            String avatarPath = uploadService.uploadAvatar(file);
            if (avatarPath != null) {
                user.setAvatar(avatarPath);
            }
            String hashPassword = this.passwordEncoder.encode(user.getPassword());
            user.setPassword(hashPassword);
            user.setRole(this.userService.getRoleByName(user.getRole().getName()));
            userService.handleSaveUser(user);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserDetailPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User currentUser,
            @RequestParam("vvm1004File") MultipartFile file) {
        User existingUser = this.userService.getUserById(currentUser.getId());
        if (existingUser != null) {
            existingUser.setAddress(currentUser.getAddress());
            existingUser.setFullName(currentUser.getFullName());
            existingUser.setPhone(currentUser.getPhone());

            // Update avatar if new file is uploaded
            try {
                String avatarPath = uploadService.uploadAvatar(file);
                if (avatarPath != null) {
                    existingUser.setAvatar(avatarPath);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            // Update role if changed
            if (currentUser.getRole() != null && currentUser.getRole().getName() != null) {
                existingUser.setRole(this.userService.getRoleByName(currentUser.getRole().getName()));
            }

            this.userService.handleSaveUser(existingUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User eric) {
        this.userService.deleteUser(eric.getId());
        return "redirect:/admin/user";
    }

}
