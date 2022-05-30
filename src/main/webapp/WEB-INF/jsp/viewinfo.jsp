
<%-- 
    Document   : viewinfo
    Created on : Aug 17, 2019, 8:01:13 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<jsp:include page="include/header-css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="include/top-menu.jsp" />


	<jsp:include page="include/banner.jsp" />
	<!--================ confirmation part start =================-->
	<section class="confirmation_part padding_top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="confirmation_tittle">
						<span>Your Account</span>
					</div>
				</div>
				<div class="col-lg-12 col-lx-4">
					<div class="single_confirmation_details">
						<h4>Your info</h4>
						<ul>
							<li>
								<p>Full name</p> <span>${acc.fullName}</span>
							</li>
							<li>
								<p>Address</p> <span>${acc.address }</span>
							</li>
							<li>
								<p>Gender</p> <span>${acc.gender }</span>
							</li>
							<li>
								<p>Vote shop</p> <span>${acc.voteShop}</span>
							</li>
							<li>
								<p>Phone number</p> <span>${acc.phoneNumber}</span>

							</li>
							<li>
								<p>Email</p> <span>${acc.email}</span>
							</li>
						</ul>
					</div>
				</div>


			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="order_details_iner">
						<h3>Order history details</h3>
						<table class="table table-borderless">
							<thead>
								<tr>
									<th scope="col" colspan="1">Customer Name</th>
									<th scope="col">Order Date</th>
									<th scope="col">Total Price</th>
									<th scope="col">Address</th>
									<th scope="col">Phone number</th>
									<th scope="col">Status</th>
									<th scope="col">View detail order</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${orders!=null || fn:length(orders)>0}">

									<c:forEach var="order" items="${orders}">

										<c:if test="${order.id > 0 }">
											
										<tr>
										
											<th colspan="1"><span>${order.customer.fullName}</th>
											<th>${order.date }</th>



											<th><fmt:formatNumber type="number"
											minFractionDigits="3"		 value="${order.totalPrice}" /> VNĐ</th>
											<th>${order.customer.address }</th>
											
											
											<th>${order.customer.phoneNumber}</th>
											<th><c:if test="${order.status == \"Ordered\"  }">
											  <button type="button" class="btn btn-danger" 	onclick='location.href="<c:url value="/user/deleteOrder/${order.customer.id}"/> "'>Cancel</button>
											</c:if>
											${order.status }
											</th>
												
											<th><a
												href="<c:url value="/viewOrderDetail/${order.id}"/>">
													View Detail</a></th>
										</tr></c:if>
									</c:forEach>
								</c:if>

							</tbody>
							<tfoot>
								<tr>
									<th scope="col" colspan="3">Quantity</th>
									<th scope="col">Total</th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ confirmation part end =================-->
	<jsp:include page="include/footer.jsp" />

	<jsp:include page="include/footer-script.jsp" />
</body>
</html>
