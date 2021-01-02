package clienteweb;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.gov.fatec.model.Cliente;
import br.gov.fatec.service.ClienteService;

@WebServlet(urlPatterns = { "/cliente", "/clienteServlet", "/clienteController" })
public class ClienteServlet extends HttpServlet {
	
	ClienteService clienteService = new ClienteService();
	
	public ClienteServlet() {
		System.out.println("Construindo Servlet...");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("Inicializando Servlet...");
		super.init();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Chamando o service...");
		super.service(req, resp);
	}
	
	@Override
	public void destroy() {
		System.out.println("Estes servlet está sendo destruído...");
		super.destroy();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String excluir = req.getParameter("excluir");
		String editar = req.getParameter("editar");
		Cliente cli = new Cliente();
		cli.setEmail("");
		
		if (editar != null && editar != "" && editar != "-1") {
			
			cli = clienteService.buscar(Integer.parseInt(editar));
			
		} else if (excluir != null && excluir != "") {

			clienteService.excluir(Integer.parseInt(excluir));
			req.setAttribute("excluido", "Item excluído!");
			editar = "-1";
		}
		
		//Capturar a requisição
		RequestDispatcher dispatcher = req.getRequestDispatcher("cliente.jsp");
		
		//Criar um atributo dentro do request
		//req.setAttribute("lista", lista);
		req.setAttribute("cli", cli);
		req.setAttribute("iCli", editar);
		req.setAttribute("lista", clienteService.getTodosClientes());

		//Encaminhar 
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Recebendo o email
		String email = req.getParameter("email");
		Cliente cli = new Cliente();
		Integer indice = -1;
		if (req.getParameter("editar") != null) {
			Integer.parseInt( req.getParameter("editar") );
		}
		
		if (!email.equals("")) {
			//Colocando o email em um objeto cliente
			cli = new Cliente();
			cli.setEmail(email);
			
			//Adicionando o objeto cliente na Lista de Cliente
			//lista.add(cli);
			clienteService.salvar(indice,cli);
		    req.setAttribute("msg"  , "Cadastrado com sucesso!");
		    
		    cli = new Cliente();
		    cli.setEmail("");
		    
		}
		
		//System.out.println("Chamou pelo método POST");
		//resp.getWriter().print("Chamou pelo método POST enviando e-mail: "+ email + "!");
		//resp.setCharacterEncoding("UTF-8");
		
		//1) De novo chamar o jsp carregando a listagem. Um forward dela para ela mesma
		//2) O servlet vai enviar um comando para o browse solicitar de novo a mesma tela pelo GET.
		
		//Opção 1 renderiza a tela - Forward (Parecido com o GET)
		//Os atributos estão sendo feitos dentro do if acima
		//req.setAttribute("msg"  , "Cadastrado com sucesso!");
		//req.setAttribute("lista", lista );
		req.setAttribute("lista", clienteService.getTodosClientes() );
		req.setAttribute("cli", cli);
	    req.setAttribute("iCli", -1);
		req.getRequestDispatcher("cliente.jsp").forward(req, resp);
		
		//Opção 2 apenas chama a tela - GET
		//resp.sendRedirect("cliente");
		
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.getWriter().print("Chamou pelo método DELETE!");
		resp.setCharacterEncoding("UTF-8");
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.getWriter().print("Chamou pelo método PUT!");
		resp.setCharacterEncoding("UTF-8");
	}

}
