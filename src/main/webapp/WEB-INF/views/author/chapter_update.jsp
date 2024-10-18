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
									<h4 class="card-title">Update Chapter</h4>
								</div>
							</div>
							<div class="iq-card-body">
								<form:form action="${pageContext.request.contextPath}/author/updateChapter" modelAttribute="chapter" method="post">
								<form:input type="text" class="form-control" path="story.storyId" hidden="hidden" value="${idurl }"/>
								<form:input type="text" class="form-control" path="chapterId"  hidden="hidden" value="${idChapter }"/>
									<div class="form-group">
										<label>Story Name:</label>
										<form:input type="text" class="form-control" path="chapterTitle" required="required"/>
									</div>
									<div class="form-group">
										<label>Chapter Number:</label>
										<form:input type="text" class="form-control" path="chapterNumber" required="required"/>
									</div>
									<div class="form-group">
										<label>Description:</label>
										<form:textarea class="form-control" path="content" required="required"
											rows="4" />
									</div>
									<div class="form-group">
										<label>Status:</label>
										<form:radiobutton path="status" value="1" /> Display 
										<form:radiobutton path="status" value="0" /> Hidden
									</div>
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
</body>
<jsp:include page="../linkjs.jsp"></jsp:include>
<!-- Mirrored from templates.iqonic.design/booksto/html/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Apr 2024 20:47:07 GMT -->
</html>
