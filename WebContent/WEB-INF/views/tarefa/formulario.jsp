<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<body>
	<h3>Adicionar tarefas</h3>
	<form:errors path="tarefa.descricao" />
	<form action="adicionaTarefa" method="post">
		Descrição: <br />
		<textarea name="descricao" rows="5" cols="100"></textarea>
		<br /> <input type="submit" value="Adicionar">
	</form>
	<br>
	<br>
	<a href="listaTarefas">Voltar</a>
	<a href="logout">Logout</a>
</body>
</html>
