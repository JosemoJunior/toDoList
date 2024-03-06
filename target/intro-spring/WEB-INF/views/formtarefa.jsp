<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulário de Tarefas</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <form:form action="exibirtarefa" method="POST" modelAttribute="tarefa" >
            <div class="form-group">
                <label for="titulo">Título:</label>
                <form:input path="titulo" id="titulo" class="form-control" />
            </div>
            <div class="form-group">
                <label for="statusTarefa">Status:</label>
                <form:checkbox path="statusTarefa" id="statusTarefa" />
            </div>
            <div class="form-group">
                <label for="date">Data:</label>
                <form:input path="date" id="date" class="form-control" type="date" />
            </div>
            <div class="form-group">
                <label for="descricaoTarefa">Descrição:</label>
                <form:textarea path="descricaoTarefa" id="descricaoTarefa" class="form-control" rows="4" />
            </div>
            <p><form:button class="btn btn-primary">Enviar</form:button></p>
        </form:form>

        <p>${mensagem}</p>

        <table class="table">
            <thead>
                <tr>
                    <th>TÍTULO</th>
                    <th>STATUS</th>
                    <th>DATA</th>
                    <th>DESCRIÇÃO</th>
                    <th>OPÇÕES</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="tarefa" items="${tarefas}">
                    <tr>
                        <td>${tarefa.titulo}</td>
                        <td>${tarefa.statusTarefa}</td>
                        <td>${tarefa.date}</td>
                        <td>${tarefa.descricaoTarefa}</td>
                        <td>
                            <a href="editar/${tarefa.id}">Editar</a> | 
                            <a href="excluir/${tarefa.id}">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Adicionando o Bootstrap JS e jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"
            integrity="sha384-hGkMk3OfYEmNCEPHEdPIfj7Z9xg7xKuM1eg+uw/HiA3eR1S8z+8CAUq84l1gYWB"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy3uBzA/BtEYUAfx/Fb6IbbE1jXS3BE9SY"
            crossorigin="anonymous"></script>
</body>
</html>