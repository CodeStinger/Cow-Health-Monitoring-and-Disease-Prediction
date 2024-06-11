<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<%
	String isuccess = (String) request.getAttribute("username");
%>
</head>
<body>
	<%@include file="Header.jsp"%>
	<br><br>
 <div class="container">
           <div class="center wow fadeInDown">
                <h2>Login Form !</h2>
	 

			<div class="contact-form">
				<form method="post"
					action="<%=request.getContextPath()%>/AB" class="left_form">
					<%
						if ("invalid".equals(isuccess)) {
					%>
					<span style="color: red">Invalid username or password .</span>
					<!--END DESCRIPTION-->

					<%
						request.setAttribute("message", "");
						}
					%>

					<div class="form-group has-success">
						<span><label class="labelform">Email Id</label>
						</span> <span> <input class="form-control" type="email" name="EMAILID" maxlength="50"
							placeholder="Email Id" name="FirstName" required="required"
							maxlength="15" required="required"> </span>

					</div>

					<div class="form-group has-success">
						<span><label class="labelform">Password</label>
						</span> <span> <input class="form-control" id="FNAME" type="password" name="PASSWORD"
							maxlength="25" placeholder="Password" required="required"
							data-validation-required-message="Please enter your name."
							required="required"> </span>

					</div>


					<div>
						<input type="submit" class="btn btn-success"  value="Submit" class="myButton">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="reset" value="Clear All"  class="btn btn-success" >
					</div><br><br>
					<input type="hidden" value="login" name="action">
				</form>
				<div class="clear"></div>
			</div>
		</div>
	</div>

	<%@include file="Footer.jsp"%>
</body>
</html>