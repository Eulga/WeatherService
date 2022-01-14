package pickmeal.dream.test.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class MenuDaoImpl {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<String> findMenuByWeather(int temperature, int sky) {
		String sql = "SELECT menuName FROM WeatherMenu WHERE weather_temp = ? AND weather_sky = ?";
		return jdbcTemplate.query(sql, getRowMapper() , temperature, sky);
	}

	private RowMapper<String> getRowMapper() {
		return new RowMapper<String>() {
			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString("menuName");
			}
		};
	}
}
