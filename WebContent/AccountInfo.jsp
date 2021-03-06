<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Information</title>
<jsp:include page="HeaderLinks.jsp" />
</head>
<body>
	<jsp:include page="Header.jsp" />
	<!-- Redirect to the error page if user is not logged in -->
	<c:if test="${sessionScope.userId == null}">
		<c:redirect url="Error.jsp" />
	</c:if>
	<div class="container">
		<div class="jumbotron">
			<h2>Account Information</h2>
		</div>
		<!-- Display the appropriate alert message -->
		<c:if test="${message != null}">
			<div class="alert alert-info alert-dismissible" role="alert">
	  			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	  			<p class="text-center"><strong id="message">${message}</strong></p>
			</div>
		</c:if>
		<form action="AccountInfoServlet" method="post" class="form-horizontal">
			<div class="form-group">
		   		<label for="firstName" class="col-sm-3 control-label">First Name</label>
		   		<div class="col-sm-9">
		    		<input type="text" class="form-control" name="firstName" id="firstName" placeholder="First Name" value="${currentUser.firstName}" maxlength="20" required title="Please enter upto 20 characters">
		    	</div>
		  	</div>
		  	<div class="form-group">
		   		<label for="lastName" class="col-sm-3 control-label">Last Name</label>
		   		<div class="col-sm-9">
		    		<input type="text" class="form-control" name="lastName" id="lastName" placeholder="Last Name"value="${currentUser.lastName}" maxlength="20" required title="Please enter upto 20 characters">
		    	</div>
		  	</div>
			<div class="form-group">
			   	<label for="userName" class="col-sm-3 control-label">User Name</label>
			    <div class="col-sm-9">
			    	<input type="text" class="form-control" name="userName" id="userName" placeholder="User Name" value="${currentUser.userName}" maxlength="20" required title="Please enter upto 20 characters">
			    </div>
			 </div>
			 <div class="form-group">
			    <label for="Password" class="col-sm-3 control-label">Password</label>
			    <div class="col-sm-9">
			    	<input type="password" class="form-control" name="password" id="Password" placeholder="Password" value="${currentUser.password}" maxlength="20" required title="Please enter upto 20 characters">
			    </div>
			 </div>
			 <div class="form-group">
			    <label for="RePassword" class="col-sm-3 control-label">Re-Password</label>
			    <div class="col-sm-9">
			    	<input type="password" class="form-control" name="repassword" id="RePassword" placeholder="Re-enter Password" value="${currentUser.password}" maxlength="20" required title="Please enter upto 20 characters">
			    </div>
			 </div>
			 <div class="form-group">
			 	<label class="col-sm-3 control-label">Gender</label>
    			<div class="col-sm-9">
			 		<label class="radio-inline">
    					<input type="radio" name="gender" id="Male" value="M" ${currentUser.gender == 'M' ? 'checked' : ''} required>Male
					</label>
  					<label class="radio-inline">
						<input type="radio" name="gender" id="Female" value="F" ${currentUser.gender == 'F' ? 'checked' : ''} required>Female
  					</label>
				</div>
			</div>
			 <div class="form-group">
			    <label for="Address" class="col-sm-3 control-label">Address</label>
			    <div class="col-sm-9">
			    	<input type="text" class="form-control" name="address" id="Address" pattern="[a-ZA-ZO-9 .]{1,100}" placeholder="Address" value="${currentUser.address}" maxlength="100" required title="Please enter upto 100 charcaters">
			    </div>
			 </div>
			 <div class="form-group">
			    <label for="PhoneNumber" class="col-sm-3 control-label">Phone Number</label>
			    <div class="col-sm-9">
			    	<input type="number" class="form-control" name="phoneNumber" id="PhoneNumber" pattern="[0-9]{10}" maxlength="10" placeholder="Phone Number" value="${currentUser.phoneNumber}" required title="Please enter  a 10 digit numeric phone number">
			    </div>
			 </div>
			 <div class="form-group">
			    <label for="Email" class="col-sm-3 control-label">Email</label>
			    <div class="col-sm-9">
			    	<input type="email" class="form-control" name="email" id="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="Email" value="${currentUser.email}" required title="Please enter a valid email">
			    </div>
			 </div>
			 <div class="form-group">
			 	<div class="col-sm-offset-3 col-sm-9">
			 		<button type="submit" class="btn btn-primary btn-block" id="update">Update</button>
			 	</div>
			 </div>
		</form>
	</div>
	
	<div class="jumbotron" id="hidden">
	</div>
	<!-- Footer -->
	<jsp:include page="Footer.html" />
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>