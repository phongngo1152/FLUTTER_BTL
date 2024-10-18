<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">

<!-- Mirrored from templates.iqonic.design/booksto/html/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Apr 2024 20:47:07 GMT -->
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bookstore</title>
<jsp:include page="../linkcss.jsp"></jsp:include>
</head>
<body>
	<!-- loader Start -->
	<div id="loading">
		<div id="loading-center"></div>
	</div>
	<div class="wrapper">
		<!-- loader END -->
		<jsp:include page="navadmin.jsp"></jsp:include>
		<!-- Page Content  -->
		<div id="content-page" class="content-page">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<div class="iq-card">
							<div class="iq-card-header d-flex justify-content-between">
								<div class="iq-header-title">
									<h4 class="card-title">Comment List</h4>
								</div>

							</div>
							<div class="iq-card-body">
								<div class="table-responsive">
									<table class="data-tables table table-striped table-bordered"
										style="width: 100%">
										<thead>
											<tr>
												<th style="width: 3%;">No</th>
												<th style="width: 15%;">Chapter</th>
												<th style="width: 50%;">Content</th>
												<th style="width: 5%;">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cmt }" var="c">
												<tr>
													<td>${c.commentId }</td>
													<td>${c.chapter.chapterTitle }</td>
													<td>
														<p class="mb-0">${c.content}</p>
													</td>
													<td>
														<div class="flex align-items-center list-user-action">
															<a class="bg-primary" data-toggle="tooltip"
																data-placement="top" title="" data-original-title="Detail"
																href="${pageContext.request.contextPath}/admin/comments/${c.story.storyId}/detail-${c.commentId }"><i class="ri-eye-line"></i></a>
															
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<jsp:include page="../linkjs.jsp"></jsp:include>
</body>

<!-- Mirrored from templates.iqonic.design/booksto/html/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Apr 2024 20:47:07 GMT -->
</html>
