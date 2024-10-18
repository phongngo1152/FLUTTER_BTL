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
                              <h4 class="card-title">Update Category</h4>
                           </div>
                        </div>
                        <div class="iq-card-body">
                           <form:form action="${pageContext.request.contextPath}/admin/updateCategory" modelAttribute="cate" method="post">
                           <form:input type="text" class="form-control" path="categoryId" hidden= "hidden"/>
                              <div class="form-group">
                                 <label>Category Name:</label>
                                 <form:input type="text" class="form-control" path="name" />
                              </div>
                              <div class="form-group">
                                 <label>Category Description:</label>
                                 <form:textarea class="form-control" rows="4" path="description"></form:textarea>
                              </div>
                              <div class="form-group">
										<label>Status:</label>
										<form:radiobutton path="status" value="1" checked="checked"/> Display 
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
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<jsp:include page="../linkjs.jsp"></jsp:include>
</body>

<!-- Mirrored from templates.iqonic.design/booksto/html/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Apr 2024 20:47:07 GMT -->
</html>
