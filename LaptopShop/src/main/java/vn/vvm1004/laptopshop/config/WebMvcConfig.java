package vn.vvm1004.laptopshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {
    @Bean
    public ViewResolver viewResolver() {
        final InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/view/");
        bean.setSuffix(".jsp");
        return bean;
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.viewResolver(viewResolver());
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Serve static resources từ classpath:/static/
        registry.addResourceHandler("/css/**")
                .addResourceLocations(
                        "/WEB-INF/resources/css/",
                        "classpath:/static/css/");
        registry.addResourceHandler("/js/**")
                .addResourceLocations(
                        "/WEB-INF/resources/js/",
                        "classpath:/static/js/");
        // Serve uploaded images from uploads folder
        registry.addResourceHandler("/images/**")
                .addResourceLocations(
                        "file:uploads/images/",
                        "/WEB-INF/resources/images/",
                        "classpath:/static/images/");
    }
}
