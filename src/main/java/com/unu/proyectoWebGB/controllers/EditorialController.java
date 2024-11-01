package com.unu.proyectoWebGB.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.unu.proyectoWebGB.beans.Autor;
import com.unu.proyectoWebGB.beans.Editorial;
import com.unu.proyectoWebGB.models.EditorialModel;

/**
 * Servlet implementation class EditorialController
 */
public class EditorialController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EditorialModel modelo = new EditorialModel();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditorialController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("op") == null) {
			listar(request, response);
			return;
		}
		String operacion = request.getParameter("op");
		switch (operacion) {

		case "listar":
			listar(request, response);
			break;

		case "nuevo":
			request.getRequestDispatcher("/editorial/nuevoEditorial.jsp").forward(request, response);
			break;
		case "insertar":
			insertar(request, response);
			break;
		case "obtener":
			obtener(request, response);
			break;
		case "modificar":
			modificar(request, response);
			break;
		case "eliminar":
			eliminar(request, response);
			break;

		}
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("listaEditorial", modelo.listarEditorial());
		/*
		 * Iterator<Autor> it = modelo.listarAutores().iterator(); while(it.hasNext()) {
		 * Autor a = it.next(); System.out.println(a.getIdAutor()+" "
		 * +a.getNacionalidad()+" " +a.getNombre()); }
		 */

		request.getRequestDispatcher("/editorial/listaEditorial.jsp").forward(request, response);
	}

	private void insertar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			Editorial edit = new Editorial();
			edit.setNombre(request.getParameter("nombre"));
			edit.setContacto(request.getParameter("contacto"));
			edit.setTelefono(request.getParameter("telefono"));
			if (modelo.insertarEditorial(edit) > 0) {
				request.getSession().setAttribute("exito", "editorial registrado exitosamente");
			} else {
				request.getSession().setAttribute("fracaso", "editorial no registrado");
			}

			response.sendRedirect(request.getContextPath() + "/EditorialController?op=listar");

		} catch (Exception ex) {
			//
			ex.getStackTrace();
		}

	}

	private void obtener(HttpServletRequest request, HttpServletResponse response) {
		try {

			String id = request.getParameter("id");
			Editorial edit = modelo.obtenerEditorial(Integer.parseInt(id));

			if (edit != null) {
				request.setAttribute("editorial", edit);
				request.getRequestDispatcher("/editorial/editarEditorial.jsp").forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/error404.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void modificar(HttpServletRequest request, HttpServletResponse response) {
		try {

			Editorial edit = new Editorial();
			edit.setIdEditorial(Integer.parseInt(request.getParameter("ideditorial")));
			edit.setNombre(request.getParameter("nombre"));
			edit.setContacto(request.getParameter("contacto"));
			edit.setTelefono(request.getParameter("telefono"));

			request.setAttribute("editorial", edit);

			if (modelo.modificarEditoral(edit) > 0) {
				request.getSession().setAttribute("exito", "Editorial modificado exitosamente");
				response.sendRedirect(request.getContextPath() + "/EditorialController?op=listar");
			} else {
				request.getSession().setAttribute("fracaso",
						"El Editorial no ha sido modificado" + "ya hay un Editorial con este codigo");
				response.sendRedirect(request.getContextPath() + "/EditorialController?op=listar");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
		try {

			int idEditorial = Integer.parseInt(request.getParameter("ideditorial"));

			if (modelo.eliminarEditorial(idEditorial) > 0) {
				request.getSession().setAttribute("exito", "Editorial eliminado exitosamente");

			} else {
				request.getSession().setAttribute("fracaso",
						"El Editorial no ha sido eliminado" + "ya hay un Editorial con este codigo");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}
}
