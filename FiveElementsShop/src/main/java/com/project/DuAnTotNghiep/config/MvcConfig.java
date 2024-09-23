package com.project.DuAnTotNghiep.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.thymeleaf.extras.java8time.dialect.Java8TimeDialect;

import java.nio.file.Path;
import java.nio.file.Paths;


// Đây là tệp cấu hình Spring MVC trong ứng dụng Spring Boot.
// Phương thức addResourceHandlers cấu hình các bộ sử lý tài nguyên để phục vụ các tài nguyên tĩnh như hình ảnh, css,javascript.
// Phương thức addCorMappings cấu hình CORS(Cross-Origin Resource Sharing) để cho phép hoặc hạn chế các yêu cầu từ các nguồn gốc khác nhau.
// Phương thức exposeDirectory thêm các thư mục cụ thể vào bộ xử lý tài nguyên

@Configuration
public class MvcConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        exposeDirectory("uploads", registry);
        exposeDirectory("upload-barcode", registry);
    }
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*") // Allow requests from any origin
                .allowedMethods("GET", "POST", "PUT", "DELETE")
                .allowedHeaders("*")
                .allowCredentials(true);
    }

    private void exposeDirectory(String pathPattern, ResourceHandlerRegistry registry) {
        Path path = Paths.get(pathPattern);
        String absolutePath = path.toFile().getAbsolutePath();
        String logicalPath = pathPattern.replace("../", "") + "/**";
        registry.addResourceHandler(logicalPath).addResourceLocations("file:/" + absolutePath + "/");
    }

}
