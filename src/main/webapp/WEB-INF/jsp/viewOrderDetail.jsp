<%-- 
    Document   : login
    Created on : Aug 11, 2019, 5:54:27 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<jsp:include page="include/header-css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="include/top-menu.jsp" />


	<jsp:include page="include/banner.jsp" />
	<section class="confirmation_part padding_top">
		<div class="container">
			<div class="order_details_iner">
				<table class="table table-borderless">
					<thead>
						<tr>
							<th scope="col" colspan="1">Product Name</th>
							<th scope="col">Quantity</th>
							<th scope="col">Price</th>
							
							<th scope="col">Total Price</th>
							<th scope="col">Customer name</th>
<th scope="col">Address</th>

						</tr>
					</thead>
					<tbody>
						<c:if test="${orderDetails!=null || fn:length(orderDetails)>0}">

							<c:forEach var="orderDetail" items="${orderDetails}">


								<tr>
									<th colspan="1"><span>${orderDetail.name}</th>

									<th>${orderDetail.quantity}</th>

									<th><fmt:formatNumber type="number" minFractionDigits="3"
											value="${orderDetail.price }" /> VNĐ</th>
								


									<th><fmt:formatNumber type="number" minFractionDigits="3"
											value="${orderDetail.quantity * orderDetail.price }" /> VNĐ</th>
								<th>${orderDetail.order.customer.fullName}</th>
	<th>${orderDetail.order.customer.address}</th>

								</tr>


							</c:forEach>
						</c:if>

					</tbody>
					
				</table>
			</div>
		</div>
	</section>

	<jsp:include page="include/footer.jsp" />

	<jsp:include page="include/footer-script.jsp" />
</body>
</html>
