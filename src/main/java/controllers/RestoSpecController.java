package controllers;

import java.io.IOException;
import java.util.List;

import entites.Restaurant;
import entites.Specialite;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.RestaurantService;
import services.SpecialiteService;

/**
 * Servlet implementation class RestoSpecController
 */
public class RestoSpecController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	RestaurantService rs;
	SpecialiteService ss;
    public RestoSpecController() {
        super();
        // TODO Auto-generated constructor stub
        rs = new RestaurantService();
        ss = new SpecialiteService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("specialite") != null) {
			int restoId = Integer.parseInt(request.getParameter("id")); 
			int specId = Integer.parseInt(request.getParameter("specialite")); 
			Restaurant resto = rs.findById(restoId);
			List<Specialite> specs = resto.getSpecialite();
			if(specs.add(ss.findById(specId))){
				resto.setSpecialite(specs);
				rs.update(resto);
				response.getWriter().append("Served at: " + specs.size()).append(request.getContextPath());
				//response.sendRedirect("restospec.jsp?id=" + restoId);
			}
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
