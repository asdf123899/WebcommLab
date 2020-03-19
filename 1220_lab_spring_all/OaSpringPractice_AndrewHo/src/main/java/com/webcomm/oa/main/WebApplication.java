package com.webcomm.oa.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.thymeleaf.dialect.springdata.SpringDataDialect;

@SpringBootApplication
@ComponentScan(basePackages = { "com.webcomm.oa.controller", "com.webcomm.oa.service", "com.webcomm.oa.config", "com.webcomm.oa.batch.*" })
@EnableJpaRepositories(basePackages = {
		"com.webcomm.oa.repository" }, excludeFilters = @Filter(type = FilterType.REGEX, pattern = "com.webcomm.oa.repository.*.BaseRepository"))
@EntityScan(basePackages = { "com.webcomm.oa.domain" })
@EnableTransactionManagement
public class WebApplication {

	
	public static void main(String[] args) {
		SpringApplication.run(WebApplication.class, args);
	}
	
	@Bean
    public SpringDataDialect springDataDialect() {
        return new SpringDataDialect();
    }

}
