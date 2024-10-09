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
									<h4 class="card-title">Category List</h4>
								</div>
								<div class="iq-card-header-toolbar d-flex align-items-center">
									<a
										href="${pageContext.request.contextPath}/admin/cate-create-form"
										class="btn btn-primary">Add New Category</a>
								</div>
							</div>
							<div class="iq-card-body">
								<div class="table-responsive">
									<c:if test="${not empty message}">
										<div class="alert alert-success alert-dismissible fade show"
											role="alert">
											<strong>${message}!</strong>
											<button type="button" class="close text-black"
												data-dismiss="alert" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>

									</c:if>

									<c:if test="${not empty error}">
										<div class="alert alert-danger alert-dismissible fade show"
											role="alert">
											<strong>${error}!</strong>
											<button type="button" class="close text-black"
												data-dismiss="alert" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
									</c:if>
									<table class="data-tables table table-striped table-bordered"
										style="width: 100%">
										<thead>
											<tr>
												<th style="width: 3%;">No</th>
												<th style="width: 15%;">Category Name</th>
												<th style="width: 28%;">Description</th>
												<th style="width: 12%;">status</th>
												<th style="width: 5%;">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cate }" var="c">
												<tr>
													<td>${c.categoryId }</td>
													<td>${c.name }</td>
													<td><p class="mb-0">${c.description }</p></td>
													<td>${c.status == 1 ? "Display": "Hidden"}</td>
													<td>
														<div class="flex align-items-center list-user-action">
															<a class="bg-primary" data-toggle="tooltip"
																data-placement="top" title="" data-original-title="Edit"
																href="${pageContext.request.contextPath}/admin/edit/${c.categoryId }"><i
																class="ri-pencil-line"></i></a> 
																<a class="bg-primary"
																data-toggle="tooltip" data-placement="top" title=""
																onclick="confirmDeleteCate(${c.categoryId })"
																data-original-title="Delete" href="#"><i
																class="ri-delete-bin-line"></i></a>
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

	<jsp:include page="../linkjs.jsp"></jsp:include>
</body>
<script type="text/javascript">
    function confirmDeleteCate(cateId) {
        if (confirm("Are you sure you want to delete this category?")) {
            window.location.href = '${pageContext.request.contextPath}/admin/deleteCategory/' + cateId;
        }
    }
</script>
<!-- Mirrored from templates.iqonic.design/booksto/html/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Apr 2024 20:47:07 GMT -->
</html>
