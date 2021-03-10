<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Udemy - Home</title>
    <link rel="icon" type="image/png" href="${link}/img/logo-coral.png">
    <link rel="stylesheet" href="${link}/css/bootstrap.css">
    <link rel="stylesheet" href="${link}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${link}/css/udemy.css">
    <script src="${link}/js/bootstrap.js">
    </script>
    <script src="${link}/js/jquery.js"></script>
    <script src="${link}/js/sweetalert.min.js"></script>

</head>

<body>
    <!-- Navbar_start - Common theme at main.jsp -->
    <nav class="d-none container-fluid fixed-top bg-white d-flex align-items-center">
        <div class="logo col-1">
            <img src="${link}/img/logo-coral.png" alt="Udemy" width="90px">
        </div>
        <div class="catergory col-1"></div>
        <div class="search col-5">
            <label><img src="${link}/img/SearchIcon_in.png" alt="glasses"></label>
            <input type="text" class="searchcoursename-toggle" placeholder="Search for course name " required>
        	<div class="position-absolute d-none searchcoursename bg-white p-2" style="width:90%;left:30px;bottom: -200px;height: 200px;box-shadow: 0 0 5px rgba(0,0,0,.5);overflow-x: hidden;overflow: scroll;">
                <ul class="m-0 p-2 px-3">
                    <li class="mb-2 whitesmoke px-1 py-2" style="letter-spacing: 0.5px;">
                        <span style="color:rgba(0, 0, 0, 0.829)"><i class="fa fa-search"></i></span> Beginner Java
                    </li>
                    <li class="mb-2 whitesmoke px-1 py-2" style="letter-spacing: 0.5px;">
                        <span style="color:rgba(0, 0, 0, 0.829)"><i class="fa fa-search"></i></span> Learn Programming
                    </li>
                    <li class="mb-2 whitesmoke px-1 py-2" style="letter-spacing: 0.5px;">
                        <span style="color:rgba(0, 0, 0, 0.829)"><i class="fa fa-search"></i></span> Make cake
                    </li>
                </ul>
                <div class="font-sm text-center">Press enter to search </div>
            </div>
        </div>
        <div class="col-3 d-flex">
         <c:if test="${ sessionScope.user != null}">
            <span class="col-6 text-info position-relative popup cart-toggle">Cart for Learners
                <i class="fa fa-shopping-cart" style="font-size: 20px;"></i>
                <div class="position-absolute notification" >${sessionScope.cart.size() != 0 ?sessionScope.cart.size() :0  }</div>
            </span>
             <c:if test="${sessionScope.user.role < 4}">
            <div class="col-6 text-info position-relative popup income-toggle">Teachers income
                <i class="fa fa-credit-card" style="font-size: 20px;"></i>
                <div class="position-absolute notification">${createdcourse.size()!= 0 ?createdcourse.size(): 0}</div>
            </div>
            </c:if>
            <c:if test="${sessionScope.user.role == 4}">
            <div class="col-6 text-info ">
				<a href="courseAddform.htm" class=" popup  text-info font-weight-bold">Become instrutor</a>
            </div>
            </c:if>
            </c:if>
            <!-- INCOME -->
            <div class="position-absolute bg-white text-dark d-none income m-0">
                <h2 class="bg-info text-white p-2">Income</h2>
                <div class="p-2 font-weight-bold ">
                    <label>Instructor :</label> <span>${sessionScope.user.firstname} ${sessionScope.user.lastname }</span> <span class="text-success pl-2">now earning <div class="badge badge-pill badge-success money">$ ${sessionScope.user.income != 0 ? sessionScope.user.income:0 }</div></span>
                    <hr class="m-0">
                    <div class="p-1" style="font-size: 14px;">
                        <label>Course</label>
                        <ul class="p-0 text-info " style="height: 80px;overflow: scroll;overflow-x: hidden;">
                            <c:if test="${createdcourse != null }">
                            <c:forEach items="${createdcourse}" var="c">
                            <li>- ${ c.name } [ ${c.instruid.lastname } ]  | $ ${c.price} </li>
                            </c:forEach> </c:if>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- CART -->
            <div class="d-none position-absolute bg-white text-dark cart m-0 p-0">
                <h2 class="bg-info text-white p-2">Cart</h2>
                <div class="p-2 font-weight-bold ">
                    <div class="p-1" style="font-size: 14px;">
                        <label class="d-flex text-info"><div class="w-50">Course </div><div class="w-25 pl-3"> By </div> <div class="w-10"> Prices</div></label>
                        <ul class="p-0 text-info " style="height: 80px;overflow: scroll;overflow-x: hidden;">
                        <c:forEach items="${sessionScope.cart }" var="c">
                             <li class="d-flex" style="color: rgba(0,0,0,.6);font-weight: 500">
                                <div class="w-50" style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis">${c.courseidd.name } </div>
                                <div class="w-25 pl-3"> ${c.courseidd.instruid.lastname } </div>
                                <div class="w-10 price">$ ${c.courseidd.price}</div>
                            </li>
                        </c:forEach>
                        </ul>
                        <hr>
                        <div class="d-flex align-items-center">
                            <h5>Total : <span class="text-success">$ 1221</span></h5>
                            <a href="cartpage.htm" class="btn w-50 text-white m-2 ml-5 font-weight-bold bg-info">See more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="login col-2 d-flex align-items-center justify-content-center ">
            <!- Open Login PORT ->
            <!-- Session User here -->
            <c:if test="${ sessionScope.user != null}">
            <div> Hi ,<span class="text-info mx-2 font-weight-bold">${sessionScope.user.lastname }</span><span class="text-info popup more-toggle">
                <i class="fa fa-chevron-circle-down m-0"></i></span>
            </div>
            </c:if>
            <c:if test="${ sessionScope.user == null}" >
            <a href="login.htm" class="btn px-3 text-white bg-info border font-weight-bold mx-1">Login / Signup </button> 
            </c:if>
            <div class="d-none position-absolute bg-white more" id="user" style="bottom: -520px;right:0;height: 490px;width: 300px;box-shadow: 0 0 5px rgba(0,0,0,.5);">

                <div class="bg-info text-white text-center py-3 popup information-toggle">
                    <h5>Information<i class="mx-2 fa fa-info-circle"></i></h5>

                </div>

                <div class="row w-100 m-0 border my-3 py-2 information d-none">

                    <div class="col-2" style="line-height: 30px;">
                        Name
                        <br> Email
                        <br> Birthday
                        <br> Gender
                        <br>
                    </div>
                    <div class="col-10 text-right noedit">
                        <div class="infor-items">${sessionScope.user.firstname} ${sessionScope.user.lastname }</div>
                        <div class="infor-items">${sessionScope.user.email }</div>
                        <div class="infor-items">${sessionScope.user.birthday }</div>
                        <div class="infor-items">
                       <c:choose>
                            	<c:when test="${sessionScope.user.gender}">Male</c:when>
                            	<c:when test="${!sessionScope.user.gender}">Female</c:when>
                            	<c:otherwise>Error</c:otherwise>
                            </c:choose>
                        </div>
                        <button class="btn m-0 badge badge-pill badge-warning popup edit-toggle text-dark">Change your information<i class="fa fa-pencil"></i></button>
                    </div>

                    <div class="col-10 text-right d-none edit">
                        <form>
                            <div class="infor-items"><input type="text" value="${sessionScope.user.firstname} ${sessionScope.user.lastname }" pattern="[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểếiếnỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]+" required></div>
                            <div class="infor-items"> <input type="email" name="" id="" value="${sessionScope.user.email }" required> </div>
                            <div class="infor-items"><input type="date" value="${ sessionScope.user.birthday.trim()}"></div>
                            <div class="infor-items">
                                <input type="radio" name="gender" class="m-0 p-0 w-sm" value="true" checked>Male
                                <input type="radio" name="gender" class="m-0 p-0 w-sm" value="false">Female
                            </div>
                            <div class="py-2">
                                <button class="btn btn-success mx-2" id="ok" userid="${sessionScope.user.id}">
                            <i class="fa fa-check-circle"></i>
                            </button>
                                <div class="btn btn-danger">
                                    <i class="fa fa-times-circle" id="cancel"></i>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
                <div class="bg-info text-white text-center py-3 mt-1 popup course-toggle">
                    <h5>Follow Course <i class="fa fa-bookmark"></i></h5>
                </div>

                <div class="p-2 courset show ">
                    <!-- foreach here -->
                    <ul>
                        <!-- foreach here -->
                        <li class="title">
                            <a class="name"> Course name </a>
                            <div class="ins"> By</div>
                            <div class="price"> Progress</div>
                        </li>
                        
                        <hr>
                        <c:if test="${followcourse != null}">
                        <c:forEach items="${followcourse}" var="c">
                        <c:forEach items="${c.detail}" var="d">
                        <li>
                            <a class="name" href="#">${d.courseidd.name}</a>
                            <div class="ins"> ${d.courseidd.instruid.lastname} </div>
                            <div class="price"> ${d.process } </div>

                        </li>
                        <hr>
                        </c:forEach>
                        </c:forEach>
                        </c:if>
                        <c:if test="${followcourse == null}">
                        	You don't follow any course
                        </c:if>
                       
                       
                        <!-- foreach here -->
                    </ul>
                    <!-- foreach here -->
                </div>
                <div class="bg-info text-white text-center py-3 mt-1 popup history-toggle">
                    <h5>History <i class="fa fa-history"></i></h5>
                </div>

                <div class="p-2 history show d-none">
                 <c:if test="${followcourse == null}">
                        	You haven't bought any courses
                </c:if>
                <c:if test="${followcourse != null}">
                  <c:forEach items="${followcourse}" var="c">
                    <!-- foreach here -->
                    <div class="text-center font-italic">#${c.id } : You paid <span class="badge badge-pill badge-success text-white total" id=${c.id}>$1000</span> on
                        <span class="pl- 0 badge badge-pill text-dark"> ${c.day } </span>
                    </div>
 						
                      
                        
                    <ul>

                        <!-- foreach here -->
                        <li class="title">
                            <div class="name"> Course name </div>
                            <div class="ins"> By</div>
                            <div class="price "> Price </div>
                        </li>
                        <c:forEach items="${c.detail}" var="d">
                        <li>
                            <div class="name"> ${d.courseidd.name} </div>
                            <div class="ins"> ${d.courseidd.instruid.lastname} </div>
                            <div class="price price${c.id}"> $ ${d.courseidd.price} </div>
                        </li>
                        </c:forEach>
                       
                        <!-- foreach here -->
                        
                    </ul>
                    <hr>
                    <!-- foreach here -->
					</c:forEach>
					</c:if>
					
                </div>
                <c:if test="${sessionScope.user.role == 1}">
                     <a class="btn btn-primary my-2 p-3 w-100 text-white font-weight-bold popup" href="./user.htm">Adminpanel
                    <i class="fa fa-sign-out"></i></a></c:if>
                <a class="btn btn-danger my-2 p-3 w-100 text-white font-weight-bold popup" href="./logout.htm">Logout
                    <i class="fa fa-sign-out"></i></a>
                    
            </div>
        </div>
    </nav>

    <!-- Navbar_end -->

    <!-- ((Main_start: Here come the changing  -->
    <main class="pt-1 px-5 ">

        <!-- ((Jumbotron with fixed height = 350px -->
        <div class="jumbotron bg-white ">

            <!--( _ Banner  -->
            <div class="container-fuild py-3 px-5 " style="background-image: url( '${link}/img/jumbotron.jpg');height: 350px; ">
                <div class="d-block bg-white my-4 p-3 " style="width: 35%;height: 80%; ">
                    <h1 class="font-weight-bold ">Learn on your schedule</h1>
                    <p style="font-size: 18px; ">Anywhere, anytime. Start learning today!</p>
                    <div class="position-relative ">
                        <input type=" " name=" " value=" " class="form-control px-3 py-4 " placeholder="What do you want to learn? ">
                        <button class="btn position-absolute " style="right:0;top:10%; ">
                        <img src="${link}/img/SearchIcon_in.png " alt="glasses ">
                    </button>
                    </div>
                </div>
            </div>
            <!-- Banner _ ) -->

            <!-- ( _ Intro bellow banner -->
            <div class="container-fuild py-3 d-flex justify-content-center align-content-center ">
                <div class="col-4 d-flex justify-content-center ">
                    <div class="col-2 ">
                        <img src="${link}/img/monitor.png " width="100% " alt="tivi ">
                    </div>
                    <div class="col-9 ">
                        <div class="font-weight-bold "> 100,000 online courses</div>
                        <div class="text-dark "> Enjoy a variety of fresh topics </div>
                    </div>
                </div>
                <div class="col-4 d-flex justify-content-center align-content-center ">
                    <div class="col-2 ">
                        <img src="${link}/img/award.png " width="100% " alt="achieve ">
                    </div>
                    <div class="col-9 ">
                        <div class="font-weight-bold "> Expert instruction</div>
                        <div class="text-dark "> Find the right instructor for you </div>
                    </div>
                </div>
                <div class="col-4 d-flex justify-content-center align-content-center ">
                    <div class="col-2 ">
                        <img src="${link}/img/infinity.png " width="100% " alt="tivi ">
                    </div>
                    <div class="col-9 ">
                        <div class="font-weight-bold "> Expert instruction</div>
                        <div class="text-dark "> Find the right instructor for you </div>
                    </div>
                </div>
            </div>
            <!-- Intro bellow banner _ ) -->
        </div>

        <!-- Jumbotron with fixed height = 350px )) -->
        <div class="container-fluid pt-5 px-5 pb-3 ">
            <h3>The world's largest selection of courses</h3>
            <p class="text-dark ">Choose from 100,000 online video courses with new additions published every month</p>
        </div>

        <!-- Type here -->
        <div class="container-fluid ">
            <ul class="d-flex font-weight-bold ">
            	<li class="d-none thisactive">${active == null? 0: active}</li>
   				<li class="mx-3 popup major active" id="0">All</li>
   				<c:if test="${allmajor != null }">
   				<c:forEach items="${allmajor}" var="a">
                <!-- For Each Types here -->
                <li class="mx-3 popup major" id="${a.id}">${a.name }</li>
                <!-- For Each Types here -->
                </c:forEach>
            	</c:if>
            </ul>

            <!-- Courses here -->
            <div class="row p-2 px-5 pos-relative allcourse">
                <!--(( ForEach right here -->
				<c:if test="${allcourse != null }">
       			<c:forEach items="${allcourse }" var="a">
                <div class="col-2 border course m-3 p-2 " >
                	<div class="gotocoursepage mb-3" id="${a.id }" style="cursor:pointer" >
                    <img src="${link}/img/bg.jpg " alt=" " width="100% " height="146px ">
                    <div class="font-weight-bold pl-1" style="font-size: 18px; ">${a.name}
                    
                    </div>
                    <span class="pl-2 bagde badge-pill badge-primary text-white font-weight-bold text-center" style="font-size:12px;">${a.majorid.name }</span>
                    <div class="font-sm font-weight-bold text-info pl-1">by <span>${a.instruid.firstname} ${a.instruid.lastname }</span></div>
                    <p style="height: 60px;padding: 5px;text-overflow: ellipsis;overflow: hidden;white-space: pre-line; ">${a.des }</p>
                    </div>
                    <hr/>
                    <div class="d-flex align-items-center ">
                    	
                    	<!--  If you are learner you have to buy this course -->
                    	<c:if test="${a.instruid.id != sessionScope.user.id}">
                    	<div class="col-8 d-none comming">Comming soon </div>
                        <button class="col-8 btn bg-danger text-white font-weight-bold addcart " id="${a.id}" ncurr="${a.curriculum.size()}" ntest="${a.test.size() }">Add to cart</button>
                        <div class="price font-weight-bold text-success text-right w-50 ">$${a.price }</div>
                    	</c:if>
                    	<c:if test="${a.instruid.id == sessionScope.user.id}">
                    		<a  href="coursepage.htm?id=${a.id}" class="col-8 btn bg-success text-white font-weight-bold" >Manage</a>
                    		<div class="price font-weight-bold text-success text-right w-50 ">$${a.price }</div>
                    	</c:if>
                    	
                    </div>
                </div>
                </c:forEach>
				</c:if>


            </div>
            <!-- ForEach right here ))-->
        </div>

        <hr>

        <!-- ( _ Intro bellow banner -->
        <div class="container-fuild py-3 d-flex justify-content-center align-content-center ">
            <div class="col-4 d-flex justify-content-center ">
                <div class="col-2 ">
                    <img src="${link}/img/monitor.png " width="100% " alt="tivi ">
                </div>
                <div class="col-9 ">
                    <div class="font-weight-bold "> 100,000 online courses</div>
                    <div class="text-dark "> Enjoy a variety of fresh topics </div>
                </div>
            </div>
            <div class="col-4 d-flex justify-content-center align-content-center ">
                <div class="col-2 ">
                    <img src="${link}/img/award.png " width="100% " alt="achieve ">
                </div>
                <div class="col-9 ">
                    <div class="font-weight-bold "> Expert instruction</div>
                    <div class="text-dark "> Find the right instructor for you </div>
                </div>
            </div>
            <div class="col-4 d-flex justify-content-center align-content-center ">
                <div class="col-2 ">
                    <img src="${link}/img/infinity.png " width="100% " alt="tivi ">
                </div>
                <div class="col-9 ">
                    <div class="font-weight-bold "> Expert instruction</div>
                    <div class="text-dark "> Find the right instructor for you </div>
                </div>
            </div>
        </div>
        <!-- Intro bellow banner _ ) -->

        <hr>

        </div>

    </main>


    <!-- Main_end)) -->

    <!-- Footer_start - Common theme at main.jsp -->
    <footer>
        <hr>
        <div class=" container-fluid d-flex ">
            <div class="col-6 d-flex ">
                <div class="col-4 ">
                    <ul>
                        <li><a href="# ">Udemy for Business</a></li>
                        <li><a href="# ">Teach on Udemy</a></li>
                        <li><a href="# ">Get the app</a></li>
                        <li><a href="# ">About us</a></li>
                    </ul>
                </div>
                <div class="col-4 ">
                    <ul>
                        <li><a href="# ">Careers</a></li>
                        <li><a href="# ">Blog</a></li>
                        <li><a href="# ">Help and Support</a></li>
                        <li><a href="# ">Affiliate</a></li>
                    </ul>
                </div>
                <div class="col-4 ">
                    <ul>
                        <li><a href="# ">Terms</a></li>
                        <li><a href="# ">Privacy policy and cookie policy</a></li>
                        <li><a href="# ">Sitemap</a></li>
                        <li><a href="# ">Featured courses</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-6 ">
                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Saepe, nihil harum eum ab vel iusto, suscipit quasi amet laudantium laborum, dolorum quia quisquam in. Amet commodi soluta eveniet autem ea.
            </div>
        </div>
        <div class="container-fluid p-5 d-flex align-items-center ">
            <div class="col-6 ">
                <img src="${link}/img/logo-coral.png " alt="Udemy " width="120px ">
            </div>
            <div class="col-6 lead text-right " style="font-size: 12px; ">
                @ 2020 Udemy, Inc
            </div>
        </div>


    </footer>
    <!-- Footer_end -->
    <script>
    	$('.gotocoursepage').on('click',function(){
//    		console.log($(this).attr('id'));
    		location.href="coursepage.htm?id="+$(this).attr('id');
    	})
    	var btn = [...$('.addcart')];
    	btn.map(each => {
    		if( $(each).attr('ncurr') == 0 || $(each).attr('ntest') == 0){
    			$(each).addClass('d-none');
    			$(each).prev().removeClass('d-none');
    		}
    		else if ($(each).attr('ncurr') != 0 && $(each).attr('ntest') != 0)
    			{$(each).prev().addClass('d-none');
    			$(each).removeClass('d-none');
    			}
    			
    	})
        function func() {
            swal('Opps', "We haven 't done it", "warning");
        }
    	// In Common nav
        $('.income-toggle ').on('click ', function() {
            $('.income ').toggleClass('d-none ');
            $('.cart ').addClass('d-none ')
            $('#user').addClass('d-none')
        })
        // In Common nav 
        $('.cart-toggle ').on('click ', function() {
                $('.cart ').toggleClass('d-none ');
                $('.income ').addClass('d-none ');
                $('#user').addClass('d-none');
            })
            // In Common cart
        var total = 0;
        [...$('.cart ul li .price')].map(each => {
            var price = parseFloat($(each).text().split("$")[1])
            total += price;
        })
        // In Common cart
        $('.cart h5 span ').text('$ ' + parseFloat(total).toFixed(2));
        // Add to cart in show lobby in Home
        $('.addcart ').on('click ', function() {
            var price = $(this).next().text().split('$')[1];
			var id = $(this).attr('id') ? $(this).attr('id') : 0;
            
            // AJAX
            	 $.ajax({
                type: "POST",
               	url: "addcoursetocart.htm",
                data: {
                	id: id,
                	price: price
                },
            	success: function(d) {
            		if(d == "true"){
                		async function sequence(){
                      		await swal('Success', "Add to cart successfully", "success");
                      		await location.reload(true);
                         	}
                         sequence();
                	}else if(d == "false"){
                		swal('Fail', "It's exsited !! You can check your cart ", "warning");
                		$('.cart').removeClass('d-none');
                	}else if(d == "need user"){
                		swal('Warning', "You might want to login !", "warning");
                	}else if(d == "history"){
                		swal('Fail', " You have bought !! You can check your Followed Course ", "warning");
                		 $('.more').removeClass('d-none');
                	}
            		
                	
					
               }
             });						
           
        })
        // In Common Nav 
        $('.money').text("$ "+
        	parseFloat($('.money').text().split('$ ')[1]).toFixed(2)		
        )
        // In Common Nav
        $('.more-toggle').on('click', function() {
            $('.more').toggleClass('d-none');
            $('.cart ').addClass('d-none ');
            $('.income ').addClass('d-none ');
        })
        // In Common Nav
        $('.information-toggle').on('click', function() {
            $('.information').toggleClass('d-none');
            $('.history').addClass('d-none');
            $('.courset').addClass('d-none');
        })
        // In Common Nav
        $('.history-toggle').on('click', function() {
            $('.information').addClass('d-none');
            $('.history').toggleClass('d-none');
            $('.courset').addClass('d-none');
        })
        // In Common Nav
        $('.course-toggle').on('click', function() {
            $('.information').addClass('d-none');
            $('.history').addClass('d-none');
            $('.courset').toggleClass('d-none');
        })
        // In Common Nav
        $('.edit-toggle').on('click', function() {
            $('.edit').removeClass('d-none');
            $('.noedit').addClass('d-none');
        })
        // In Common Nav
        $('#cancel').on('click', function() {
            $('.edit').addClass('d-none');
            $('.noedit').removeClass('d-none');
        })
        // In Common Nav
        var children = $('.infor-items input');
        console.log();
        var oldname = $(children[0]).val();
        var oldemail = $(children[1]).val();
        var oldbirthday = $(children[2]).val();
        var oldgender = $('.infor-items input[name="gender"]').val();
     // In Common Nav
        $('#ok').parent().parent('form').on('submit', function(e) {
            e.preventDefault();
            var name = $(children[0]);
            var email = $(children[1]);
            var birthday = $(children[2]);
            var gender = $('.infor-items input[name="gender"]');
            var invaild = [];
            var change = 0;

            if (name.val() != oldname)
                change += 1;
            if (email.val() != oldemail)
                change += 1;
            if (birthday.val() != oldbirthday)
                change += 1;
            if (gender.val() != oldgender)
                change += 1;
            console.log(change);
            if (change == 0) {
                swal('All right', "We don't change anything", "success")
            } else {
               	
                  //   AJAX 
                     $.ajax({
                         type: "POST",
                         url: "updateyourinformation.htm",
                         data: {
                        	 id : $('#ok').attr('userid'),
                        	 name: name.val(),
                    		email: email.val(),
                    		birthday: birthday.val(),
                    		gender: gender.val()
                         },
                         success: function (response) {
                        	if(response == "true"){
                        		async function sequence(){
                              		await swal('Success', "We have updated your information", "success");
                              		await location.reload(true);
                                 	}
                                 sequence();
                        	}else if(response == "false"){
                        		swal('Fail', "We can't update your information due to error", "error");
                        	}
                     }
                 });
            }
        })
        // Major Select in Home
        $('.major').removeClass('active');
        $('li.major#'+$(".thisactive").text()).addClass('active');
        var total = 0;
        var push = [...$('.history.show .font-italic').children('.total')];
        push.map(each => {
            var t = 0;
            var id = $(each).attr('id');
            var arr = [...$('.price' + id)].map(e => {
                console.log($(e).text().split('$')[1]);
                t += parseFloat($(e).text().split('$')[1])
            });
            $(each).text('$' + t);
        })
        $('.major').on('click',function(){
        	location.href="majoridCourse.htm?id="+$(this).attr('id');
        })
        // In Common nav
         $('.searchcoursename-toggle').on('change keyup', function(e) {
            if (e.target.value != "") {
                $('.searchcoursename').removeClass('d-none');
                if(e.keyCode == 13)
                // AJAX
                $.ajax({
                    type: "POST",
                    url: "selectcoursewithname.htm",
                     data: {
                    	name: e.target.value
                     },
                    success: function (d) {
                    	var target = $('.searchcoursename ul');
                    	target.text('');
                    	if(d!=""){
                    	var data = d.split(',');
                    	
                    		data.map(each =>{
                    			
                    			if(each != "")
                    			{	
                    				var id = each.split('-')[0];
                    				var data = each.split('-')[1];
                    				target.append('<a href="coursepage.htm?id='+id+'" class="d-block mb-2 text-dark whitesmoke px-1 py-2" style="letter-spacing: 0.5px;" id="'+id+'"><span><i class="fa fa-search"></i></span> '+data+'</a>');
                    			}
                    			})
             			}
                    	else{
                    		target.append('<p class="text-center">Sorry we don\'t found any course with that name!! </p>');
                    	}
                    }
            });
        } else
            $('.searchcoursename').addClass('d-none')
        })
    </script>
</body>

</html>