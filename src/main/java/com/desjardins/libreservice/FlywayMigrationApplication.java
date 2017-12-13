package com.desjardins.libreservice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Arrays;

@SpringBootApplication
public class FlywayMigrationApplication implements CommandLineRunner {
	private static final Logger logger = LoggerFactory.getLogger(FlywayMigrationApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(FlywayMigrationApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		logger.info("Application started with command-line arguments: {} . \n To kill this application, press Ctrl + C.", Arrays.toString(args));
	}
}
