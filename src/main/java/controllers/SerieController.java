package controllers;

import java.io.IOException;

import entites.Serie;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.SerieService;

/**
 * Servlet implementation class SerieController
 */
public class SerieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	SerieService vs;
    public SerieController() {
        super();
        // TODO Auto-generated constructor stub
        vs = new SerieService();
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
				response.sendRedirect("series.jsp");
			}
			if (request.getParameter("op").equals("update")) {
				Serie v = vs.findById(Integer.parseInt(request.getParameter("id")));
				response.sendRedirect("series.jsp?id=" + v.getId() + "&nom=" + v.getNom());
			}

		} else if (!request.getParameter("id").equals("")) {
			Serie v = vs.findById(Integer.parseInt(request.getParameter("id")));
			String nom = request.getParameter("nom");
			v.setNom(nom);
			vs.update(v);
			response.sendRedirect("series.jsp");
			
		}else  {
			String nom = request.getParameter("nom");
			vs.create(new Serie(nom));
			response.sendRedirect("series.jsp");
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
