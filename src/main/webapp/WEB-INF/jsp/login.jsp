<%-- 
    Document   : login
    Created on : Aug 11, 2019, 5:54:27 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
	<section class="login_part padding_top">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6">
					<div class="login_part_text text-center">
						<div class="login_part_text_iner">
							<h2>New to our Shop?</h2>
							<p>There are advances being made in science and technology
								everyday, and a good example of this is the</p>
							<a href="#" class="btn_3">Create an Account</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="login_part_form">
						<div class="login_part_form_iner">
							<h3>
								Welcome Back ! <br> Please Sign in now
							</h3>
							<form class="row contact_form" novalidate="novalidate"
								action="<c:url value="j_spring_security_check" />" method="post">

								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="name" name="email"
										value="" placeholder="Email">
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="password" class="form-control" id="password"
										name="password" value="" placeholder="Password">
								</div>

								<div class="col-md-12 form-group">
									<button type="submit" value="submit" class="btn_3">
										log in</button>
								</div>
								
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
									
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="include/footer.jsp" />

	<jsp:include page="include/footer-script.jsp" />
</body>
</html>
