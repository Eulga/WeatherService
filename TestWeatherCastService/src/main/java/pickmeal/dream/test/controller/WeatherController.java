package pickmeal.dream.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import pickmeal.dream.test.domain.MyLocation;
import pickmeal.dream.test.domain.Weather;
import pickmeal.dream.test.domain.WeatherCommand;
import pickmeal.dream.test.service.WeatherService;

@Controller
public class WeatherController {
	
	@Autowired
	private WeatherService weatherService;
	
	@GetMapping("/weather")
	public ModelAndView weather() {
		ModelAndView mav = new ModelAndView();
		Weather weather = weatherService.getWeather(new MyLocation("89", "90"));
		WeatherCommand wc = weatherService.getPickMealTypeWeather(weather);
		weatherService.getMenuDependingOnTheWeather(wc);
		
		mav.addObject("weather", wc);
		mav.setViewName("weather");
		return mav;
	}
	
	@GetMapping("/goHome")
	public String goHome(Model model) {
		String abc = "데이터도 넘어갑니다";
		model.addAttribute("abc", abc);
		return "home";
	}
}