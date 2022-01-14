package pickmeal.dream.test.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import pickmeal.dream.test.dao.MenuDaoImpl;
import pickmeal.dream.test.service.WeatherService;

/**
 * @author 재익
 */

@Configuration
@ComponentScan(basePackages = "pickmeal.daream.test")
@EnableTransactionManagement
@Import(DataSourceConfig.class)
public class WeatherConfig {
	
	@Bean
	public WeatherService weatherService() {
		return new WeatherService();
	}
	
	@Bean
	public MenuDaoImpl menuDaoImpl() {
		return new MenuDaoImpl();
	}
}
