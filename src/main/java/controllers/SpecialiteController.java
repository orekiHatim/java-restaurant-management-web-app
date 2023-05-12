package controllers;

import java.io.IOException;

import entites.Specialite;
import entites.Ville;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.SpecialiteService;

/**
 * Servlet implementation class SpecialiteController
 */
public class SpecialiteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	SpecialiteService vs;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpecialiteController() {
        super();
        vs = new SpecialiteService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("op") != null) {
			if (request.getParameter("op").equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				vs.delete(vs.findById(id));
				response.sendRedirect("specialites.jsp");
			}
			if (request.getParameter("op").equals("update")) {
				Specialite v = vs.findById(Integer.parseInt(request.getParameter("id")));
				response.sendRedirect("specialites.jsp?id=" + v.getId() + "&nom=" + v.getNom());
			}

		} else if (!request.getParameter("id").equals("")) {
			Specialite v = vs.findById(Integer.parseInt(request.getParameter("id")));
			String nom = request.getParameter("nom");
			v.setNom(nom);
			vs.update(v);
			response.sendRedirect("specialites.jsp");
			
		} else  {
			String nom = request.getParameter("nom");
			vs.create(new Specialite(nom));
			response.sendRedirect("specialites.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
