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
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="nowHour"><fmt:formatDate value="${now}" pattern="HH" /></c:set>
	
	<div id="weatherWrap">
        <div id="weather">
            <img src="https://img.icons8.com/dusk/128/000000/sun--v1.png"/>
            <div class="temperatureWrap"><span class="temperature">${weather.temperature }</span><span class="symbol">&#8451;</span></div>
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