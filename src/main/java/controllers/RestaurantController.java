package controllers;

import java.io.IOException;

import entites.Restaurant;
import entites.Serie;
import entites.Zone;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.RestaurantService;
import services.SerieService;
import services.ZoneService;

/**
 * Servlet implementation class RestaurantController
 */
public class RestaurantController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	ZoneService zs;
	SerieService ss;
	RestaurantService rs;
    public RestaurantController() {
        super();
        // TODO Auto-generated constructor stub
        zs = new ZoneService();
        ss = new SerieService();
        rs = new RestaurantService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("op") != null) {
			if (request.getParameter("op").equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				if (rs.delete(rs.findById(id))) {
					response.sendRedirect("restos.jsp");
				}
			}
			if (request.getParameter("op").equals("update")) {
				Restaurant resto = rs.findById(Integer.parseInt(request.getParameter("id")));
				response.sendRedirect("restos.jsp?id=" + resto.getId() + "&nom=" + resto.getNom() + "&addresse=" + resto.getAdresse() + "&description=" +
						resto.getDescription() + "&latitude=" + resto.getLatitude() + "&longitude=" + resto.getLongitude()
						+ "&hourOpened=" + resto.getHourOpened() + "&hourClosed=" + resto.getHourClosed()
						+ "&zone=" + resto.getZone().getId() + "&serie=" + resto.getSerie().getId());
			}
		} else if (!request.getParameter("id").equals("")) {
			Restaurant resto = rs.findById(Integer.parseInt(request.getParameter("id")));
			String nom = request.getParameter("nom");
			String addresse = request.getParameter("addresse");
			String description = request.getParameter("description");
			double latitude = Double.parseDouble(request.getParameter("latitude"));
			double longitude = Double.parseDouble(request.getParameter("longitude"));
			String hourOpened = request.getParameter("hourOpened");
			String hourClosed = request.getParameter("hourClosed");
			int zoneId = Integer.parseInt(request.getParameter("zone"));
			int serieId = Integer.parseInt(request.getParameter("serie"));
			Zone zone = zs.findById(zoneId);
			Serie serie = ss.findById(serieId);
			
			resto.setNom(nom);
			resto.setAdresse(addresse);
			resto.setDescription(description);
			resto.setLatitude(latitude);
			resto.setLongitude(longitude);
			resto.setHourOpened(hourOpened);
			resto.setHourClosed(hourClosed);
			resto.setZone(zone);
			resto.setSerie(serie);
			rs.update(resto);
			response.sendRedirect("restos.jsp");
		} else {
			String nom = request.getParameter("nom");
			String addresse = request.getParameter("addresse");
			String description = request.getParameter("description");
			double latitude = Double.parseDouble(request.getParameter("latitude"));
			double longitude = Double.parseDouble(request.getParameter("longitude"));
			String hourOpened = request.getParameter("hourOpened");
			String hourClosed = request.getParameter("hourClosed");
			int zoneId = Integer.parseInt(request.getParameter("zone"));
			int serieId = Integer.parseInt(request.getParameter("serie"));
			Zone zone = zs.findById(zoneId);
			Serie serie = ss.findById(serieId);
			
			if(rs.create(new Restaurant(nom, addresse, description, latitude, longitude, hourOpened, hourClosed, zone, serie))) {
				response.sendRedirect("restos.jsp");
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
