package controllers;

import java.io.IOException;

import entites.Restaurant;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.RestaurantService;

/**
 * Servlet implementation class ProductController
 */
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	RestaurantService rs;
	
    public ProductController() {
        super();
        rs = new RestaurantService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int restoId = Integer.parseInt(request.getParameter("id"));
		Restaurant resto = rs.findById(restoId);
		String photoName = "";
		if(resto.getPhotos().size() != 0) {
			String url = resto.getPhotos().get(0).getUrl();
	        String[] arrOfStr = url.split("/", 10);
	        photoName = arrOfStr[9];
	        
			
		}
		response.sendRedirect("product.jsp?id=" + restoId + "&p=" + photoName + "&lat=" + resto.getLatitude() + "&lon=" + resto.getLongitude());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
