package tourism.com.spot;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class SpotDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("get = "+id);
		String place = id.toLowerCase();
		System.out.println(place);
		
		if(place.equals("spitivalley"))
			place = "spiti";
		
		String url = "https://www.holidify.com/places/"+place;
		response.sendRedirect(url);
		/*
		 	https://www.holidify.com/places/Auli
			https://www.holidify.com/places/gulmarg/
			https://www.holidify.com/places/mon/
			https://www.holidify.com/places/srinagar/
			https://www.holidify.com/places/ladakh/
			https://www.holidify.com/places/kodaikanal/
			https://www.holidify.com/places/spiti/
		*/	
	}

	

}
