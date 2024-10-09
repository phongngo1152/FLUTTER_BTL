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
									<h4 class="card-title">Update Comment</h4>
								</div>
							</div>
							<div class="iq-card-body">
								<form:form
									action="${pageContext.request.contextPath}/author/updateComment"
									modelAttribute="cmt" method="post">
									<form:input type="text" path="commentId" value="${id }" hidden="hidden" class="form-control" />
									<div class="form-group">
										<label for="title">Story Name:</label>
										<form:input type="text" path="title" class="form-control" />
									</div>
									<div class="form-group">
										<label for="description">Description:</label>
										<form:textarea path="description" class="form-control"
											rows="3" />
									</div>
									<div class="form-group">
										<label for="coverImage">Cover Image:</label> <input
											type="file" class="form-control" name="coverImageFile" />

										<!-- Hiển thị ảnh cũ nếu có -->
										<c:if test="${not empty story.coverImage}">
											<img class="mt-4"
												src="${pageContext.request.contextPath}/resources/image/${story.coverImage}"
												alt="Cover Image" width="100" />
										</c:if>
									</div>
									<!-- Các trường Category và Author -->
									<div class="form-group">
										<label for="category">Category:</label>
										<form:select path="category.categoryId" class="form-control">
											<option selected="selected" value=''>--- Choose
												catrgory ---</option>
											<form:options items="${listcate }" itemLabel="name"
												itemValue="categoryId"></form:options>
										</form:select>
									</div>
									<div class="form-group">
										<label for="author">Author:</label>
										<form:select path="author.authorId" class="form-control">
											<option selected="selected" value=''>--- Choose
												author ---</option>
											<form:options items="${listauthor }" itemLabel="name"
												itemValue="authorId"></form:options>
										</form:select>
									</div>
									<div class="form-group">
										<label>Status:</label>
										<form:checkbox path="status" />
										Display
									</div>
									<button type="submit" class="btn btn-primary">Update</button>
									<button type="reset" class="btn btn-danger">Reset</button>
									<a type="button" href="${pageContext.request.contextPath}/author/form-update-story/${idurl}/create-chapter" class="btn btn-warning text-white">Create
										chapter</a>
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
