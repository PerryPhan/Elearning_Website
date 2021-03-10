<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Udemy - UpdCourse</title>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="${link}/img/logo-coral.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${link}/css/bootstrap.css" rel="stylesheet">
    <link href="${link}/css/font-awesome.css" rel="stylesheet">
    <link href="${link}/css/forme.css" rel="stylesheet">
</head>

<body>
    <div class="position-absolute" style="left:50%;top:50%;transform: translate(-50%,-50%);box-shadow: 0px 0px 10px rgba(0,0,0,.2);">
        <form class="bg-white" style=" height:600px;width: 800px;">
        	<c:if test="${ sessionScope.user != null}">
        	<c:if test="${sessionScope.user.id != course.instruid.id}">
            	<a class="btn my-3" href="course.htm"><img src="${link}/img/Arrow 1.png" alt="back" width="30px"> Back  </a>
            </c:if>
            <c:if test="${sessionScope.user.id == course.instruid.id}">
            	<a class="btn my-3" href="coursepage.htm?id=${ course.id}"><img src="${link}/img/Arrow 1.png" alt="back" width="30px"> Back  </a>
            </c:if>
        	</c:if>
            <!-- <h2>Order by Date dec</h2> -->
            <h2 class="pl-3 text-center">
                Updating new Course
            </h2>
            <div class="container w-75">
                <div class="form-control d-flex">
                    <label class="w-25">Name</label>
                    <input type="text" name="name" class="w-75" id="${course.id}" value="${course.name}" required>
                </div>
                <div class="err"></div>
                <div class="form-control d-flex">
                    <label class="w-25">Price</label>
                    <input type="number" name="price" class="w-75" value="${course.price}" required>
                </div>
                <div class="err"></div>

                <div class="form-control d-flex">
                    <label class="w-25">Specialist:</label>
                   <select name="cars" class="w-75" id="cn" ma="${course.majorid.id }">
                  	<c:forEach items="${list_major}" var="m">
                  		<option value="${m.id}">${m.name}</option>
                  	</c:forEach> 
                  </select>
                </div>

                 <div class="form-control d-flex">
                    <label class="w-25">Instrutor:</label>
                    <c:if test="${course.instruid.id != sessionScope.user.id }">
                    <select class="w-75" id="instructor" ins="${course.instruid.id }">
                  <c:forEach items="${list_user}" var="m">
                  		<option value="${m.id}">${m.firstname} ${m.lastname}</option>
                  	</c:forEach>
                  	 </select>
                  	</c:if>
                  	 <c:if test="${course.instruid.id == sessionScope.user.id }">
                  	 	${course.instruid.firstname } ${course.instruid.lastname }
                  	 	<input id="instructor" type="number" value="${course.instruid.id}" ins="${course.instruid.id }" class="d-none" >
                  	 </c:if>
               
                </div>

                <div class="form-control d-flex">
                    <label class="w-25">Description:</label>
                    <textarea class="w-75" col="20" rows="5"> Welcome to my Course </textarea>
                </div>


                <button type="submit" class="btn bg-primary font-weight-bold text-white w-100">UPDATE</button>
            </div>
        </form>
    </div>

    <script src="${link}/js/bootstrap.js"></script>
    <script src="${link}/js/jquery.js"></script>
    <script src="${link}/js/sweetalert.min.js"></script>

    <script>
        $('.cancel').on('click', function() {
            $(this).parent().parent().parent().children().get(0).addClass('d-none');
        })

        function isEmpty(what) {
            if ($(what).val() == "") {
                $(what).parent().addClass('invaild')
                $(what).parent().next('.err').text($(what).prev().text() + ' is empty');
                return false;
            } else
                return true;
        }

        function isEmptyta(what) {
            if ($(what).text() == "") {
                $(what).parent().addClass('invaild')
                $(what).parent().next('.err').text($(what).prev().text() + ' is empty');
                return false;
            } else
                return true;
        }

        function regex(what, regex) {
            if ($(what).match(regex)) {
                $(what).parent().addClass('invaild')
                $(what).parent().next('.err').text(' Invaild ' + $(what).prev().text());
                return false;
            } else
                return true;

        }
        $('#instrutor').val($('#instrutor').attr('ins'));
         $('#cn').val($('#cn').attr('ma'));
        // init 
        var iname = $('form input[name="name"]').val();
        var iprice = $('form input[name="price"]').val();
        var iinstruct = $('#instructor').val();
        var icn = $('#cn').val();
        var idescription = $('form textarea').text();
        $('form').on('submit', function(e) {
            e.preventDefault();
            var name = $('form input[name="name"]');
            var price = $('form input[name="price"]');
            var description = $('form textarea');
            $('input').on('change', function() {
                $(this).parent().removeClass('invaild')
                $(this).parent().next('.err').text('');
            })
            $('textarea').on('change', function() {
                $(this).parent().removeClass('invaild')
                $(this).parent().next('.err').text('');
            })
            
            
            if (isEmpty(name))
                if (isEmpty(price))
                    if (isEmptyta(description))
                    //AJAX
                    // swal('All right', 'Create new Course successfully', 'success');
                        if (iname != name.val() ||
                            iprice != price.val() || idescription != description.text() ||
                            iinstruct != $('#instructor').val() || icn != $('#cn').val())
                        	
                            $.ajax({
                                type: "POST",
                                url: "courseUpdform.htm",
                                data: {
                                	id: name.attr('id'),
                                    name: name.val(),
                                    price: price.val(),
                                    instructor: $('#instructor').val(),
                                    cn: $('#cn').val(),
                                    des: description.text()
                                },
                                success: function(response) {
                                	if(response == 'true')
                                        swal('All right', 'Update existed Course successfully', 'success');
                                    	else if(response == 'false')
                                    	swal('Oops', 'This course is duplicate', 'warning');
                                },
                                error: function(e) {
                                    swal('Oops', "Something happen with updating exsited course", "error");
                                }
                            });
                        else {
                            swal('All right', 'We haven\'t changed anything ', 'success');
                        }
        })
    </script>


</body>

</html>