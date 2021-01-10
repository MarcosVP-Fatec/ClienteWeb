<!DOCTYPE html>
<%@page import="br.gov.fatec.model.Cliente"%>
<%@page import="java.util.List"%>
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
	<%
	Object msg = request.getAttribute("msg");
	if (msg!=null){
		out.print((String)msg);
	}
	%>
	</p>
	<p style="color:red">
	<%
	Object msgx = request.getAttribute("excluido");
	if (msgx!=null){
		out.print( (String)msgx );
	}
	
	Cliente cli = (Cliente) request.getAttribute("cli");
	Object indice = (Object) request.getAttribute("iCli");
	
	%>
	</p>

</div>

<form method="post" action="cliente">
	<input type="hidden" name="iCli" value="<%=indice%>">
	E-mail: 
	<input type="text" value="<%=cli.getEmail()%>" name="email" />

	<input type="submit" value="Save">
</form>

<table border="1">
	<tr>
		<th>Conta de e-mail</th>
		<th>Alteração</th>
	</tr>
<%
List<Cliente> lista = (List<Cliente>)request.getAttribute("lista");
int i=0;
for (Cliente c : lista){
%>
	<tr>
		<td><%=c.getEmail()%></td>
		<td>
			<a href="cliente?editar=<%=i%>"> Editar </a> | 
	     	<a href="javascript:confirmaExclusao(<%=i%>,'<%=c.getEmail()%>')"> Excluir </a>
	    </td> 	
	</tr>
<%	
	i++;
}
%>
</table>
</body>
</html>