package com.louis.kitty.backup;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages={"com.louis.kitty"})
public class KittyBackupApplication {

	public static void main(String[] args) {
		SpringApplication.run(KittyBackupApplication.class, args);
	}
}
