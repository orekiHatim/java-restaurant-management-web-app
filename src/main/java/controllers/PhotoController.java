package controllers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import entites.Photo;
import entites.Restaurant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import services.PhotoService;
import services.RestaurantService;

/**
 * Servlet implementation class PhotoController
 */
@MultipartConfig
public class PhotoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	PhotoService ps;
	RestaurantService rs;
	public PhotoController() {
		super();
		// TODO Auto-generated constructor stub
		ps = new PhotoService();
		rs = new RestaurantService();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("op").equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			Photo photo = ps.findById(id);
			File file = new File(photo.getUrl());
			if(file.delete()) {
				if(ps.delete(photo)) {
					response.sendRedirect("photos.jsp");
				}
			}
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Part file = request.getPart("photo");

		String imageFileName = file.getSubmittedFileName();
		String uploadPath = "C:/Users/a/eclipse-workspace/TestDynamicWeb/src/main/webapp/images/" + imageFileName;
		
		try {
			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = file.getInputStream();
			
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int restoId = Integer.parseInt(request.getParameter("resto"));
		Restaurant resto = rs.findById(restoId);
		if(ps.create(new Photo(uploadPath, resto))) {
			response.sendRedirect("photos.jsp");
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//doGet(request, response);
	}

}
