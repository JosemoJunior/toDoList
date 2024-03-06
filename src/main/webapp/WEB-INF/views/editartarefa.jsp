<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Tarefa</title>
    <spring:url var="css" value="/static/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="${css}" />
</head>
<body>
    <div class="container">
        <div class="card">
            <h2 class="card-header">Editar Tarefa</h2>
            <form:form action="../update/${todo.id}" method="POST" modelAttribute="todo" >
           		<input type="hidden" name="token" value="${token}" />
           		<div class="card-body">
                <div class="form-group">
                    <p>Título: <form:input path="titulo" class="form-control" /></p>
                </div>
                <div class="form-group">
                    <p>Data: <form:input path="dateTarefa" class="form-control" type="date" /></p>
                </div>
                <div class="form-group">
                    <p>Descrição: <form:textarea path="descricaoTarefa" class="form-control" rows="4" /></p>
                </div>
                </div>
                <p><form:button class="btn btn-primary">Enviar</form:button></p>
            </form:form>
        </div>
    </div>
</body>
</html>
