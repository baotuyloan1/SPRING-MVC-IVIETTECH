<%-- 
    Document   : checkout
    Created on : Aug 8, 2019, 8:38:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<jsp:include page="include/header-css.jsp"></jsp:include>
<style>
.ui-error {
	color: red;
}
</style>
</head>
<body>

	<jsp:include page="include/top-menu.jsp" />


	<jsp:include page="include/banner.jsp" />

	<div class="container">
		<div class="returning_customer">

			<p>If you have shopped with us before, please enter your details
				in the boxes below. If you are a new customer, please proceed to the
				Billing & Shipping section.</p>



		</div>

		<div class="billing_details">
			<form:form class="row contact_form"
				action="${pageContext.request.contextPath}/submit_order"
				method="post" novalidate="novalidate" modelAttribute="customerInfo">
				<div class="row">
					<div class="col-lg-8">
						<h3>Billing Details</h3>






						<div class="col-md-12 form-group p_star">
							<input type="text" class="form-control" id="first"
								name="fullName" placeholder="Full name" required
								value="${acc.fullName}" />
							<form:errors path="fullName" cssClass="ui-error" />

						</div>


						<div class="col-md-12 form-group p_star">
							<input type="text" class="form-control" id="number"
								name="phoneNumber" placeholder="Phone number" required
								value="${acc.phoneNumber}" />
							<form:errors path="phoneNumber" cssClass="ui-error" />
						</div>

						<div class="col-md-12 form-group p_star">
							<input type="text" class="form-control" id="email" name="email"
								placeholder="Email Address" required value="${acc.email}" />
										<form:errors path="email" cssClass="ui-error" />

						</div>

						<div class="col-md-12 form-group p_star">
							<input type="text" class="form-control" id="add1" name="address"
								placeholder="Address" required value="${acc.address}" />
								<form:errors path="address" cssClass="ui-error" />
						</div>

						<div class="col-md-12 form-group p_star">
							<label path="gender" class="control-label col-sm-2">
								Gender</label>
							<div class="col-sm-8">
								<c:forEach items="${genders}" var="gender">

									<label class="radio-inline"> <input type="radio"
										name="gender" value="${gender}" /> ${gender}
									</label>


								</c:forEach>
							</div>
						</div>









					</div>
					<div class="col-lg-4">
						<div class="order_box">
							<h2>Your Order</h2>
							<ul class="list">
								<li><a href="#">Product <span>Total</span>
								</a></li>
								<c:forEach var="o" items="${order.orderDetails}" varStatus="st">
									<li><a href="#">${o.name} <span class="middle">X${o.quantity}</span>
											<span class="last">${o.price}00 VNĐ</span>
									</a></li>
								</c:forEach>


								<li><a href="#">Shipping <span>Flat rate:
											50.000VNĐ</span>
								</a></li>
								<li><a href="#">Total <span>${order.totalPrice}00
											VNĐ</span>
								</a></li>
							</ul>



							<div class="form-group" style="text-align: center">
								<button class="btn_3" type="submit">Order</button>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>


	<jsp:include page="include/footer-script.jsp" />
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
