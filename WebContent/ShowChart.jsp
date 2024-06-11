<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chart Portal</title>
<%String s = (String) request.getAttribute("a"); %>
</head>
<body>
<%@include file="AfterLoginHeader.jsp"%>
		
		<h2>
			Chart<span>Form</span>
		</h2>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="37%" align="center"><table width="195" border="0" cellspacing="0" cellpadding="0">
              <tr>
<form id="contacts-form"
			action="<%=request.getContextPath()%>/GetChart"
			method="post" name="registration" onsubmit="save();">
						<input type="submit" value="Generate Chart" >
					
							
	</form>
	
	</tr>
	</td>
		</tr>
	<tr>

	
	</table>

	</table>
		<div align="center">	
	<%if("a".equals(s)){ %>
	<img src="BarChart.jpeg">
<%} %>		
</div>

</body>
</html>