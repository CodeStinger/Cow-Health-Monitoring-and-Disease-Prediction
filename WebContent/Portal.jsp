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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<%String emailid=(String)session.getAttribute("emailid");
String username=(String)session.getAttribute("username");
String msg=(String)request.getAttribute("message");
DAO data=new DAO();
Connection conn=data.getConnection();
// Generate password
// Insert into Login Table3
  String sql = "delete from data";
try {
	PreparedStatement preparedStatement1 = conn.prepareStatement(sql);
	//preparedStatement1.executeUpdate();
	preparedStatement1.close();
	conn.close();
} catch (SQLException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
}



%>
<script type="text/javascript">

//Your web app's Firebase configuration
var firebaseConfig = {
   apiKey: "AIzaSyBSg43vrP100MNpWrEo0HelWgLFfkdJzic",
    authDomain: "esp3333-a38f9.firebaseapp.com",
    databaseURL: "https://esp3333-a38f9-default-rtdb.firebaseio.com",
    projectId: "esp3333-a38f9",
    storageBucket: "esp3333-a38f9.appspot.com",
    messagingSenderId: "318798482860",
    appId: "1:318798482860:web:03c99439f7a6d8f69e3e09",
	measurementId: "G-5SKYNZJSRH"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
firebase.analytics();

// Create firebase database
let messageRef = firebase.database().ref("UsersData");

messageRef.on('value',   function(snapshot) {
	
    snapshot.forEach(function(childSnapshot) {
      var childKey = childSnapshot.key;
      var childData = childSnapshot.val();    
		$.ajax({
            url : 'AB',
            data : {
                data :$('#chat').val(),
        		action : "chatsend",
        		pulse :childData.Pulse,
        		temperature :childData.temperature,
        		humidity :childData.humidity,
        		timestam :childData.timestamp,
            },
            success : function(responseText) {
                $('#chatdetails').text(responseText);
            }
            
        });
    });
  });
  
 
  
// Listening for form submit
document.getElementById("control-from").addEventListener("submit", submitForm);

function submitForm(e) {
  e.preventDefault();

  // get values
  let name = getInputIdal("name");
  let email = getInputIdal("email");
  let message = getInputIdal("Message");

  saveMessage(name, email, message);

  // show alert
  document.querySelector(".alert").style.display = "block";

  // Hide alert after 3sec
  setTimeout(() => {
    document.querySelector(".alert").style.display = "none";
  }, 3000);

  // Clear form
  document.getElementById("control-from").reset();
}

// function to get form value
function getInputIdal(id) {
  return document.getElementById(id).value;
}

// save data to firebase
function saveMessage(name, email, message) {
  let newMessageRef = messageRef.push();
  newMessageRef.set({
    name: name,
    email: email,
    message: message,
  });
}

function onfileselect()
{
	document.getElementById("path").value=document.getElementById("file_upload").value;
	
	}

</script>
<style type="text/css">
body {
	font-family: 'Lucida Grande', 'Helvetica Neue', sans-serif;
	font-size: 13px;
}

div.custom_file_upload {
	width: 400px;
	height: 20px;
	margin: 40px auto;
}

input.file {
	width: 250px;
	height: 35px;
	border: 1px soliRd #BBB;
	border-right: 0;
	color: #888;
	padding: 5px;
	
	-webkit-border-top-left-radius: 5px;
	-webkit-border-bottom-left-radius: 5px;
	-moz-border-radius-topleft: 5px;
	-moz-border-radius-bottomleft: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	
	outline: none;
}

div.file_upload {
	width: 80px;
	height: 35px;
	background: #7abcff;
	background: -moz-linear-gradient(top,  #7abcff 0%, #60abf8 44%, #4096ee 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#7abcff), color-stop(44%,#60abf8), color-stop(100%,#4096ee));
	background: -webkit-linear-gradient(top,  #7abcff 0%,#60abf8 44%,#4096ee 100%);
	background: -o-linear-gradient(top,  #7abcff 0%,#60abf8 44%,#4096ee 100%);
	background: -ms-linear-gradient(top,  #7abcff 0%,#60abf8 44%,#4096ee 100%);
	background: linear-gradient(top,  #7abcff 0%,#60abf8 44%,#4096ee 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#7abcff', endColorstr='#4096ee',GradientType=0 );

	display: inline;
	position: absolute;
	overflow: hidden;
	cursor: pointer;
	
	-webkit-border-top-right-radius: 5px;
	-webkit-border-bottom-right-radius: 5px;
	-moz-border-radius-topright: 5px;
	-moz-border-radius-bottomright: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	
	font-weight: bold;
	color: #FFF;
	text-align: center;
	padding-top: 8px;
}
div.file_upload:before {
	content: 'Browse';
	position: absolute;
	left: 0; right: 0;
	text-align: center;
	
	cursor: pointer;
}

div.file_upload input {
	position: relative;
	height: 30px;
	width: 250px;
	display: inline;
	cursor: pointer;
	opacity: 0;
}

</style>
</head>
<body>
<%@include file="AfterLoginHeader.jsp"%>

<br><br><br>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="37%" align="center"><table width="195" border="0" cellspacing="0" cellpadding="0">
              <tr>
              <label style="text-align: center;"><font color="#A3OB37"> Welcome <%=username%></font>
</label>
<form action="<%=request.getContextPath() %>/AB" method="post">              
	<br><br><br><label style="text"><font color="#3C91E6">View Realtime Data Graphically</font></label>
	<br>	<br><br><input type="date" id="file_upload" name="date1">

		<input type="hidden" value="chart" name="action" >
<br>	<br>
<input type="radio"  name="a" value="temperature"><label>Temperature</label>
<input type="radio" name="a"  value="pulse"><label>Pulse</label>
<input type="radio" name="a"  value="humidity"><label>Humidity</label><br><br>
	<input class="button"  type="submit" value="Get Data" style="background-color:#3C91E6">
	
	
	<input type="hidden" value="chart" name="action">
</td>
              </tr>
              <tr>
              </form>
              <%if(msg!=null){ %>
		<img src="linechart.jpeg"/>
	<%} %>
              <br><br><br><br><br><br><br><br><br><br>
         
            
              <%@include file="Footer.jsp"%>
</body>
</html>