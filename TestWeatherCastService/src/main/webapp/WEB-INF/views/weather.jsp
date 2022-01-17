<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨와 날씨에 따른 메뉴 추천</title>
<link href="${pageContext.request.contextPath}/resources/css/weather.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="nowHour"><fmt:formatDate value="${now}" pattern="HH" /></c:set>
	
	<div id="weatherWrap">
        <div id="weather">
            <img src="https://img.icons8.com/dusk/128/000000/sun--v1.png"/>
            <div class="temperatureWrap"><span class="temperature">9</span><span class="symbol">&#8451;</span></div>
        </div>
        <div id="forecast">
            <div class="forecastItem">
                <span>오전 8시</span>
                <img src="https://img.icons8.com/dusk/64/000000/sun--v2.png"/>
                <div class="temperatureWrap"><span class="temperature">2</span><span class="symbol">&#8451;</span></div>
            </div>
            <div class="forecastItem">
                <span>오후 12시</span>
                <img src="https://img.icons8.com/dusk/64/000000/sun--v2.png"/>
                <div class="temperatureWrap"><span class="temperature">13</span><span class="symbol">&#8451;</span></div>
            </div>
            <div class="forecastItem">
                <span>오후 18시</span>
                <img src="https://img.icons8.com/dusk/64/000000/sun--v2.png"/>
                <div class="temperatureWrap"><span class="temperature">11</span><span class="symbol">&#8451;</span></div>
            </div>
            <div class="forecastItem">
                <span>오후 22시</span>
                <img src="https://img.icons8.com/dusk/64/000000/sun--v2.png"/>
                <div class="temperatureWrap"><span class="temperature">3</span><span class="symbol">&#8451;</span></div>
            </div>
        </div>
        <div id="howAboutThis">
            맑고 춥네 이거 어때?
        </div>
        <div id="wetherMenu">
            <img src="https://img.icons8.com/dusk/64/000000/sun--v2.png"/>
            <span class="weatherMenuName">음식이름</span>
        </div>
    </div>
</body>
</html>