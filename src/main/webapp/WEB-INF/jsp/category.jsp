<%-- 
    Document   : home1
    Created on : Jul 24, 2019, 4:34:49 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Site Title -->
<title>Coffee</title>
<jsp:include page="include/header-css.jsp"></jsp:include>
<style type="text/css">
div.c {
	-webkit-text-decoration-line: line-through; /* Safari */
	text-decoration-line: line-through;
	color: red ;
	
}

div.c h5{
	color: red;
}
</style>
</head>
<body>

	<!-- Header part end-->
	<jsp:include page="include/top-menu.jsp" />
	<!--================Home Banner Area =================-->
	<!-- breadcrumb start-->
	<jsp:include page="include/banner.jsp" />

	<!--================Category Product Area =================-->
	<section class="cat_product_area section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="left_sidebar_area">
						<aside class="left_widgets p_filter_widgets">
							<div class="l_w_title">
								<h3>Browse Categories</h3>
							</div>
							<div class="widgets_inner">
								<ul class="list">

									<c:if test="${producers!=null || fn:length(producers)>0}">
										<c:forEach var="producer" items="${producers}">
											<li><a
												href="${pageContext.request.contextPath}/findProductByProducer/${producer.id}">${producer.name}</a>

											</li>
										</c:forEach>
									</c:if>




								</ul>
							</div>
						</aside>



						<aside class="left_widgets p_filter_widgets">
							<div class="l_w_title">
								<h3>Color Filter</h3>
							</div>
							<div class="widgets_inner">
								<ul class="list">
									<li><a href="#">${numberPage}</a></li>
									<li><a href="#">${totalPage}</a></li>
									<li class="active"><a href="#">Black with red</a></li>
									<li><a href="#">Gold</a></li>
									<li><a href="#">Spacegrey</a></li>
								</ul>
							</div>
						</aside>

						<aside class="left_widgets p_filter_widgets price_rangs_aside">
							<div class="l_w_title">
								<h3>Price Filter</h3>
							</div>
							<div class="widgets_inner">
								<div class="range_item">
									<!-- <div id="slider-range"></div> -->
									<input type="text" class="js-range-slider" value="" />
									<div class="d-flex">
										<div class="price_text">
											<p>Price :</p>
										</div>
										<div class="price_value d-flex justify-content-center">
											<input type="text" class="js-input-from" id="amount" readonly />
											<span>to</span> <input type="text" class="js-input-to"
												id="amount" readonly />
										</div>
									</div>
								</div>
							</div>
						</aside>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-12">
							<div
								class="product_top_bar d-flex justify-content-between align-items-center">
								<div class="single_product_menu">
									<p>
										<span>${product_found}</span> Product Found
									</p>
								</div>
								<div class="single_product_menu d-flex">
									<h5>short by :</h5>
									<select onchange="location = this.value;">

										<option value="#">Name</option>

										<option value="#">Price</option>
									</select>
								</div>
								<div class="single_product_menu d-flex"></div>


								<form action="${pageContext.request.contextPath}/search"
									method="GET" class="form-inline">

									<div class="form-group">
										<input name="searchTxt" class="form-control" /> <input
											type="submit" value="search" class="btn btn-info" />

									</div>
								</form>





							</div>
						</div>
					</div>



					<div class="row align-items-center latest_product_inner">

						<c:if test="${products!=null || fn:length(products)>0}">
							<c:forEach var="product" items="${products}">

								<div class="col-lg-4 col-sm-6">
									<div class="single_product_item">
										<a href="<c:url value="/view-detail/${product.id}"/>"> <img
											src="<c:url value="/resources/img/products/${product.images[0].name}"/>"
											style="width: 100%;"></img>
										</a>
										<div class="single_product_text">
											<h4>${product.name}</h4>

											<c:if test="${products1!=null || fn:length(products1)>0}">
												<c:forEach var="product1" items="${products1}">
													<c:if test="${product.id == product1.id && product.price != product1.price}">
													
												<div class="c">	<h5>${product1.price }00VNĐ</h5> </div>
													
													
													</c:if>
													
												</c:forEach>
											</c:if>
											<h5>${product.price }00VNĐ</h5>
											
											
											
											
											<s:url var="url_order" value="/order_product">
												<s:param name="productId" value="${product.id}" />
											</s:url>
											<td>
												<button class="btn btn-info" type="button"
													onclick='location.href = "${url_order}"'>order
													Product</button>
											</td>
										</div>
									</div>
								</div>
										
												</c:forEach>
											</c:if>
					</div>




					<div class="col-lg-12">
						<div class="pageination">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">




									<c:forEach var="i" begin="1" end="${totalPage}">
										<li class="page-item"><a class="page-link"
											href="<c:url value="/category/${i-1}"/>"><c:out
													value="${i}" /></a></li>

									</c:forEach>



								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<!--================End Category Product Area =================-->



	<!-- product_list part start-->
	<section class="product_list best_seller">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="section_tittle text-center">
						<h2>
							Best Coffee <span>shop</span>
						</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center justify-content-between">
				<div class="col-lg-12">
					<div class="best_product_slider owl-carousel">

						<c:if test="${products!=null || fn:length(products)>0}">
							<c:forEach var="product" items="${products}">
								<a href="<c:url value="/view-detail/${product.id}"/>">


									<div class="single_product_item">
										<img
											src="<c:url value="/resources/img/products/${product.images[0].name}"/>"
											style="width: 100%;"></img>
										<div class="single_product_text">
											<h4>${product.name}</h4>
												<c:if test="${products1!=null || fn:length(products1)>0}">
												<c:forEach var="product1" items="${products1}">
													<c:if test="${product.id == product1.id && product.price != product1.price}">
													
												<div class="c">	<h5>${product1.price }00VNĐ</h5> </div>
													
													
													</c:if>
													
												</c:forEach>
											</c:if>
											<h5>${product.price }00VNĐ</h5>
											
									
										</div>
									</div>
								</a>


							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- product_list part end-->



	<jsp:include page="include/footer.jsp" />

	<jsp:include page="include/footer-script.jsp" />




</body>

</html>