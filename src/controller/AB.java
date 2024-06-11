package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.LoginService;
import service.RegService;
import db.DAOQuires;

/**
 * Servlet implementation class RegServlet
 */
public class AB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public AB() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		String nextPath = "";
		HttpSession session = request.getSession(true);
		System.out.println(action);
		if ("registration".equalsIgnoreCase(action)) {
			System.out.println("A");
			RegService rs = new RegService();
			boolean isSuccess = rs.insertValues(request);

			if (isSuccess == false){
				request.setAttribute(
						"message",
						" This might happen because of the below errors <br>1.Duplicate Email-Id <br>2.Unable to connect Database<br>3.Unable to connect Internet");
			nextPath = "/Registration.jsp";
			}
			else {
				request.setAttribute("message",
						"Account created successfully<br> Please visit your "
								+ request.getParameter("E-mail Id")
								+ " for the credential");
				nextPath = "/Registration.jsp";
			}
		} else if ("login".equalsIgnoreCase(action)) {
			LoginService ls = new LoginService();
			String username = ls.checkCredintials(request);
			
			System.out.println(username);
			if (username == null)
			{
				nextPath = "/Login.jsp";
				
			}else{
				session.setAttribute("username",username);
				session.setAttribute("emailid",request.getParameter("EMAILID"));
				nextPath = "/Portal.jsp";
			}
			
		}
	
		else if("forgetpassword".equals(action))
		{
			LoginService ls= new LoginService();
			boolean result=ls.forgetPassword(request);
			request.setAttribute("msg", result);
			nextPath="/ForgetPassword.jsp";	
		}
		else if("changepwd".equals(action))
		{
					System.out.println("In Change Password");
				LoginService ls = new LoginService();
				int noofrowsaffected=ls.changePwd(request,(String)session.getAttribute("emailid"));
				System.out.println(session.getAttribute("emailid"));
				if(noofrowsaffected>0){
					request.setAttribute("message", "Password Change Successfully");
				}
				else{
					request.setAttribute("message", "Current Password does not match");
				}

				nextPath="/Changepassword.jsp";
				
			
		}else if("chatsend".equals(action))
		{
			String pulse = request.getParameter("pulse");
			String humidity = request.getParameter("humidity");
			String temperature = request.getParameter("temperature");
			String timestam = request.getParameter("timestam");
			System.out.println(pulse + humidity + temperature +timestam + action);
			DAOQuires db=new DAOQuires();
			//Timestamp stamp = new Timestamp(System.currentTimeMillis());
			//Date date = new Date(stamp.getTime());
			//System.out.println(date);
			 db.insertData(pulse,humidity,temperature,timestam,request.getContextPath());
		
	
}else if("chart".equals(action))
{
	
	DAOQuires db=new DAOQuires();
	//Timestamp stamp = new Timestamp(System.currentTimeMillis());
	//Date date = new Date(stamp.getTime());
	//System.out.println(date);
	String timestam = request.getParameter("date1");
	String a = request.getParameter("a");
	System.out.println(timestam+getServletContext().getRealPath("/"));
	 db.createChart(timestam,getServletContext().getRealPath("/"),a);
	 request.setAttribute("message", "sd");
	 nextPath="/Portal.jsp";

}else if("table".equals(action))
{
	
	DAOQuires db=new DAOQuires();
	//Timestamp stamp = new Timestamp(System.currentTimeMillis());
	//Date date = new Date(stamp.getTime());
	//System.out.println(date);
	String timestam = request.getParameter("date1");
	System.out.println(timestam+getServletContext().getRealPath("/"));
	ArrayList<String> a =  db.getTableChart(timestam);
	 request.setAttribute("message", a);
	 nextPath="/tableformat.jsp";

}else{
	String disease = "";
	for(int i=0;i<25;i++)
	{
		String d = request.getParameter(i+"");
		
		if(d!=null)
			disease = disease+d+" ";
				
		
	}
	Runtime.getRuntime().exec("  cmd /c start D:\\python\\cattle\\cattle.bat "+disease);
	try {
		Thread.sleep(13000);
	} catch (InterruptedException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	String disease1="";
	 try {
		 
	      File myObj = new File("D:\\python\\cattle\\demofile2.txt");
	      Scanner myReader = new Scanner(myObj);
	      while (myReader.hasNextLine()) {
	        String data = myReader.nextLine();
	        disease1 =data;
	        System.out.println(data);
	      }
	      myReader.close();
	    } catch (FileNotFoundException e) {
	      System.out.println("An error occurred.");
	      e.printStackTrace();
	    }
	 request.setAttribute("disease", disease1);
	nextPath ="/viewdisease.jsp";
   	
}
		RequestDispatcher rd = request
				.getRequestDispatcher(nextPath);
		rd.forward(request, response);
	}

}

