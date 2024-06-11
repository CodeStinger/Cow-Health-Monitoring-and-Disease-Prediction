<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="db.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <script src="https://kit.fontawesome.com/35e165882d.js" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/firebasejs/7.17.1/firebase-app.js"></script>

    <!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
    <script src="https://www.gstatic.com/firebasejs/7.17.1/firebase-analytics.js"></script>
<script src="<%=request.getContextPath() %>/js/chat.js"
    type="text/javascript"></script>
    <!-- Add Firebase products that you want to use -->
  <script src="https://www.gstatic.com/firebasejs/7.17.1/firebase-auth.js"></script>
  <script src="https://www.gstatic.com/firebasejs/7.17.1/firebase-database.js"></script> <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</style>
    <!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
   

<title>Login</title>

</head>
<body>
<%ArrayList<String> var =(ArrayList<String>)request.getAttribute("message"); 

%>
<%@include file="AfterLoginHeader.jsp"%>
<div class="container">
           <div class="center wow fadeInDown">
                <h2>View Realtime Data Tabular Format !</h2>
	 


<form action="<%=request.getContextPath() %>/AB" method="post">              
	<br>	<br><br><input type="date" id="file_upload" name="date1">

		<input type="hidden" value="table" name="action" >
<br>	<br>
	<input class="button"  type="submit" value="Get Data" style="background-color:#3C91E6">
	
	

              </form>
          <%if(var!=null){ %>
			<table class="table table-fluid" id="myTable">
				<thead>
					<tr>
						<th>Pulse</th>
						<th>Humidity</th>
						<th>Temperature</th>
					<th>time</th>
					</tr>
				</thead>
				<tbody>
					<%
					
					for(int i=0;i<var.size();i+=4){ %>
					
					<tr>
						<td> <%= var.get(i+0)%></td>
						<td><%= var.get(i+1)%></td>
						<td><%= var.get(i+2)%></td>
							<td><%= var.get(i+3)%></td>
						
					</tr>
				
					<%}} %>
				</tbody>
			</table>
              <br><br><br><br><br><br><br><br><br><br>
         
            	<script>
			$(document).ready(function() {
				$('#myTable').DataTable();
			});
			
			
		</script>
              <%@include file="Footer.jsp"%>
</body>
</html>