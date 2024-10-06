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
		<jsp:include page="navuser.jsp"></jsp:include>
		<!-- Page Content  -->
		<div id="content-page" class="content-page">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<div class="iq-card">
							<div class="iq-card-header d-flex justify-content-between">
								<div class="iq-header-title">
									<h4 class="card-title">Add Story</h4>
								</div>
							</div>
							<div class="iq-card-body">
								<form:form action="saveStory" modelAttribute="s" method="post"
									enctype="multipart/form-data">
									<div class="form-group">
										<label>Story Name:</label>
										<form:input type="text" class="form-control" path="title"/>
									</div>
									<div class="form-group">
										<label>Category:</label>
										<form:select path="category.categoryId" class="form-control">
											<option selected="selected" value=''>--- Choose
												catrgory ---</option>
											<form:options items="${listcate }" itemLabel="name"
												itemValue="categoryId"></form:options>
										</form:select>
									</div>
									<div class="form-group">
										<label>Category:</label>
										<form:select path="author.authorId" class="form-control">
											<option selected="selected" value=''>--- Choose
												author ---</option>
											<form:options items="${listauthor }" itemLabel="name"
												itemValue="authorId"></form:options>
										</form:select>
									</div>
									<div class="form-group">
										<label>Image:</label>
										<div class="custom-file">
											<input type="file" name="coverImageFile" />
										</div>
									</div>
									<div class="form-group">
										<label>Description:</label>
										<form:textarea class="form-control" path="description"
											rows="4" />
									</div>
									<tr>
										<td>Status:</td>
										<td><form:checkbox path="status" /> Active</td>
									</tr>
									<button type="submit" class="btn btn-primary">Submit</button>
									<button type="reset" class="btn btn-danger">Reset</button>
								</form:form>
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
