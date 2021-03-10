<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Udemy - test</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="${link}/img/logo-coral.png">
    <link rel="stylesheet" href="${link}/css/bootstrap.css">
    <link href="${link}/css/udemytest.css" rel="stylesheet">
 

</head>

<body>
    <!-- Bắt đầu nav -->
    <!-- <div class="container-fluid" style="background-color: rgb(26, 26, 26);height: 10px;"></div> -->
    <nav class=" container-fluid">
        <div class="row navbar-expand-lg ">
            <div class="col-md-6 col-6 ml-4 ml-lg-5 mt-lg-2 ">
                <div class="row justify-content-lg-start justify-content-end ">
                    <a href="# " class="ml-lg-5 mt-lg-2 ">
                        <img src="${link}/img/logo-coral.png" alt="logo " width="200px ">
                    </a>
                </div>
            </div>
            <div class="row flex-end justify-content-end align-items-center col-6 d-lg-none ">
                <div class="justify-content-center ">
                    <button class="navbar-toggler " data-toggle="collapse " data-target="#nav " id="collapse">
            <span class="navbar-toggler-icon "><img src="${link}/img/list.png " alt=""></span>
        </button>
                </div>
            </div>
        </div>
    </nav>

    <!-- Bài thi  -->
    <div class="text-center mt-3">
        <h1>Test #<span class="testid">1</span> : <span class="testname">resadasd</span></h1>
        <h3>Time (minutes): <span class="testtime">3</span>m</h3>
        <h4>Number of question:<span id="socau">3</span></h4>
        <h2 id="timer"></h2>
        <button class="btn bg-primary text-white" id="start">Start your test</button>
    </div>

    <div class=" container">
        <div class="d-none flex flex-column justify-content-center align-items-center" id="baithi">
            <form class="d-flex flex-column align-items-center">

                <embed src="${link }/pdf_for_curr/javachap1.pdf" type="application/pdf" width="1150px" height="500px">
                <div id="answer" class="row justify-content-center">
                    <div class="col">
                        <br>
                        A B C D
                    </div>
                    <!-- Add here -->
                </div>
                <button class="btn bg-primary text-white" id="end">Hand in</button>
        	</form>
        </div>
			
        <div class="d-none ketqua">
            <div class="ketquaheader ">
                <h1>Phan Đại </h1>
                <h4>Day: 20/1/2020</h4>

            </div>
            <div class="ketquacontent ">
                <h4>Right answer: 1/3</h4>
                <h3> F </h3>
            </div>
            <a class="btn bg-danger text-white text-uppercase font-weight-bold" href="">Back</a>
        </div>
    </div>

    <script src="${link}/js/bootstrap.js "></script>
   
    <script src="${link}/js/jquery.js "></script>
    <!-- <script src="${link}/js/jqthi.js "></script> -->
    <script>
        // Time go here
        var c = 3 * 60;
        var t;
        function replaceAt(s, n, t) {
            return s.substring(0, n) + t + s.substring(n + 1);
        }
        var socau = parseInt($('#socau').text());
        var traloi = "";
        let i;
        for (i = 0; i < socau; i++)
            traloi += "0";

        console.log("Bài thi có tất cả " + socau + " câu");
        console.log("Mặc định câu trả lời trước khi làm bài là " + traloi);
        
        $('#start').on('click', function() {
            timedCount()
            $('#baithi').removeClass('d-none');
            $(this).addClass('d-none');
            if(socau <=40)
            $('#answer').append(genAnswer(socau));
            $('input.choose').on('click', function() {
                var cauthu = $(this).prop('id').match('\\d')[0];
                var chon = $(this).prop('id').match('\\w')[0];
                traloi = replaceAt(traloi, cauthu-1, chon);
        })
        })
        $('.col').on('submit',function(e){ e.preventDefault() })
        
        
        function genAnswer(n) {
            var html = "";
            let i = 0;
            for (i=0; i < n; i++) {
            	 html += '<form class="col"  id="'+i+'" action="abc" method="POST">'+parseInt(i+1)+
                 '<input type="radio" name="chooseone" class="choose" id="A'+i+'"/>'+
                 '<input type="radio" name="chooseone" class="choose" id="B'+i+'"/>'+
                 '<input type="radio" name="chooseone" class="choose" id="C'+i+'"/>'+
                 '<input type="radio" name="chooseone" class="choose" id="D'+i+'"/>'+
                 '</form>';
            }
            return html;
        };
        
        $('#end').on('click', function(e) {
            e.preventDefault();
            var correct = 0;
            var cacdapan ="AAA";
            console.log(traloi, cacdapan)
            var i
            for ( i= 0; i < socau; i++)
                if (traloi[i] === cacdapan[i])
                    correct += 1;
            $('#baithi').addClass('d-none');
            $('.ketqua').removeClass('d-none');
            console.log(traloi);
            // AJAX
        })
        
        function timedCount() {
        var hours = parseInt(c / 3600) % 24;
        var minutes = parseInt(c / 60) % 60;
        var seconds = c % 60;

        var result = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds < 10 ? "0" + seconds : seconds);
        $('#timer').html(result);
        $('#end').on('click', function() {
            clearTimeout(t);
            //AJAX
        })
        if (c == 0) {
            //setConfirmUnload(false);
            //$("#quiz_form").submit();
            $('#end').click();
            alert("Hết giờ làm bài");
            return;
        }
        c = c - 1;
        t = setTimeout(function() {
            timedCount()
        }, 1000);
        }
    </script>
    <!-- Bài thi  -->
    <!-- <script src="${link}/js/validate.js "></script> -->

</body>

</html>