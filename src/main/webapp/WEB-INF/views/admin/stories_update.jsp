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
									<h4 class="card-title">Update Story</h4>
								</div>
							</div>
							<div class="iq-card-body">
							
								<form:form
									action="${pageContext.request.contextPath}/admin/updateStory"
									modelAttribute="s" method="post">
									<form:input type="text" path="storyId" hidden="hidden" class="form-control" />
									
									<div class="form-group">
										<label for="title">Story Title:</label>
										<form:input type="text" path="title" class="form-control" disabled="disabled" />
									</div>
									<div class="form-group">
										<label for="description">Description:</label>
										<form:textarea path="description" class="form-control" disabled="disabled"
											rows="3" />
									</div>
									<div class="form-group">
										<label for="coverImage">Cover Image:</label> 
										<form:input
											 class="form-control" path="coverImage" hidden="hidden"/>
											<img class="m-4"
												src="${pageContext.request.contextPath}/resources/image/${img}"
												alt="Cover Image" width="100" />
									</div>
									<!-- Các trường Category và Author -->
									<div class="form-group">
										<label for="category">Category: ${categoryName}</label>
									</div>
									<div class="form-group">
										<label for="author">Author: ${authorName}</label>
									</div>
									<div class="form-group">
										<label>Status:</label>
										<form:checkbox path="status" />
										Display
									</div>
									<button type="submit" class="btn btn-primary">Update</button>
									<button type="reset" class="btn btn-danger">Reset</button>
									
								</form:form>

								<c:if test="${count_chapter > 0}">
									<div class="table-responsive">
								<div class="iq-header-title">
									<h4 class="card-title mt-4">Chapter List</h4>
								</div>
									<table class="data-tables table table-striped table-bordered"
										style="width: 100%">
										<thead>
											<tr>
												<th style="width: 3%;">No</th>
												<th style="width: 12%;">Title</th>
												<th style="width: 15%;">Chapter number</th>
												<th style="width: 18%;">Content</th>
												<th style="width: 12%;">Status</th>
												<th style="width: 15%;">Action</th>
											</tr>
										</thead>
										<tbody>
										
										<c:forEach items="${listchapter }" var="c">
												<tr>
													<td>${c.chapterId }</td>
													<td>
														<p class="mb-0">${c.chapterTitle }</p>
													</td>
													<td>${c.chapterNumber }</td>
													<td>
														<p class="mb-0">${c.content }</p>
													</td>
													<td>${c.status == 1 ? "Display": "Hidden"}</td>
													<td>
														<div class="flex align-items-center list-user-action">
															<a class="bg-primary" data-toggle="tooltip"
																data-placement="top" title="" data-original-title="Edit"
																href="${pageContext.request.contextPath}/admin/comments/${c.story.storyId}/detail-${c.chapterId }"><i class="ri-eye-line"></i></a>
															
														</div>
													</td>
												</tr>
												</c:forEach>
										</tbody>
									</table>
								</div>
								</c:if>
								<c:if test="${count_chapter  == 0}">
									<p>No List Chapter</p>
								</c:if>

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
<script type="text/javascript">
    function confirmDeleteChapter(storyId, chapterId) {
        if (confirm("Are you sure you want to delete this chapter?")) {
            window.location.href = '${pageContext.request.contextPath}/author/form-update-story/'+storyId+'/deleteStory/'+chapterId;
        }
    }
</script>
<!-- Mirrored from templates.iqonic.design/booksto/html/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Apr 2024 20:47:07 GMT -->
</html>
