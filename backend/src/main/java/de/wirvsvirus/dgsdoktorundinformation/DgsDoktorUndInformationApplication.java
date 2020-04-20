package de.wirvsvirus.dgsdoktorundinformation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@EnableAutoConfiguration
@SpringBootApplication
public class DgsDoktorUndInformationApplication extends SpringBootServletInitializer {

	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(DgsDoktorUndInformationApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(DgsDoktorUndInformationApplication.class, args);
	}

}
