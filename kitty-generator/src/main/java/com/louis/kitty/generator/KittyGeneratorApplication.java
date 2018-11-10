package com.louis.kitty.generator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 启动器
 * @author Louis
 * @date Nov 9, 2018
 */
@SpringBootApplication(scanBasePackages={"com.louis"})
public class KittyGeneratorApplication {

	public static void main(String[] args) {
		SpringApplication.run(KittyGeneratorApplication.class, args);
	}
}