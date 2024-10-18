<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
       <!-- Page Content  -->
         <div id="content-page" class="content-page">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="iq-card">
                        <div class="iq-card-header d-flex justify-content-between">
                           <div class="iq-header-title">
                              <h4 class="card-title">Update Author</h4>
                           </div>
                        </div>
                        <div class="iq-card-body">
                          <form:form action="${pageContext.request.contextPath}/admin/saveStatusAuthor" modelAttribute="acc"
									method="post">
									<form:input type="text" class="form-control" path="acId" value="${id }" hidden="hidden"/>
									<div class="form-group">
										<label>Author Name:</label>
										<form:input type="text" class="form-control" path="userName" disabled="true" />
									</div>
									<div class="form-group">
										<label>Email:</label>
										<form:input type="text" class="form-control" path="email" disabled="true"/>
									</div>
									<div class="form-group">
										<label>Password:</label>
										<form:input type="password" class="form-control" path="password" disabled="true"/>
									</div>
									<div class="form-group">
										<form:input type="text" class="form-control" path="role" value="1" hidden="hidden"  />
									</div>
									<div class="form-group">
										<label>Status:</label>
										<form:radiobutton path="status" value="1" checked="checked" />
										Display
										<form:radiobutton path="status" value="0" />
										Hidden
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
	
      <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<jsp:include page="../linkjs.jsp"></jsp:include>
	
</body>

<!-- Mirrored from templates.iqonic.design/booksto/html/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Apr 2024 20:47:07 GMT -->
</html>
