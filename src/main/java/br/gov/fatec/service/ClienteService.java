package br.gov.fatec.service;

import java.util.ArrayList;
import java.util.List;

import br.gov.fatec.model.Cliente;

public class ClienteService {

	private static List<Cliente> lista = new ArrayList<>();
	
	public void salvar(int indice, Cliente cliente) {
		if (indice==-1) {
			lista.add(cliente);
		} else {
			lista.add(indice,cliente);
		}
	}
	
	public List<Cliente> getTodosClientes(){
		return lista;
	}
	
	public void excluir(int indice) {
		lista.remove(indice);
	}

	public Cliente buscar(int indice) {
		try {
			return lista.get(indice);
		} catch (Exception e) {
			return null;
		}

	}
	
}
