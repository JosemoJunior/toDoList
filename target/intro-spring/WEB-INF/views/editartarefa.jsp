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
        <div class="panel-default">
            <div class="panel-heading">Editar Tarefa</div>
            <form:form action="../update/${tarefa.id}" method="POST" modelAttribute="tarefa" >
                <div class="form-group">
                    <p>Título: <form:input path="titulo" class="form-control" /></p>
                </div>
                <div class="form-group">
                    <p>Status: <form:checkbox path="statusTarefa" /></p>
                </div>
                <div class="form-group">
                    <p>Data: <form:input path="date" class="form-control" type="date" /></p>
                </div>
                <div class="form-group">
                    <p>Descrição: <form:textarea path="descricaoTarefa" class="form-control" rows="4" /></p>
                </div>
                <p><form:button class="btn btn-primary">Enviar</form:button></p>
            </form:form>
        </div>
    </div>
</body>
</html>
