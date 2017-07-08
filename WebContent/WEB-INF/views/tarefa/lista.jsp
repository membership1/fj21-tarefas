<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<body>
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript">
	function finalizaAgora(id) {
	    $.post("finalizaTarefa", {'id' : id}, function(resposta) {
	      $("#tarefa_"+id).html("Finalizado");
	      $("#tarefa_data_"+id).html(resposta);
	    });
	  }
</script>
	<script>
	function removeAgora(id) {
		 $.post("removeTarefa", {'id' : id}, function() {
	     $("#tarefa_remove_"+id).closest("tr").hide();
		 });
		 }
</script>
	<br>
	<br>
	<table border="1">
		<tr align='center'>
		<tr>
			<th>Id</th>
			<th>Descrição</th>
			<th>Finalizado?</th>
			<th>Data de finalização</th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa" varStatus="id">
			<tr bgcolor="#${id.count % 2 == 0 ? 'B0E0E6' : 'ffffff' }">

				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				<c:if test="${tarefa.finalizado eq false}">
					<td id="tarefa_${tarefa.id}"><a href="#"
						onClick="finalizaAgora(${tarefa.id})"> Finaliza agora! </a></td>
				</c:if>
				<c:if test="${tarefa.finalizado eq true}">
					<td>Finalizado</td>
				</c:if>
				<td id="tarefa_data_${tarefa.id}"><fmt:formatDate
						value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" /></td>

				<td id="tarefa_remove_${tarefa.id}"><a href="#"
					onClick="removeAgora(${tarefa.id})"> Remover </a></td>

				<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<br>
	<a href="novaTarefa">Criar nova tarefa</a>
</body>
</html>