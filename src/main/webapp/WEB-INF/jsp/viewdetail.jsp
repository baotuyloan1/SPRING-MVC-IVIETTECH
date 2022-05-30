
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>

<html lang="zxx">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Site Title -->
<title>Coffee</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<jsp:include page="include/header-css.jsp"></jsp:include>
<style>
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
	<!-- start banner Area -->
	<jsp:include page="include/banner.jsp" />
	<!-- End banner Area -->

	<!--================Single Product Area =================-->
	<div class="product_image_area section_padding">
		<div class="container">
			<div class="row s_product_inner justify-content-between">
				<div class="col-lg-7 col-xl-7">
					<div class="product_slider_img">

						<div id="vertical">

							<c:if
								test="${product.images!=null || fn:length(product.images)>0}">
								<c:forEach var="image" items="${product.images}">
									<div
										data-thumb="<c:url value="/resources/img/products/${image.name}"/>">
										<img
											src="<c:url value="/resources/img/products/${image.name}"/>"></img>
									</div>
								</c:forEach>
							</c:if>





						</div>


					</div>
				</div>
				<div class="col-lg-5 col-xl-4">
					<div class="s_product_text">
						<form action="<s:url value="/update_order"/>">
							<h5>
								Previous<span>|</span> next
							</h5>
							<h3>${product.name}</h3>

							<c:if test="${product.price != price_old}">
								<div class="c">
									<h5>${price_old}00VNĐ</h5>

								</div>
							</c:if>
							<h2>${product.price}00VNĐ</h2>


							<ul class="list">
								<li><a class="active" href="#"> <span>Producer</span>${product.producer.name}</a>
								</li>
								<li><a href="#"> <span>Availibility</span>
										${product.category.status}
								</a></li>
							</ul>
							<p>${product.category.description}</p>
							<div
								class="card_area d-flex justify-content-between align-items-center">

								<s:url var="url_order" value="/order_product">
									<s:param name="productId" value="${product.id}" />
								</s:url>
								<button class="btn btn-info" type="button"
													onclick='location.href = "${url_order}"'>order
													Product</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">Specification</a></li>
				<li class="nav-item"><a class="nav-link" id="contact-tab"
					data-toggle="tab" href="#contact" role="tab"
					aria-controls="contact" aria-selected="false">Comments</a></li>
				<li class="nav-item"><a class="nav-link active" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">Reviews</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<p>Beryl Cook is one of Britain’s most talented and amusing
						artists .Beryl’s pictures feature women of all shapes and sizes
						enjoying themselves .Born between the two world wars, Beryl Cook
						eventually left Kendrick School in Reading at the age of 15, where
						she went to secretarial school and then into an insurance office.
						After moving to London and then Hampton, she eventually married
						her next door neighbour from Reading, John Cook. He was an officer
						in the Merchant Navy and after he left the sea in 1956, they
						bought a pub for a year before John took a job in Southern
						Rhodesia with a motor company. Beryl bought their young son a box
						of watercolours, and when showing him how to use it, she decided
						that she herself quite enjoyed painting. John subsequently bought
						her a child’s painting set for her birthday and it was with this
						that she produced her first significant work, a half-length
						portrait of a dark-skinned lady with a vacant expression and large
						drooping breasts. It was aptly named ‘Hangover’ by Beryl’s husband
						and</p>
					<p>It is often frustrating to attempt to plan meals that are
						designed for one. Despite this fact, we are seeing more and more
						recipe books and Internet websites that are dedicated to the act
						of cooking for one. Divorce and the death of spouses or grown
						children leaving for college are all reasons that someone
						accustomed to cooking for more than one would suddenly need to
						learn how to adjust all the cooking practices utilized before into
						a streamlined plan of cooking that is more efficient for one
						person creating less</p>
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>

								<tr>
									<td>
										<h5>Pha chế</h5>
									</td>
									<td>
										<h5>${product.preparation}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Thành phần</h5>
									</td>
									<td>
										<h5>${product.category.name}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Kích thước</h5>
									</td>
									<td>
										<h5>${product.particleSize}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Cách rang</h5>
									</td>
									<td>
										<h5>${product.howToRoast}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Hàm lượng</h5>
									</td>
									<td>
										<h5>${product.content}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Thời hạn</h5>
									</td>
									<td>
										<h5>${product.duration}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Trạng thái</h5>
									</td>
									<td>
										<h5>${product.status}</h5>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="contact" role="tabpanel"
					aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="comment_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-1.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2017 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item reply">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-2.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2017 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-3.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2017 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Post a comment</h4>
								<form class="row contact_form" action="contact_process.php"
									method="post" id="contactForm" novalidate="novalidate">
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name" name="name"
												placeholder="Your Full name" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="email" class="form-control" id="email"
												name="email" placeholder="Email Address" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="number"
												name="number" placeholder="Phone Number" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="message" id="message"
												rows="1" placeholder="Message"></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="btn_3">
											Submit Now</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade show active" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Overall</h5>
										<h4>4.0</h4>
										<h6>(03 Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on 3 Reviews</h3>
										<ul class="list">
											<li><a href="#">5 Star <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">4 Star <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">3 Star <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">2 Star <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">1 Star <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> 01
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-1.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-2.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-3.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Add a Review</h4>
								<p>Your Rating:</p>
								<ul class="list">
									<li><a href="#"> <i class="fa fa-star"></i>
									</a></li>
									<li><a href="#"> <i class="fa fa-star"></i>
									</a></li>
									<li><a href="#"> <i class="fa fa-star"></i>
									</a></li>
									<li><a href="#"> <i class="fa fa-star"></i>
									</a></li>
									<li><a href="#"> <i class="fa fa-star"></i>
									</a></li>
								</ul>
								<p>Outstanding</p>
								<form class="row contact_form" action="contact_process.php"
									method="post" novalidate="novalidate">
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" name="name"
												placeholder="Your Full name" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="email" class="form-control" name="email"
												placeholder="Email Address" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" name="number"
												placeholder="Phone Number" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="message" rows="1"
												placeholder="Review"></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="btn_3">
											Submit Now</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->

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
											alt=""></img>
										<div class="single_product_text">
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

											<h3>${product.price}00VNĐ</h3>



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
	<!-- start footer Area -->
	<jsp:include page="include/footer.jsp" />
	<jsp:include page="include/footer-script.jsp" />

</body>

</html>