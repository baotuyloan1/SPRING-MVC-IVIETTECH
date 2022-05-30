<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Site Title -->
<title>Coffee</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<jsp:include page="../include/header-css.jsp"></jsp:include>

</head>
<body>

	<jsp:include page="../include/top-menu.jsp" />


	<jsp:include page="../include/banner.jsp" />
	<div class="row">
		<div class="col-sm-12" style="text-align: center;">
			<h1 id="header1">
				Order Date
				<fmt:formatDate type="date" value="${order.date}"
					pattern="dd/MM/yyyy" />
			</h1>
		</div>
	</div>


	<form action="<s:url value="/update_order"/>">
		<div class="container">
			<table id="cart" class="table table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 50%">Tên sản phẩm</th>
						<th style="width: 14%">Giá</th>
						<th style="width: 9%">Số lượng</th>

						<th style="width: 20%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="o" items="${order.orderDetails}" varStatus="st">
						<tr>
							<td data-th="Product">
								<div class="row">

									<div class="col-sm-2 hidden-xs">
										<img src="/resources/img/products/${o.product.images[0].name}"
											alt="" class="img-responsive" width="80">
									</div>
									<div class="col-sm-10">
										<h4 class="nomargin">${o.name}</h4>
										<p>${o.product.category.description}</p>
									</div>
								</div>
							</td>
							<td data-th="Price">${o.price}00VNĐ</td>
							<td data-th="Quantity"><input class="form-control mb-2"
								type="number" name="quantity" value="${o.quantity}" /></td>

							<td class="actions" data-th="">

								<button class="btn btn-danger btn-sm" type="button"
									onclick='location.href="<c:url value="/delete_dt/${o.product.id}"/> "'>DELETE
								</button>
							</td>
						</tr>
					</c:forEach>


				</tbody>
				<tfoot>

					<tr>
						<td>
							<button class="btn btn-warning" type="button"
								onclick='location.href = "<c:url value="/continue" />"'>
								<i class="fa fa-angle-left"></i> Tiếp tục mua hàng
							</button>
						</td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs text-center"><strong>Tổng tiền
								${order.totalPrice}00 VNĐ</strong></td>

						<td>


							<div class="col-sm-6" align="center">
								<div class="btn-group" role="group" aria-label="nhom_thao_tac">

									<button class="btn btn-success btn-block">Update</button>
								</div>
							</div>
						</td>

						<sec:authorize access="!isAuthenticated()">
							<td><a href="<c:url value="/check_out" />"
								class="btn btn-success btn-block">Đặt hàng <i
									class="fa fa-angle-right"></i></a></td>
						</sec:authorize>

						<sec:authorize access="isAuthenticated()">
							<td><a href="<c:url value="/user/check_out" />"
								class="btn btn-success btn-block">Đặt hàng <i
									class="fa fa-angle-right"></i></a></td>
						</sec:authorize>

					</tr>
				</tfoot>
			</table>
		</div>
	</form>


	<jsp:include page="../include/footer.jsp" />

	<jsp:include page="../include/footer-script.jsp" />

</body>
</html>



