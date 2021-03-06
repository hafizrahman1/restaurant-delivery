<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Review Order</title>
<jsp:include page="HeaderLinks.jsp" />
</head>
<body>
<jsp:include page="Header.jsp" />
	<!-- Only display process order or cancel order button if the user is logged in and added item to the cart otherwise send back to the menu items page-->
	<c:if test="${sessionScope.userId == null || fn: length(sessionScope.cartIds) == 0}">
		<c:redirect url="MenuItemServlet" />
	</c:if>

	<div class="container">
		<form action="ReviewOrderServlet" method="post">
			<div class="group-btn">
				<button class="btn btn-lg btn-success" type="submit" name="process" id="process">Process Order</button>
				<button class="btn btn-lg btn-danger" type="submit" name="cancel" id="cancel">Cancel Order</button>
			</div>
		</form>
	</div>
	<div class="container" id="cartItems">
		<div class="jumbotron">
			<h2>Order Review</h2>
		</div>
		<!-- Show the appropriate alert message -->
		<c:if test="${message != null}">
			<div class="alert alert-info alert-dismissible" role="alert">
	  			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	  			<p class="text-center"><strong id="message">${message}</strong></p>
			</div>
		</c:if>
		<div id="order-details" class="table_block table-responsive">
			<table id="cart_summary" class="table table-bordered">
				<thead>
					<tr>
						<th>Product</th>
						<th>Description</th>
						<th>Unit Price</th>
						<th>Quantity</th>
						<th>Total</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<!-- Go through each item in the cart and display the order summary -->
					<c:forEach items="${sessionScope.cartItems}" var="item">
						<tr>
							<td class="cart_product text-center">
								<a href="ItemServlet?itemId=${item.itemId}">
									<img alt="item-${item.itemId}" src="${pageContext.request.contextPath}/images/${item.image}" class="img-rounded" width="100" height="100">
								</a>
							</td>
							<td class="cart_description">
								<p class="product-name" id="item-name"><strong>${item.itemName}</strong></p>
								<p class="product-description" id="item-desc">${item.itemDescription}</p>
								
							</td>
							<td class="cart_unit" data-title="Unit Price">
								<span class="price" id="item-price">$${item.itemPrice}</span>
							</td>
							<td class="cart_quantity text-center">1</td>
							<td class="cart_total" data-title="Total">
								<span class="price" id="total_product_price">$${item.itemPrice}</span>
							</td>
							<td class="cart_delete text-center" data-title="Remove">
								<form action="ReviewOrderServlet" method="post">
									<!-- Only display if the user is logged in -->
									<c:if test="${sessionScope.userId != null}">
										<button class="btn btn-sm btn-danger" type="submit" name="remove" value="${item.itemId}">Remove</button>
									</c:if>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr class="cart_subtotal_price">
						<td rowspan="3" colspan="2" id="cart_voucher" class="cart_voucher"></td>
						<td colspan="3" class="text-right"><strong>Sub Total</strong></td>
						<td colspan="1" class="price" id="subtotal">$${sessionScope.subtotal}</td>
					</tr>
					<tr class="cart_total_tax">
						<td colspan="3" class="text-right"><strong>Tax</strong></td>
						<td colspan="1" class="price" id="total_tax">$${sessionScope.taxAmount}</td>
					</tr>
					<tr class="cart_total_price">
						<td colspan="3" class="text-right"><strong>Total</strong></td>
						<td colspan="1" class="price" id="total_tax">$${sessionScope.totalPrice}</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="Footer.html" />
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>