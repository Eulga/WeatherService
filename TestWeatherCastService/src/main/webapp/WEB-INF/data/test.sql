drop table WeatherMenu;

CREATE TABLE WeatherMenu (
	id				BIGINT			NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	menuName		VARCHAR(20)		NOT NULL,
	weather_temp	INT				NOT NULL,
	weather_sky		INT				NOT NULL
);

INSERT INTO WeatherMenu(menuName, weather_temp, weather_sky)
VALUES 
('테스트0-1', 0, 1),('테스트0-2', 0, 2),('테스트0-3', 0, 3),('테스트0-4', 0, 4),
('테스트1-1', 1, 1),('테스트1-2', 1, 2),('테스트1-3', 1, 3),('테스트1-4', 1, 4),
('테스트2-1', 2, 1),('테스트2-2', 2, 2),('테스트2-3', 2, 3),('테스트2-4', 2, 4);
