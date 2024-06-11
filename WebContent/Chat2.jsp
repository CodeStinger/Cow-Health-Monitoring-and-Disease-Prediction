<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chat</title>
<%String msg = (String) request.getAttribute("msg");
String emailid = (String) session.getAttribute("emailid");

 	String type= (String) session.getAttribute("userType"); %>

<script src="<%=request.getContextPath() %>/js/chat.js"
    type="text/javascript"></script>
<script>
	
	
 
$(document).ready(function() {
	    
        $('#send').click(function() {
        		$.ajax({
            url : 'RegistrationServlet',
            data : {
                data :$('#chat').val(),
        		page : "chatsend",
        		receiver :$('#receiver').val()
        		
            },
            success : function(responseText) {
                $('#chatdetails').text(responseText);
            }
            
        });
        		$('#chat').val("");
        });
        });
   setInterval(function() {
        		$.ajax({
            url : 'RegistrationServlet',
            data : {
        		page : "getchat",
        		receiver :$('#receiver').val()
        		
            },
            success : function(responseText) {
                $('#chatdetails').text(responseText);
            }
        })},3000);
    
    
</script>




</script>
</head>
<body>
<%if("Patient".equalsIgnoreCase(type)){ %>

<%@include file="Pafterlogin.jsp"%>
<%}else{ %>
<%@include file="Dafterlogin.jsp"%>
<%} %>

<div class="wrap">
<div class="col span_2_of_3">
				  <div class="contact-form">

<%if(msg!=null){ %>

<label style="color:red"><%=msg %></label>
<%} else{%>

					      
						     <div>
						     	<span><label class="labelform">Chat Details</label></span>
						    	<span><textarea rows="10" cols="10" id="chatdetails" readonly="readonly" class="textarea"  required="required" maxlength="50" onkeyup="checklength()"></textarea></span>
						    </div>
						    
						   <div>
						   
					    	<div>
						    	<span><label class="labelform"> Write to Chat</label></span>
						    	<span><input id="chat" name="chat" type="text" class="textbox" placeholder="Write to Chat" maxlength="45" required="required" ></span>
						    	
						    </div>
<input type="hidden" value="<%=request.getParameter("receiver") %>" id="receiver">						    
						   		<span><input type="button" id="send" value="Send"></span>
						  </div>
						  <%} %>  
				    </div>
				    
  				</div>		
  						
  				<div class="clear"></div>
</div>
<%@include file="Footer.jsp"%>



</div>
</div>
</div>

</body>
</html>