<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<header id="header" id="home">
	<div class="header-top">
		<div class="container">
			<div class="row justify-content-end">
				<div class="col-lg-8 col-sm-4 col-8 header-top-right no-padding">
					<ul>
						<li>Mon-Fri: 8am to 2pm
						<li>Sat-Sun: 11am to 4pm</li>
						<li><a href="tel:(94) 78 804 9042">(078) 804 236 7512</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row align-items-center justify-content-between d-flex">
			<div id="logo">
				<a href="index.html"> <img
					src="<c:url value="/resources/img/logo.png"/>" alt="
					"
					title=""></img>


				</a>
			</div>
			<nav id="nav-menu-container">
				<ul class="nav-menu">

					<sec:authorize access="isAuthenticated()">
						<div class="alert alert-success">
							<sec:authentication property="principal.fullName" />
						</div>
					</sec:authorize>

					<li class="menu-active"><a
						href="${pageContext.request.contextPath}/home">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="${pageContext.request.contextPath}/category">Category</a></li>





					<sec:authorize access="!isAuthenticated()">
						<li><a href="${pageContext.request.contextPath}/login">Login</a></li>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<li><a href="<c:url value="/logout" />">Logout</a></li>
					</sec:authorize>

					<li><a href="${pageContext.request.contextPath}/shopping_cart">Shopping
							cart</a></li>

					<sec:authorize access="isAuthenticated()">
						<li class="menu-has-children"><a href="">
								accountmanagement</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/viewinfo">Information</a></li>
								<li><a href="elements.html">Elements</a></li>
							</ul></li>
					</sec:authorize>


				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</div>
</header>
<!-- #header -->
