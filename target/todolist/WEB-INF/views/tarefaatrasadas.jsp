<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Tarefas Atrasadas</title>
    <!-- Adicione seus estilos aqui, se necessário -->
</head>
<body>
    <div class="container">
        <h2>Tarefas Atrasadas</h2>

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
                        <td>${tarefa.titulo}</td>
                        <td>${tarefa.formattedDateTarefa}</td>
                        <td>${tarefa.descricaoTarefa}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
