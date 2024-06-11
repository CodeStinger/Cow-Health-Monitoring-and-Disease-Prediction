package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import util.GeneratePassword;
import util.LineChartExample;
import bean.ChartData;
import bean.RegBean;

public class DAOQuires {

	
	public ArrayList<String> getUserList() {
		// TODO Auto-generated method stub
		DAO data=new DAO();
		Connection conn=data.getConnection();
		ArrayList<String> userlist=new ArrayList<String>();
		String validateUser = "select emailid from  registration";
		PreparedStatement preparedStatement;
		try {
			preparedStatement = conn.prepareStatement(validateUser);
			
			
			// execute insert SQL statement
			ResultSet result=preparedStatement.executeQuery();
			while(result.next())
			{
				userlist.add(result.getString(1));
				
			}
			

		}
		
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		

		// TODO Auto-generated method stub
		return userlist;

		
	}



	
	public boolean insertReg(RegBean rb) {
		// TODO Auto-generated method stub
		int rows = 0;
	DAO dao=new DAO();
	
	Connection conn=dao.getConnection();
	String password=GeneratePassword.randomPasswordIs();
	rb.setPassword(password);
	String insertquery="insert into registration(fname,lastname,emailid,password,address) values(?,?,?,?,?)";
	PreparedStatement pstmt=null;
	try{
		pstmt=conn.prepareStatement(insertquery);;
		pstmt.setString(1,rb.getFname());
		pstmt.setString(2,rb.getLname());
		pstmt.setString(3,rb.getEmailid());
		pstmt.setString(4, password);
		pstmt.setString(5, rb.getAddress());
		
	
		
	 rows=pstmt.executeUpdate();
	
	}catch(SQLException e){
		System.out.println(e);
	}
	finally{
		try {
			pstmt.close();
		
		conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	if(rows==0)
		return false;
	
	return true;

	}
	public ArrayList<ChartData> getChart() {
	    DAO data = new DAO();
	    Connection conn = data.getConnection();
	    ArrayList<ChartData> s = new ArrayList<ChartData>();
	  String  validateUser = "select * from  filerecord ";
	    try
	    {
	      PreparedStatement preparedStatement = conn.prepareStatement(validateUser);
	      ResultSet result = preparedStatement.executeQuery();
	      while (result.next())
	      {
	        ChartData subject = new ChartData();
	        subject.setOp(result.getString(4));
	        subject.setTitle("Serial and Parrallel Comparision");
	        subject.setFileSize(result.getString(2));
	        subject.setTime(result.getString(3));
	        
	        s.add(subject);
	      }
	    }
	    catch (SQLException e) {
	      e.printStackTrace();
	    }
	    return s;
	  
	}


	public int insertDBQuires(String filename,String filesize,String timeupload,String operation) {
		// TODO Auto-generated method stub
		DAO data=new DAO();
		Connection conn=data.getConnection();
		// Generate password
		// Insert into Login Table
		String insertQuery = "insert into filerecord values(?,?,?,?,?)";
		PreparedStatement preparedStatement;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		try {
			preparedStatement = conn.prepareStatement(insertQuery);
			preparedStatement.setString(1, filename);
			preparedStatement.setString(2,filesize);
			preparedStatement.setString(3, timeupload);
			preparedStatement.setString(4, operation);
			preparedStatement.setString(5, dateFormat.format(date));
		int row=	preparedStatement.executeUpdate();
		
		return row;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//insertRegistrationForm(bean);
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
		
		
		
	}
	public String checkLogin(RegBean bean) {
		// TODO Auto-generated method stub
		
		
		 if("admin".equals(bean.getEmailid()) && "admin".equalsIgnoreCase(bean.getPassword())){
		return "admin";	
		}else{
		
		
		DAO data=new DAO();
		Connection conn=data.getConnection();
		System.out.println(bean.getEmailid()+bean.getPassword());
		String validateUser = "select * from  registration where Emailid=? and password = ?";
		PreparedStatement preparedStatement;
		try {
			preparedStatement = conn.prepareStatement(validateUser);
			preparedStatement.setString(1, bean.getEmailid());
			preparedStatement.setString(2, bean.getPassword());
			
			// execute insert SQL statement
			ResultSet result=preparedStatement.executeQuery();
			if(result.next())
			{
				System.out.println("------------------------------------------");
				return result.getString(1);
			}
			

		}
		
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		}
		// TODO Auto-generated method stub

		return null;
	}
	public RegBean getForgetPassword(RegBean bean) {
		// TODO Auto-generated method stub
		DAO data=new DAO();
		Connection conn=data.getConnection();
		String validateUser = "select password from  registration where emailid=? ";
		PreparedStatement preparedStatement;
		try {
			preparedStatement = conn.prepareStatement(validateUser);
			preparedStatement.setString(1, bean.getEmailid());
			System.out.println(bean.getEmailid());
			
			
			// execute insert SQL statement
			System.out.println(preparedStatement.toString());
			ResultSet result=preparedStatement.executeQuery();
			if(result.next())
			{
				bean.setPassword(result.getString(1));
				return bean;
			}
			

		}
		
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		

		// TODO Auto-generated method stub
		return null;

	}
	public int Changepwd(RegBean rb, String emailid) {
		// TODO Auto-generated method stub
		DAO data=new DAO();
		Connection conn=data.getConnection();
		String validateUser = "select password from  registration where emailid=? ";
		PreparedStatement preparedStatement;
		try {
			preparedStatement = conn.prepareStatement(validateUser);
			preparedStatement.setString(1, emailid);
			
			
			// execute insert SQL statement
			ResultSet result=preparedStatement.executeQuery();
			System.out.println("emailid"+emailid);
			
			if(result.next())
			{
				System.out.println("pass"+result.getString(1));
				if(result.getString(1).equals(rb.getPassword()))
				{
					validateUser="update registration set password=? where emailid=?";
					preparedStatement=conn.prepareStatement(validateUser);
					preparedStatement.setString(1,rb.getChangepwd());
					preparedStatement.setString(2, emailid);
					System.out.println("emailid"+rb.getChangepwd());
					return preparedStatement.executeUpdate();
					
				}
				else
				{
					return 0;
				}
			}
			

		}
		
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		

		// TODO Auto-generated method stub
		return 0;
		
	}




	public Object insertData(String pulse, String humidity, String temperature,
			String timestam,String path) {
		
		
		DAO data=new DAO();
		Connection conn=data.getConnection();
		// Generate password
		// Insert into Login Table3
		

	        
	         
	         System.out.println(path);
		String insertQuery = "insert into data values(?,?,?,?,?)";
		PreparedStatement preparedStatement;
		//DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(Long.parseLong(timestam+"000"));
		SimpleDateFormat sf1 = new SimpleDateFormat("hh:mm:ss");
		Date date1 = new Date(Long.parseLong(timestam+"000"));	
		try {
			preparedStatement = conn.prepareStatement(insertQuery);
			preparedStatement.setString(1, temperature);
			preparedStatement.setString(2,humidity);
			preparedStatement.setString(3, pulse);
			preparedStatement.setString(4, sf1.format(date1));
			preparedStatement.setString(5, sf.format(date));
		int row=	preparedStatement.executeUpdate();
		
		
		
		return row;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//insertRegistrationForm(bean);
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
		
	}






	public void createChart(String timestam, String contextPath, String a2) {
		// TODO Auto-generated method stub
		
		ArrayList<String> a = new ArrayList<String>();
		
		DAO data=new DAO();
		Connection conn=data.getConnection();
		String validateUser = "select "+a2+",timestamp from  data where date=? ";
		PreparedStatement preparedStatement;
		try {
			preparedStatement = conn.prepareStatement(validateUser);
			preparedStatement.setString(1, timestam);
			
			
			// execute insert SQL statement
			ResultSet result=preparedStatement.executeQuery();
		
			
			while(result.next())
			{
				a.add(result.getString(1));
				a.add(result.getString(2));
				
				
			}
			System.out.println(preparedStatement.toString());

		}
		
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		new LineChartExample(contextPath,a,a2); 

		

		// TODO Auto-generated method stub
		//return 0;
		
	}



	public ArrayList<String> getTableChart(String timestam) {
		// TODO Auto-generated method stub
		
		ArrayList<String> a = new ArrayList<String>();
		
		DAO data=new DAO();
		Connection conn=data.getConnection();
		String validateUser = "select * from  data where date=? ";
		PreparedStatement preparedStatement;
		try {
			preparedStatement = conn.prepareStatement(validateUser);
			preparedStatement.setString(1, timestam);
			
			
			// execute insert SQL statement
			ResultSet result=preparedStatement.executeQuery();
		
			
			while(result.next())
			{
				a.add(result.getString(1));
				a.add(result.getString(2));
				a.add(((int)Double.parseDouble(result.getString(3)))/100+"");
				a.add(result.getString(4));
				
				
			}
			System.out.println(preparedStatement.toString());
		

		}
		
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return a;
		

		// TODO Auto-generated method stub
		//return 0;
		
	}

	
}
