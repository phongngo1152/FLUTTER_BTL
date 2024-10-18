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
                              <h4 class="card-title">Author List</h4>
                           </div>
                          <div class="iq-card-header-toolbar d-flex align-items-center">
									<a
										href="${pageContext.request.contextPath}/admin/authors-form"
										class="btn btn-primary">Add New Author</a>
								</div>
                        </div>
                        <div class="iq-card-body">
                           <div class="table-responsive">
                              <table class="data-tables table table-striped table-bordered" style="width:100%">
                                 <thead>
                                    <tr>
                                       <th style="width: 5%;">No</th>
                                       <th style="width: 20%;">Author Name</th>
                                       <th style="width: 20%;">email</th>
                                       <th style="width: 5%;">Status</th>
                                       <th style="width: 10%;">Action</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:forEach items="${list }" var="a">
                                    <tr>
                                       <td>${a.acId }</td>
                                       <td>${a.userName }</td>
                                       
                                       <td>${a.email }</td>
                                       <td>${a.status == 1? "Active" : "Off" }</td>
                                       <td>
                                          <div class="flex align-items-center list-user-action">
                                             <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" href="${pageContext.request.contextPath}/admin/editAuthorStatus/${a.acId }"><i class="ri-pencil-line"></i></a>
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
