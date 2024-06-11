package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Alert
 */
public class Alert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Alert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	static int flag=0; 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String pulse = request.getParameter("pulse");
		String humidity = request.getParameter("humidity");
		int temperature = (int)Double.parseDouble( request.getParameter("temperature"));
		

		String timestam = request.getParameter("timestam");
		long timeSeconds = TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis());
if ((temperature)>40){
		System.out.println(timeSeconds);
		System.out.println(temperature);
		System.out.println(timestam);
		System.out.println(Long.parseLong(timestam) >= timeSeconds-3600);
}
		long t = System.currentTimeMillis();
		if(Long.parseLong(timestam) >= timeSeconds-3600 && flag==0 && (temperature)>40)
		{
			flag=1;
			System.out.println("Alert");
		}
	}

}
