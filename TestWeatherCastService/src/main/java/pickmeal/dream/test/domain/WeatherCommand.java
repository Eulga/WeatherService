package pickmeal.dream.test.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WeatherCommand {
	private int temperature;
	private int sky;
	private String menuName;
}

