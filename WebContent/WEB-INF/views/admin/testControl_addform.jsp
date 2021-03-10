<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Udemy - AddTest</title>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="${link}/img/logo-coral.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${link}/css/bootstrap.css" rel="stylesheet">
    <link href="${link}/css/font-awesome.css" rel="stylesheet">
    <link href="${link}/css/forme.css" rel="stylesheet">
</head>

<body>
    <div class="position-absolute d-flex" style="left:50%;top:50%;transform: translate(-50%,-50%);box-shadow: 0px 0px 10px rgba(0,0,0,.2);">
        <iframe src="${link}/img/pexels-photo.jpg" width="100%" height="600px" class="border output">
      </iframe>
        <form:form class="bg-white" action="testAddform.htm?id=${courseid}" method="POST" enctype="multipart/form-data" style=" height:600px;width: 1200px;">
            <a class="btn my-3" href="curriculum.htm?id=${courseid}"><img src="${link}/img/Arrow 1.png" alt="back" width="30px"> Back </a>
            <!-- <h2>Order by Date dec</h2> -->
            <h2 class="pl-3 text-center">
                Adding new Test
            </h2>
            <h3 class="text-center text-primary">${success }</h3>
            <div class="container w-75">
                <div class="form-control d-flex">
                    <label class="w-25">Name</label>
                    <input type="text" name="name" class="w-75" >
                </div>

                <div class="err">${name_err }</div>
                <div class="form-control d-flex">
                    <label class="w-25">Time</label>
                    <input type="number" name="time" class="w-75" required>
                </div>
                <div class="err">${time_err }</div>
                <div class="form-control d-flex">
                    <label class="w-25">Question</label>
                    <input type="number" name="ques" class="w-75" required>
                </div>
                <div class="err">${question_err }</div>
                <div class="form-control d-flex">
                    <label class="w-25">Answer</label>
                    <input type="text" name="answer" class="w-75" required>
                </div>
                <div class="err">${answer_err }</div>

                <div class="form-control d-flex">
                    <label class="w-25">Course</label>
                   <span> ${course.name} [by ${course.instruid.firstname } ${course.instruid.lastname }] </span>
                </div>

                <div class="form-control d-flex">
                    <label class="w-25">PDF</label>
                    <input type="file" name="pdf" id="" accept="application/pdf"/>
                </div>
                
                <div class="err">${file_err }</div>
                
                <button type="submit" class="btn bg-success font-weight-bold text-white w-100">ADD</button>
                
            </div>
        </form:form>

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

        function regex(what, regex) {
            if ($(what).match(regex)) {
                $(what).parent().addClass('invaild')
                $(what).parent().next('.err').text(' Invaild ' + $(what).prev().text());
                return false;
            } else
                return true;

        }
        var file_name = "";
        $('input').on('change', function() {
            $(this).parent().removeClass('invaild')
            $(this).parent().next('.err').text('');
        })
        $('input[type="file"]').on('change', function(e) {

            var extension = e.target.files[0].name.split('.');
            if (extension[extension.length - 1] == "pdf") {
                $('.output').attr('src', URL.createObjectURL(event.target.files[0]));
                file_name = e.target.files[0].name;
            } else {
                swal('Oops', "We just accept PDF file", "error");
            }
        })
      
    </script>

</body>

</html>