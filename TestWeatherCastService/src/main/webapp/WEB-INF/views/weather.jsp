<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨와 날씨에 따른 메뉴 추천</title>
</head>
<body>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="nowHour"><fmt:formatDate value="${now}" pattern="HH" /></c:set>
	
	<div class="weatherWrapper">
		${weather.temperature }℃<br>
		<c:choose>
			<c:when test="${weather.sky eq 1}">
				<c:choose>
					<c:when test="${nowHour > 7 || nowHour < 18 }">
						<img src="https://img.icons8.com/nolan/64/smiling-sun.png"/>
					</c:when>
					<c:otherwise>
						<img src="https://img.icons8.com/nolan/64/bright-moon.png"/>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:when test="${weather.sky eq 2}">
				<img src="https://img.icons8.com/nolan/64/clouds.png"/>
			</c:when>
			<c:when test="${weather.sky eq 3}">
				<img src="https://img.icons8.com/nolan/64/rain.png"/>
			</c:when>
			<c:when test="${weather.sky eq 4}">
	  			<img src="https://img.icons8.com/nolan/64/snow.png"/>
			</c:when>
		</c:choose>
		${weather.menuName }
		<c:url value="/chat" />
	</div>
</body>
</html>