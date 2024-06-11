<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<%String emailid=(String)session.getAttribute("emailid");
String message=(String)request.getAttribute("message");
%>
</head>
<body>
<%@include file="AfterLoginHeader.jsp"%>  

 <div class="container">
           <div class="center wow fadeInDown">
                <h2>Change Password !</h2>
	 

<!--LOGIN FORM-->
<form class="form-group has-success" name="login-form" action="<%=request.getContextPath()%>/RegServlet"  method="post">

	
    
    <!--END HEADER-->
	
	<!--CONTENT-->
    <div class="content"  align="center">
    <%if(message!=null){%>
							<label class="labelform" style="color: green;"> <%=message %></label><br>
					<%} %>
					<br><br>
    <input type="hidden" value="changepwd" name="action">
    <span><font color="#3C91E6">Current Password</font></span>
	<!--Current Password--><input class="form-control"  type="password"  name="CPWD" class="textbox"  onfocus="this.value=''" /><!--END USERNAME-->
	<span><font color="#3C91E6">New Password</font></span>
    <!--PASSWORD--><input class="form-control"  type="password" name="NPWD" class="textbox"  onfocus="this.value=''" /><!--END PASSWORD-->
    <span><font color="#3C91E6">Confirm New Password</font></span>
    
    <input  class="form-control" type="password" name="NPWD" class="textbox"  onfocus="this.value=''" /><!--END PASSWORD-->
    <br><br>
    <input class="btn btn-success" type="submit" name="submit" value="Change Password" class="button" />
    </div>
    <!--END CONTENT-->
    
    
</form>
<!--END LOGIN FORM-->

</div>
<!--END WRAPPER-->

</div>

<%@include file="Footer.jsp"%>
</body>
</html>