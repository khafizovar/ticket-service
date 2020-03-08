package ru.innopolis;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@SpringBootApplication
@Configuration
public class Application implements WebMvcConfigurer {

    public static void main(String[] args) {
        SpringApplication.run(Application.class);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        if(System.getProperty("os.name").toLowerCase().indexOf("linux") > -1) {
            registry.addResourceHandler("/**")
                    .addResourceLocations("file:" + System.getProperty("user.dir") + "dist/tickets-service/");
        } else if(System.getProperty("os.name").toLowerCase().indexOf("windows") > -1) {
            registry.addResourceHandler("/**")
                    .addResourceLocations("file:///" + System.getProperty("user.dir").substring(0, System.getProperty("user.dir").lastIndexOf('\\')) + "/tickets-service-front/dist/tickets-service/");
        }
    }
}

