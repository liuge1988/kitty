package com.louis.kitty.backup;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages={"com.louis.kitty"})
public class KittyBackupApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(KittyBackupApplication.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(KittyBackupApplication.class, args);
	}
}