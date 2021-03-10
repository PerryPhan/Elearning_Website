<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${link}/css/bootstrap.css">
    <link rel="stylesheet" href="${link}/css/admin.css">
    <title>Udemy Cart Control</title>
    <link rel="icon" type="image/png" href="${link}/img/logo-coral.png">
    <style>
        .border-2 {
            border: 1px solid black !important;
        }
    </style>
</head>

<body>
    <nav class="d-flex navbar border bg-white">
      <a class="logo col-1" href="home.htm">
            <img src="${link}/img/logo-coral.png" alt="Udemy" width="90px">
        </a>        <div class="col-6 d-flex justify-content-end align-items-center">
            Welcome back, <span class="mx-2 text-info font-weight-bold">Dai</span>
        </div>
    </nav>

    <main class="container mt-4 p-4 bg-white " id="table">
        <a class="btn my-3" href="user.htm"><img src="${link}/img/Arrow 1.png" alt="back" width="30px"> Back to Admin page </a>
        <!-- <h2>Order by Date dec</h2> -->
		<c:if test="${user == null}"></c:if>
		<c:if test="${user != null}"> 
        <h2 class="p-2"><span class="font-weight-bold">Carts</span> belong to <span class="text-info">${user.firstname} ${user.lastname} [ ${user.email} ]</span></h2>
		</c:if>
        <h4 class="pl-2">Count: <span class="badge badge-pill badge-primary">
        	 <c:if test="${list_cart == null }">0</c:if>
           	<c:if test="${list_cart !=null}">${list_cart.size()}</c:if>
        </span></h4>
        <div class="database cart">
            <c:if test="${list_cart == null }">Sorry Cart Table is empty</c:if>
           	<c:if test="${list_cart !=null}">    
            <!-- ForEach Cart-->
            <c:forEach items = "${list_cart}" var ="c">
            <div class="form-control-lg d-flex border-2">
                <div class="col-9 tog">
                    Cart number <span class="text-warning">#</span><span class="text-warning">${c.id}</span>
                </div>
                <div class="col-3 d-flex align-items-center justify-content-end">

                    <div class="mx-3 text-success font-weight-bold total">$ 1200</div>
					<c:if test="${c.paid}">
                    <div class="badge badge-pill badge-success">Paid <span class="d-block sm p-1"> ${c.day} </span>
                    </c:if>
                    <c:if test="${!c.paid}">
	                    <div class="col-2 d-flex align-items-center justify-content-end">
	                    <div class="mx-3 text-danger font-weight-bold">$0</div>
	                    <div class="badge badge-pill badge-danger">Haven't Paid</div>
                	</div>
                    </c:if>
                    </div>

                </div>
            </div>
            <!-- ForEach Detail -->
            <div class="d-none container detail">
                <c:if test="${c.detail.size() == 0}">
	                    <div class="h5"> Sorry Detail table is empty</tr>
                </c:if>
                <c:if test="${c.detail.size() != 0}">	
                <table class="table bg-white table-info table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Courseid</th>
                            <th scope="col">Coursename</th>
                            <th scope="col">Courseby</th>
                            <th scope="col">Cash</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${c.detail}" var="d" >
                        <tr>
                            <th scope="row">${d.id}</th>
                            <td>${d.courseidd.id}</td>
                            <td>${d.courseidd.name}</td>
                            <td>${d.courseidd.instruid.firstname} ${d.courseidd.instruid.lastname}</td>
                            <td class="text-success cash">${d.cash}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                </c:if>
            </div>
			
        </div>
        </c:forEach>
		</c:if>
            <!-- ForEach Cart-->
    </main>
    <script src="${link}/js/bootstrap.js"></script>
    <script src="${link}/js/jquery.js"></script>
    <script src="${link}/js/sweetalert.min.js"></script>
	<script>
        $('.tog').on('click', function() {
            $(this).parent().next('.detail').toggleClass('d-none');
        })
        var cash = [...$('.cash')];
        console.log(cash);
        var totals = 0;
        cash.map(each => {
        	totals += parseFloat($(each).text());
        })
       	$('.total').text("$"+totals);
    </script>
</body>

</html>