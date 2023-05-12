package controllers;

import java.io.IOException;

import entites.Ville;
import entites.Zone;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.VilleService;
import services.ZoneService;

/**
 * Servlet implementation class ZoneController
 */
public class ZoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	VilleService vs;
	ZoneService zs;

	public ZoneController() {
		super();
		vs = new VilleService();
		zs = new ZoneService();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("op") != null) {
			if (request.getParameter("op").equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				if (zs.delete(zs.findById(id))) {
					response.sendRedirect("zones.jsp");
				}
			}
			if (request.getParameter("op").equals("update")) {
				Zone zone = zs.findById(Integer.parseInt(request.getParameter("id")));
				response.sendRedirect("zones.jsp?id=" + zone.getId() + "&zoneName=" + zone.getNom() + "&city=" + zone.getVille().getId());
			}
		} else if (!request.getParameter("id").equals("")) {
			Zone zone = zs.findById(Integer.parseInt(request.getParameter("id")));
			String nom = request.getParameter("zoneName");
			int villeId = Integer.parseInt(request.getParameter("city"));
			Ville v = vs.findById(villeId);
			zone.setNom(nom);
			zone.setVille(v);
			zs.update(zone);
			response.sendRedirect("zones.jsp");
		} else {
			String zone = request.getParameter("zoneName");
			int villeId = Integer.parseInt(request.getParameter("city"));
			Ville v = vs.findById(villeId);
			zs.create(new Zone(zone, v));
			response.sendRedirect("zones.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
