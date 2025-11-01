package vn.vvm1004.laptopshop.service;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Objects;

@Service
public class UploadService {
    public String uploadAvatar(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty())
            return null;
        Path root = Paths.get("uploads", "images", "avatar").toAbsolutePath();
        Files.createDirectories(root);
        String original = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
        String filename = System.currentTimeMillis() + "-" + original;
        Path dest = root.resolve(filename);
        try (InputStream in = file.getInputStream()) {
            Files.copy(in, dest, StandardCopyOption.REPLACE_EXISTING);
        }
        return "/images/avatar/" + filename;
    }
}
