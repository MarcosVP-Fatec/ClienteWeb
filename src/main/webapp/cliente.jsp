<%@ taglib prefix="c" uri="https://mvnrepository.com/artifact/jstl/jstl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Cliente</title>
<script type="text/javascript">
function confirmaExclusao(indice,conta){

	if (window.confirm("Tem certeza que deseja excluir a conta "+conta+" ???")){
		location.href="cliente?excluir="+indice;
	}
}
</script>
</head>
<body>

<div>

	<p style="color:green">
	${requestScope.msg}
	</p>
	<p style="color:red">
	${requestScope.msgx}
	</p>

</div>

<form method="post" action="cliente">
	<input type="hidden" name="iCli" value="${requestScope.iCli} }">
	E-mail: 
	<input type="text" value="${requestScope.cli.email }" name="email" />

	<input type="submit" value="Save">
</form>

<table border="1">
	<tr>
		<th>Conta de e-mail</th>
		<th>Alteração</th>
	</tr>

<c:set var="nIndice" value="0"/>
<c:forEach items="${requestScope.lista}" var="c">
	
	<tr>
		<td>
			${c.email}
		</td>
		<td>
			<a href="cliente?editar=${nIndice}"> Editar </a> | 
	     	<a href="javascript:confirmaExclusao(${nIndice},${c.email})"> Excluir </a>
	    </td> 	
	</tr>
	<c:set var="nIndice" value="${nIndice+1}"/>
</c:forEach>	

</table>
</body>
</html>