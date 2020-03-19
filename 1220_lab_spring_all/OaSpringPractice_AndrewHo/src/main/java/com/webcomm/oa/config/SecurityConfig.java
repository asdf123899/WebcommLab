package com.webcomm.oa.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
 
    @Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
          .withUser("user1").password(passwordEncoder().encode("password")).roles("USER")
          .and()
          .withUser("user2").password(passwordEncoder().encode("password")).roles("AUDIT")
          .and()
          .withUser("admin").password(passwordEncoder().encode("password")).roles("ADMIN", "USER");
    }
 
    @Bean
    public PasswordEncoder passwordEncoder() {
    	return NoOpPasswordEncoder.getInstance();
    }
    
    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http
          .csrf().disable()
          .authorizeRequests()
          .antMatchers("/index").permitAll()
          .antMatchers("/login").permitAll()
          .antMatchers("/scheduleEmail").permitAll()
          .antMatchers("/css/**").permitAll()
          .antMatchers("/js/**").permitAll()
          .antMatchers("/img/**").permitAll()
          .antMatchers("/**/doPrint").hasRole("ADMIN")
          .antMatchers("/**").hasRole("USER")
          .anyRequest().authenticated()
	      .and()
		  .formLogin() //若未不符合authorize條件，則產生預設login表單
		  .and()
		  .httpBasic() //產生基本表單
		  .and()
		  .logout()
		  .logoutSuccessUrl("/index"); 
    }
}