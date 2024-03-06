<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Página Principal</title>
    <spring:url var="css" value="/static/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="${css}" />
    <style>
        /* Add any additional custom styles here */
        body {
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
        }
        .card text-center{
        	max-width: 50%x;
        }
        .btn {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div class="card text-center">
  		<div class="card-header">
    		<h6>Bem-vindo @usuário,</h6>
  		</div>
  	<div class="card-body">
	    <h5 class="card-title">ToDoList_Spring</h5>
	    <p class="card-text">Clique no botão abaixo para acessar o formulário de tarefas:</p>
	    <a href="exibirtarefa" class="btn btn-primary">Entrar</a>
  	</div>
	<div class="card-footer text-body-secondary">
	    <P>Equipe: Joelton | Josemo </P>
	</div>
	</div>
</body>
</html>