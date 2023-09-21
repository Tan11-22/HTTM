package ptithcm.WebMovie.Security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
        return http
                .authorizeRequests(authorizeRequests ->
                        authorizeRequests
                                .requestMatchers("/**")
                                .permitAll()
                )
                .build();

    }
//    @Bean
//    public WebSecurityCustomizer webSecurityCustomizer() throws Exception {
//        return (web) -> web.ignoring().requestMatchers("/resources/static/**");
//    }
}