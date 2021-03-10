<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Udemy User Control</title>
    <link rel="icon" type="image/png" href="${link}/img/logo-coral.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${link}/css/bootstrap.css" rel="stylesheet">
    <link href="${link}/css/font-awesome.css" rel="stylesheet">
    <link href="${link}/css/admin.css" rel="stylesheet">
</head>

<body>

    <nav class="d-flex navbar border bg-white">
        <a class="logo col-1" href="home.htm">
            <img src="${link}/img/logo-coral.png" alt="Udemy" width="90px">
        </a>
        <div class="col-6 d-flex justify-content-end align-items-center">
            Welcome back, <span class="mx-2 text-info font-weight-bold">Dai</span>
        </div>
    </nav>
    <div class="d-flex container-fluid h-100">
        <aside class="col-3 p-0 h-100 bg-white">
            <ul>
                <li class="list-group">
                    <a href="#" class=" lg">User</a>
                </li>
                <li class="list-group">
                    <a href="course.htm" class=" lg">Product</a>
                </li>
                <li class="list-group">
                    <a href="" class="lg">Result</a>
                </li>
            </ul>
        </aside>
        <main class="col-8 ml-5 bg-white" id="table">

            <h2 class="p-2">Bảng: <span>User</span></h2>
            <h4 class="pl-2">Số lượng: <span>5</span></h4>
            <div class="database">
                <table class="table bg-light table-white table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Họ</th>
                            <th scope="col">Tên</th>
                            <th scope="col">Email</th>
                            <th scope="col">Ngày sinh</th>
                            <th scope="col">Phái</th>
                            <th scope="col">Loại</th>
                            <th scope="col">Cart</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${list_user == null}">
                    		Sorry User Table in your Database is empty
                    	</c:if>
                    	<c:if test="${list_user != null}">
                        <c:forEach items = "${ list_user}" var ="u">
                        <tr>
                            <th scope="row">${u.id }</th>
                            <td>${u.firstname}</td>
                            <td>${u.lastname }</td>
                            <td>${u.email }</td>
                            <td>${u.birthday }</td>
                            <td>
                            <c:choose>
                            	<c:when test="${u.gender}">Male</c:when>
                            	<c:when test="${!u.gender}">Female</c:when>
                            	<c:otherwise>Error</c:otherwise>
                            </c:choose>
                            </td>
                            <td><c:choose>
                            	<c:when test="${u.role == 4}">Student</c:when>
                            	<c:when test="${u.role == 3}">Instructor</c:when>
                            	<c:otherwise>Sercret</c:otherwise>
                            </c:choose></td>
                            <td>
                            <c:if test="${u.cart != null }">
                            <a class="btn bg-success p-1 font-weight-bold text-white" href="cart.htm?id=${u.id}">More</a>
                            </c:if>
                            <c:if test="${u.cart == null }"></c:if>
                            </td>
                        </tr>
                        </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </main>

    </div>
    <script src="${link}/js/bootstrap.js"></script>
    <script src="${link}/js/jquery.js"></script>

    <script>
        $('.cancel').on('click', function() {
            $(this).parent().parent().parent().children().get(0).addClass('d-none');
        })
        $('tr').on('click', function() {
            console.log("a");
        })
        
    </script>
</body>

</html>