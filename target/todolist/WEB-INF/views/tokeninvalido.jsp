<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Token Inválido</title>
    <spring:url var="css" value="/static/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="${css}" />
    <style>

        body {
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="card">
  		<h4 class="card-header">Security Sistem:</h4>
  		<div class="card-body">
    		<h5 class="card-title">Token Inválido</h5>
    		<p class="card-text"><marquee><c:out value="${mensagem}" escapeXml="true" /></marquee></p>
  		</div>
	</div>
	<a href="https://3.bp.blogspot.com/-pcbM2Ca3LuE/U1ljYB4a6NI/AAAAAAAAO4w/iky-UNPvzTk/s1600/sport_nordeste.jpg" class="btn btn-primary">Descubra a verdade!</a>
	
</body>
</html>



	
