package com.louis.kitty.boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages={"com.louis.kitty"})
public class KittyApplication {

	public static void main(String[] args) {
		SpringApplication.run(KittyApplication.class, args);
	}
}
