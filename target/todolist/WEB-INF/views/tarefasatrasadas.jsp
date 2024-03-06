<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tarefas Atrasadas</title>
	<spring:url var="css" value="/static/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="${css}" />
    <style>
        /* Add any additional custom styles here */
        body {
            padding: 20px;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2 class="card-header">Tarefas Atrasadas</h2>
		<div class="card-body">
        <table class="table">
            <thead>
                <tr>
                    <th>TÍTULO</th>
                    <th>PRAZO PARA FINALIZAR</th>
                    <th>DESCRIÇÃO</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="tarefa" items="${tarefasAtrasadas}">
                    <tr>
                        <td><c:out value="${tarefa.titulo}"  escapeXml="true" /></td>
                        <td><c:out value="${tarefa.formattedDateTarefa}"  escapeXml="true" /></td>
                        <td><c:out value="${tarefa.descricaoTarefa}"  escapeXml="true" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
     </div>   
    </div>
    <a href="exibirtarefa" class="btn btn-primary">Voltar</a>
</body>
</html>
