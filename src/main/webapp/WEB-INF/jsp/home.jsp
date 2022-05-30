
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<jsp:include page="include/header-css.jsp"></jsp:include>
<style type="text/css">
div.c {
	-webkit-text-decoration-line: line-through; /* Safari */
	text-decoration-line: line-through;
	color: red;
}

div.c h5 {
	color: red;
}
</style>
</head>
<body>

	<jsp:include page="include/top-menu.jsp" />


	<jsp:include page="include/banner.jsp" />
	<!-- Start video-sec Area -->
	<section class="video-sec-area pb-100 pt-40" id="about">
		<div class="container">
			<div class="row justify-content-start align-items-center">
				<div
					class="col-lg-6 video-right justify-content-center align-items-center d-flex">
					<div class="overlay overlay-bg"></div>
					<a class="play-btn"
						href="https://www.youtube.com/watch?v=ARA0AxrnHdM"><img
						class="img-fluid" src="img/play-icon.png" alt=""></a>
				</div>
				<div class="col-lg-6 video-left">
					<h6>Live Coffee making process.</h6>
					<h1>
						We Telecast our <br> Coffee Making Live
					</h1>
					<p>
						<span>We are here to listen from you deliver exellence</span>
					</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod temp or incididunt ut labore et dolore magna
						aliqua. Ut enim ad minim.</p>
					<img class="img-fluid" src="img/signature.png" alt="">
				</div>
			</div>
		</div>
	</section>
	<!-- End video-sec Area -->
	<c:if test="${message != null}">
		<script>
			alert("Đã đặt hàng , vui lòng kiểm tra lại email");
		</script>
	</c:if>
	<!-- Start menu Area -->
	<section class="menu-area section-gap" id="coffee">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-60 col-lg-10">
					<div class="title text-center">
						<h1 class="mb-10">What kind of Coffee we serve for you</h1>
						<p>Who are in extremely love with eco friendly system.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:if test="${products!=null || fn:length(products)>0}">
					<c:forEach var="product" items="${products}">
						<div class="col-lg-4">
							<a href="<c:url value="/view-detail/${product.id}"/>">
								<div class="single-menu">
									<div class="title-div justify-content-between d-flex">
										<h4>${product.name}</h4>

										<c:if test="${products1!=null || fn:length(products1)>0}">

											<c:forEach var="product1" items="${products1}">
												<c:if
													test="${product.id == product1.id && product.price != product1.price}">

													<div class="c">
														<h5>${product1.price }00VNĐ</h5>

													</div>
													<br>

												</c:if>

											</c:forEach>
										</c:if>

										<p class="price float-right">${product.price}00đ</p>


									</div>
									<p>
									<div class="col-sm-12">
										<img
											src="<c:url value="/resources/img/products/${product.images[0].name}"/>"
											style="width: 100%;"></img>
									</div>

									<p></p>
									<p></p>
									</p>

								</div>
							</a>
						</div>
					</c:forEach>
				</c:if>
			</div>

		</div>
	</section>
	<!-- End menu Area -->



	<jsp:include page="include/footer.jsp" />

	<jsp:include page="include/footer-script.jsp" />


</body>
</html>



