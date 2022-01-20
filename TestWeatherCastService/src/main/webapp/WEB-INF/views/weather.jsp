<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨와 날씨에 따른 메뉴 추천</title>
<link href="${pageContext.request.contextPath}/resources/css/weather.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<c:set var="today" value="<%=new java.util.Date()%>" />
	<c:set var="now"><fmt:formatDate value="${today}" pattern="HH" /></c:set>
	
	<div id="weatherWrap">
		        <div id="weather">
		            <c:choose>
		        		<c:when test="${weather.sky eq 1 }">
		        			<c:if test="${now gt 6 && now lt 18}">
			            		<img src="${pageContext.request.contextPath}/resources/img/weather/icons8_sun.gif"/>
		        			</c:if>
		        			<c:if test="${now ge 18 || now le 6 }">
			            		<img src="${pageContext.request.contextPath}/resources/img/weather/icons8_moon_and_stars_64.png"/>
		        			</c:if>
		        		</c:when>
		        		<c:when test="${weather.sky eq 2 }">
		        			<img src="${pageContext.request.contextPath}/resources/img/weather/icons8_cloud_64.png"/>
		        		</c:when>
		        		<c:when test="${weather.sky eq 3 }">
		        			<img src="${pageContext.request.contextPath}/resources/img/weather/icons8_rain.gif"/>
		        		</c:when>
		        		<c:when test="${weather.sky eq 4 }">
		        			<img src="${pageContext.request.contextPath}/resources/img/weather/icons8_snow_64.png"/>
		        		</c:when>
		        	</c:choose>
		            <div class="temperatureWrap"><span class="temperature">${weather.temperature }</span><span class="symbol">&#8451;</span></div>
		        </div>
		        <div id="forecast">
		        	<c:forEach var="forecastItem" items="${forecast.pmwList}" varStatus="timeOrder" >
		        		<div class="forecastItem">
		        			<span>
		        				<c:if test="${timeOrder.index eq 0 }">오전 8시</c:if>
		        				<c:if test="${timeOrder.index eq 1 }">오후 12시</c:if>
		        				<c:if test="${timeOrder.index eq 2 }">오후 18시</c:if>
		        				<c:if test="${timeOrder.index eq 3 }">오후 22시</c:if>
			                </span>
			        		<c:if test="${forecastItem.sky eq 1 }">
		        				<c:if test="${timeOrder.index gt 1 }"> <!-- 1보다 큰 = 오후18시 오후22시 -->
		        					<img src="${pageContext.request.contextPath}/resources/img/weather/icons8_moon_and_stars_64.png"/>
		        				</c:if>
		        				<c:if test="${timeOrder.index lt 2 }"> <!-- 2보다 작은 = 오전8시 오후12시 -->
			            			<img src="${pageContext.request.contextPath}/resources/img/weather/icons8_sun.gif"/>
		        				</c:if>
			        		</c:if>
			        		<c:if test="${forecastItem.sky eq 2 }">
			        			<img src="${pageContext.request.contextPath}/resources/img/weather/icons8_cloud_64.png"/>
			        		</c:if>
			        		<c:if test="${forecastItem.sky eq 3 }">
			        			<img src="${pageContext.request.contextPath}/resources/img/weather/icons8_rain.gif"/>
			        		</c:if>
			        		<c:if test="${forecastItem.sky eq 4 }">
			        			<img src="${pageContext.request.contextPath}/resources/img/weather/icons8_snow_64.png"/>
			        		</c:if>
			                <div class="temperatureWrap">
			                	<span class="temperature">${forecastItem.temperature }</span><span class="symbol">&#8451;</span>
			                </div>
		            	</div>
		        	</c:forEach>
		        </div>
		        <div id="howAboutThis">
		        	<c:choose>
		        		<c:when test="${weather.sky eq 1 }">
		        			맑고
		        		</c:when>
		        		<c:when test="${weather.sky eq 2 }">
		        			흐리고
		        		</c:when>
		        		<c:when test="${weather.sky eq 3 }">
		        			비오고
		        		</c:when>
		        		<c:when test="${weather.sky eq 4 }">
		        			눈오고
		        		</c:when>
		        	</c:choose>
		        	<c:choose>
		        		<c:when test="${weather.temperature lt 10 }">
		        			춥네
		        		</c:when>
		        		<c:when test="${weather.temperature gt 25 }">
		        			덥네
		        		</c:when>
		        		<c:otherwise>
		        			적당하네
		        		</c:otherwise>
		        	</c:choose>
		        	이거 어때?
		        </div>
		        <div id="wetherMenu">
		            <img src="https://img.icons8.com/dusk/64/000000/sun--v2.png"/>
		            <span class="weatherMenuName">${menu }</span>
		        </div>
		    </div>
    <a id="ajax_test" href="goHome">이동</a>
    <input id="ajax_btn" type="button" value="버튼">
</body>

<script type="text/javascript">
	$('#ajax_test').on('click', function(e) {
		e.preventDefault();
		var url = $(this).attr('href');
        $.ajax({
        	url : url,
            async : true,
            type : "GET",
            success : function(data) {
            	// Contents 영역 삭제
                $('#weatherWrap').children().remove();
                // Contents 영역 교체
                $('#weatherWrap').html(data);
                changeUrl('','',url);
            }
        });
	})
	function changeUrl(state, title, url) { 
		if (typeof (history.pushState) != "undefined") { //브라우저가 지원하는 경우 
			history.pushState(state, title, url);
		} else { 
			location.href = url; //브라우저가 지원하지 않는 경우 페이지 이동처리
		}
	}

</script>
</html>