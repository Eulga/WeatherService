<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<style type="text/css">
		#home{
			width: 100%;
			height: 100%;
			word-break: break-all;
		}
	</style>
</head>
<body>
<div id="home">
	<h1>
		Hello world!  
	</h1>
	
	<P>  The time on the server is ${serverTime}. </P>
	<p> ${abc } </p>
	<p> loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong </p>
</div>

<c:import url="/weather"></c:import>

</body>
</html>
