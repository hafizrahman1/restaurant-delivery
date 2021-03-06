<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Logout Page</title>
	<jsp:include page="HeaderLinks.jsp" />
</head>
<body>
	<jsp:include page="Header.jsp" />
	<div class="container">
		<div class="logout-content text-center">
			<h3>Thanks for Visiting US!! You have successfully logged out.</h3>
			<h4>Want to Log back in? Click below</h4>
			<div class="logout-page-button">
				<a href="Login.jsp"><button class="btn btn-md btn-primary">Login</button></a>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="Footer.html" />
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>