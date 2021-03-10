<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${link}/css/bootstrap.css">
    <link rel="stylesheet" href="${link}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${link}/css/admin.css">
    <link rel="icon" type="image/png" href="${link}/img/logo-coral.png">
    <title>Udemy Curriculum Control</title>
</head>

<body>
    <nav class="d-flex navbar border bg-white">
        <a class="logo col-1" href="home.htm">
            <img src="${link}/img/logo-coral.png" alt="Udemy" width="90px">
        </a>        <div class="col-6 d-flex justify-content-end align-items-center">
            Welcome back, <span class="mx-2 text-info font-weight-bold">${sessionScope.user.lastname}</span>
        </div>
    </nav>

    <main class="container mt-4 p-4 bg-white " id="table">
    	<c:if test="${ sessionScope.user != null}">
        	<c:if test="${sessionScope.user.id != course.instruid.id}">
            	<a class="btn my-3" href="course.htm"><img src="${link}/img/Arrow 1.png" alt="back" width="30px"> Back  </a>
            </c:if>
            <c:if test="${sessionScope.user.id == course.instruid.id}">
            	<a class="btn my-3" href="coursepage.htm?id=${ course.id}"><img src="${link}/img/Arrow 1.png" alt="back" width="30px"> Back  </a>
            </c:if>
        	</c:if>
        <!-- <h2>Order by Date dec</h2> -->
        <h2 class="p-2"><span class="font-weight-bold">Curriculums and Test</span> belong to <span class="text-info">${course.name } [ by ${course.instruid.firstname} ${course.instruid.lastname} ]</span></h2>


        <div class="database cart">
			<!-- ForEach Cart-->
            <div class="form-control-lg d-flex border ">
                <div class="col-9 font-weight-bold tog">
                    All Curriculums <span class="badge badge-pill badge-primary">${curriculums.size()!=0?curriculums.size():0}</span>
                </div>
                <div class="col-3 d-flex justify-content-end align-items-center">
                    <a href="curriculumAddform.htm?id=${courseid}" name="add" class="btn cur btn-success text-white mx-1 p-1">
                        <i class="fa fa-plus"></i>
                    </a>
                    <button name="edit" class="btn cur btn-primary text-white mx-1 p-1">
                        <i class="fa fa-cog"></i>
                    </button>
                    <button name="del" class="btn cur btn-danger text-white mx-1 p-1">
                        <i class="fa fa-minus"></i>
                    </button>
                </div>
            </div>
            <!-- ForEach Detail -->
            <div class="container detail">
            <c:if test="${curriculums.size() ==0}"> Sorry Curriculum Table is empty</c:if>
			<c:if test="${curriculums.size() !=0}">
                <table class="table bg-white table-info table-striped">
                	
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">PDF</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${curriculums}" var="c">
                        <tr class="position-relative">
                            <th scope="row">${c.id}</th>
                            <td>${c.name}</td>
                            <td>${c.pdf}</td>
                            <td name="func" class="curfunc d-flex justify-content-end align-items-center">
                                <a href="curriculumUpdform.htm?id=${courseid}&currid=${c.id}" class="d-none btn bg-primary edit font-weight-bold text-white p-1 mx-1" style="font-size: 15px;"> Edit</a>
                                <button class="d-none btn bg-danger del font-weight-bold text-white  p-1 mx-1" id="${c.id}">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>
            </c:if>
            </div>
            
            <!-- ForEach Cart-->
            
            <div class="form-control-lg d-flex border ">
                <div class="col-9 font-weight-bold tog">
                    All Tests <span class="badge badge-pill badge-danger">${test.size()!=0?test.size():0}</span>
                </div>
                <div class="col-3 d-flex justify-content-end align-items-center">
                    <a name="add" href="testAddform.htm?id=${courseid}" class="btn test btn-success text-white mx-1 p-1">
                        <i class="fa fa-plus"></i>
                    </a>
                    <button name="edit" class="btn test btn-primary text-white mx-1 p-1">
                        <i class="fa fa-cog"></i>
                    </button>
                    <button name="del" class="btn test btn-danger text-white mx-1 p-1">
                        <i class="fa fa-minus"></i>
                    </button>
                </div>
            </div>
            <!-- ForEach Detail -->
            <div class="container">
            <c:if test="${test.size() ==0}"> Sorry Test Table is empty</c:if>
			<c:if test="${test.size() !=0}">
            
                <table class="table bg-white table-info table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Time</th>
                            <th scope="col">PDF</th>
                            <th scope="col">Question</th>
                            <th scope="col">Answer</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${test}" var="t">
                        <tr>
                            <th scope="row">${t.id }</th>
                            <td>${t.name }</td>
                            <td>${t.time }m</td>
                            <td>${t.pdf }</td>
                            <td>${t.question }</td>
                            <td class="text-success">${t.answer }</td>
                            <td name="func" class="testfunc d-flex justify-content-end align-items-center">
                                <a href="testUpdform.htm?id=${courseid}&testid=${t.id}" class="btn d-none bg-primary edit font-weight-bold text-white p-1 mx-1" style="font-size: 15px;"> Edit</a>
                                <button class="btn d-none bg-danger tdel font-weight-bold text-white  p-1 mx-1" id="${t.id }">Delete</button>
                            </td>
                        </tr>
					</c:forEach>
                    </tbody>
                </table>
            </c:if>
            </div>
            
            <!-- ForEach Cart-->
        </div>

    </main>
    <script src="${link}/js/bootstrap.js"></script>
    <script src="${link}/js/jquery.js"></script>
    <script src="${link}/js/sweetalert.min.js"></script>
    <script>
        var open = true;
        $('.tog').on('click', function() {
            if (open) {
                $(this).parent().next('.container').addClass('d-none');
                open = !open;
            } else {
                $(this).parent().next('.container').removeClass('d-none');
                open = !open;
            }
        })
        var cedit = true;
        var cdel = true;
        $('.cur').on('click', function() {
            if ($(this).attr('name') == "add") {

            }
            if ($(this).attr('name') == "edit") {
                if (cedit) {
                    $('.cur').attr('disabled', 'disabled');
                    $(this).removeAttr('disabled')
                    $('.curfunc .edit').removeClass('d-none');
                    cedit = !cedit;
                } else {
                    $('.cur').removeAttr('disabled');
                    $('.curfunc .edit').addClass('d-none');
                    cedit = !cedit;
                }
            }
            if ($(this).attr('name') == "del") {
                if (cdel) {
                    $('.cur').attr('disabled', 'disabled');
                    $(this).removeAttr('disabled')
                    $('.curfunc .del').removeClass('d-none');
                    cdel = !cdel;
                } else {
                    $('.cur').removeAttr('disabled');
                    $('.curfunc .del').addClass('d-none');
                    cdel = !cdel;
                }
            }
        })
        var tedit = true;
        var tdel = true;
        $('.test').on('click', function() {
            if ($(this).attr('name') == "add") {

            }
            if ($(this).attr('name') == "edit") {
                if (tedit) {
                    $('.test').attr('disabled', 'disabled');
                    $(this).removeAttr('disabled')
                    $('.testfunc .edit').removeClass('d-none');
                    tedit = !tedit;
                } else {
                    $('.test').removeAttr('disabled');
                    $('.testfunc .edit').addClass('d-none');
                    tedit = !tedit;
                }
            }
            if ($(this).attr('name') == "del") {
                if (tdel) {
                    $('.test').attr('disabled', 'disabled');
                    $(this).removeAttr('disabled')
                    $('.testfunc .tdel').removeClass('d-none');
                    tdel = !tdel;
                } else {
                    $('.test').removeAttr('disabled');
                    $('.testfunc .tdel').addClass('d-none');
                    tdel = !tdel;
                }
            }
        })
        $('.del').on('click',function(){
        	   swal({
                   title: "Are you sure?",
                   text: "Once deleted, you will not be able to recover this data ?",
                   icon: "warning",
                   buttons: true,
                   dangerMode: true,
               })
               .then((willDelete) => {
                   if (willDelete) {
						
                       var id = $(this).attr('id')
                           // AJAX DEL Curriculum 
                   		  $.ajax({
                            type: 'POST',
                            url: 'curriculumDel.htm',
                            data: {
                                id: id
                            },
                            success: function(d) {         
                                async function sequence(){
                                	await swal("Poof! Your data has been deleted!", {icon: "success",});
                                	await location.reload(true);
                                	}
                                sequence();
                            },
                            error: function(e) {
                                swal('Oops', "Some error happening when deleting", "error");
                            }
                        })
                   
                   } else {
                       swal("Your data is safe!");
                   }
               });
       })
       $('.tdel').on('click',function(){
        	   swal({
                   title: "Are you sure?",
                   text: "Once deleted, you will not be able to recover this data ?",
                   icon: "warning",
                   buttons: true,
                   dangerMode: true,
               })
               .then((willDelete) => {
                   if (willDelete) {
						
                       var id = $(this).attr('id')
                           // AJAX DEL Curriculum 
                   		$.ajax({
                            type: 'POST',
                            url: 'testDel.htm',
                            data: {
                                id: id
                            },
                            success: function(d) {         
                                async function sequence(){
                                	await swal("Poof! Your data has been deleted!", {icon: "success",});
                                	await location.reload(true);
                                	}
                                sequence();
                            },
                            error: function(e) {
                                swal('Oops', "Some error happening when deleting", "error");
                            }
                        })
                   
                   } else {
                       swal("Your data is safe!");
                   }
               });
       })
    </script>
</body>

</html>