<%@ page language="java" contentType="text/html; charset=UTF-8 " pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Tarefas</title>
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
        th, td{
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        btn {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <form:form action="exibirtarefa" method="POST" modelAttribute="todo" class="form-horizontal">
            <input type="hidden" name="token" value="${token}" />
            <div class="card">
            <h2 class="card-header">Cadastrar tarefa:</h2>
            <div class="card-body">
            <div class="form-group">
                <label class="control-label col-sm-2">Título:</label>
                <div>
                    <form:input path="titulo" class="form-control" required="required"/>
                </div>
            </div>
           <% // <div class="form-group">
               // <label class="control-label col-sm-2">Status:</label>
               // <div class="col-sm-10">
               //     <form:checkbox path="statusTarefa" />
               // </div>
            //</div> 
            //<c:out value="${todo.statusTarefa}"  escapeXml="true" />
            %>
            <div class="form-group">
                <label class="control-label col-sm-2">Data para conclusão:</label>
                <div>
                    <form:input path="dateTarefa" class="form-control" type="date" required="required"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Descrição da atividade:</label>
                <div>
                    <form:textarea path="descricaoTarefa" class="form-control" rows="4" required="required"/>
                </div>
            </div>
            </div>
            </div>
            
            <br>
            <p><c:out value="${mensagem}" escapeXml="true" /></p>
			<div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <form:button class="btn btn-primary">Cadastrar</form:button>
                </div>
            </div>

        </form:form>
 		<br>
		<a href="tarefasatrasadas" class="btn btn-danger">Tarefas Atrasadas</a>
		<a href="tarefasconcluidas" class="btn btn-success">Tarefas Concluídas</a>
        <table class="table">
            <thead>
                <tr>
                    <th>TÍTULO</th>          
                    <th>PRAZO PARA FINALIZAR</th>
                    <th>DESCRIÇÃO</th>
                    <th>STATUS</th>
                    <th>OPÇÕES</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="todo" items="${todos}">
                    	<tr>
                        <td><c:out value="${todo.titulo}" escapeXml="true" /></td>
                        <td><c:out value="${todo.formattedDateTarefa}" escapeXml="true" /></td>
                        <td><c:out value="${todo.descricaoTarefa}"  escapeXml="true" /></td>
                        <td> <a href="concluir/${todo.id}" class="btn btn-success">Concluir</a></td>                
                        
                        <td>
                            <a href="editar/${todo.id}" class="btn btn-info">Editar</a>
                            <a href="excluir/${todo.id}" class="btn btn-danger">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
