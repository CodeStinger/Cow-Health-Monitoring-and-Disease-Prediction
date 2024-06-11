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
String disease =(String) request.getAttribute("disease");
%>
<%@include file="AfterLoginHeader.jsp"%>
<div class="container">
           <div class="center wow fadeInDown">
           <br><br><br>
           <%if(disease!=null) {%>
<h2>Predicted Disease is <%=disease %></h2>
<%}else{ %>
                <h2>Predict Disease !</h2>
	 



<form action="<%=request.getContextPath() %>/AB" method="post" onsubmit="return abc(this)">              

	
	

              
        	 		<table class="table table-fluid" id="myTable">
			
				<tbody>
					<%
					 String []var1 = {"coughing","depression","diarrhoea","dehydration","dull","fever","highly_diarrhoea","high_temp","loss_of_appetite","milk_flakes","milk_watery","milk_clots","mild_diarrhoea","nasel_discharges","pneumonia","reduction_milk_vields","reduces_feed_intake","raised_breathing","udder_swelling","udder_heat","udder_hardeness","udder_redness","udder_pain","weight_loss"};
						
					for(int i=0;i<var1.length;i+=2){ %>
					
					<tr>
						<td><input type="checkbox" name="<%=i %>" value="<%=var1[i+0]%>">&nbsp;<%=var1[i+0]%></td>
						<td><input type="checkbox" name="<%=i+1%>"  value="<%=var1[i+1]%>">&nbsp;<%=var1[i+1]%></td>
						
						
					</tr>
					
					<%} %>
					
				</tbody>
			</table>
			<input class="button"  type="submit" value="Predict Disease" style="background-color:#3C91E6">
             </form><%} %> <br><br><br><br><br><br><br><br><br><br>
         
            	<script>
			$(document).ready(function() {
				$('#myTable').DataTable();
			});
			
			function abc(form){
			    var inputs = form.getElementsByTagName('input');
			    for(var i = 0, l = inputs.length; i < l; i++){
			        var input = inputs[i];
			        if(input.type == "checkbox" && input.checked)
			            return true;
			    }
			    alert('none are checked');
			    return false;
			};
		</script>
              <%@include file="Footer.jsp"%>
</body>
</html>