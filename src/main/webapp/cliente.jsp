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

<%
List<Cliente> lista = (List<Cliente>)request.getAttribute("lista");
int i=0;
for (Cliente c : lista){
%>
	<!-- out.print(c.getEmail()+" <a href='javascript:editar(" + lista.indexOf(c) +")'>Editar</a> <a href='javascript:confirmaExclusao(" + lista.indexOf(c) +")'>Excluir</a><br/>"); -->
	<%=c.getEmail()%>
	
	<a href="cliente?editar=<%=i%>"> Editar </a> | 
	
	<a href="javascript:confirmaExclusao(<%=i%>,'<%=c.getEmail()%>')"> Excluir </a>
		
	</br>
<%	
	i++;
}
%>

</body>
</html>