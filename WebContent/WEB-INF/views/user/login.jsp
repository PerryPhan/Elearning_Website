<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${link}/css/bootstrap.css">
    <link rel="stylesheet" href="${link}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${link}/css/login.css">
    <link rel="icon" type="image/png" href="images/favicon.ico" />
<link rel="icon" type="image/png" href="${link}/img/logo-coral.png">
    <title>Udemy Login</title>
    
    <script src="${link}/js/bootstrap.js"></script>
    <script src="${link}/js/jquery.js"></script>
    <script src="${link}/js/sweetalert.min.js"></script>
</head>

<body>

    <div class="position-absolute main" style="top: 50%;left:50%;transform:translate(-50%,-50%);">
        <div class="container-fluid d-flex bg-white p-0" style="width: 700px;height: 500px;">
            <div class="col-5 m-0 p-0">
                <!-- <img src="${link}/img/ISlogo.png" alt="" width="100%" height="" class="position-absolute" style="top:10px; left:0px; z-index: 1; opacity: .;"> -->
                <img src="${link}/img/full-img-col-6.jfif" alt="full-img" width="100%" height="100%" style="filter: brightness(.8);">
            </div>
            <div class="col-7 d-flex justify-content-center align-items-center">

                <!---================================================  Login -================================================ -->
                <div class="w-75 form-box " id="login">
                <a href="home.htm" class="position-absolute m-3 backtohome" style="top: 0; left:0;">
                        <img src="${link }/img/Arrow 1.png" alt="back" width="20px"> Back to Homepage</a>
                    <h3 class="active text-center my-3 mb-5">Member Login</h3>
                    <form action="" class="active form-container p-0 m-0" id="loginform">
                        <div class="form-control border-0">
                            <input type="email" name="email" placeholder="Email">

                            <label for="" class="icon">	<i class="fa fa-envelope" aria-hidden="true"></i></label>

                        </div>
                        <div class="err"></div>
                        <div class="form-control border-0">
                            <input type="password" name="password" placeholder="Password" >

                            <label for="" class="icon">	<i class="fa fa-lock" aria-hidden="true"></i></label>

                        </div>
                        <div class="err"></div>
                        <div class="form-control border-0">
                            <button type="submit" class="btn my-3 bg-success font-weight-bold text-white">Login</button>
                        </div>
                    </form>
                    <a href="#" class="forget-password">Forget Password</a>
                    <a href="#" class="position-absolute signup" style="bottom: -20px; left: 50%;transform: translateX(-50%);">Create your account -></a>
                </div>
                <!---================================================  Login -================================================  -->
				
                <!---================================================  Signup -================================================ -->
                <div class="w-75 h-100 form-box d-none mt-5 " id="signup">
                    <a href="" class="position-absolute m-3 back" style="top: 0; left:0;">
                        <img src="${link }/img/Arrow 1.png" alt="back" width="20px"> Back to Login</a>
                    <h3 class="active text-center mb-3 mt-3">Member Signup</h3>
                    <form action="" class="active form-container p-0 my-3" id="signupform">
                        <div class="form-control d-flex border-0 mb-1">
                            <input type="text" class="col-8" name="firstname" placeholder="Firstname">
                            <label for="" class="icon">	<i class="fa fa-user"></i></label>
                            <input type="text" class="pl-3" name="lastname" placeholder="Lastname">
                            <label for="" class="icon">	</label>
                        </div>
                        <div class="err"></div>
                        <div class="align-items-center justify-content-end p-0 m-0 border-0 d-flex">
                            <input type="radio" name="gender" class="m-0 p-0 w-sm" value="true" checked>Male
                            <input type="radio" name="gender" class="m-0 p-0 w-sm" value="false">Female
                        </div>
                        
                        <div class="form-control border-0 mt-0">
                            <input type="date" name="birthday" value="1999-08-30">
                            <label for="" class="icon">	<i class="fa fa-birthday-cake"></i></label>
                        </div>
                        <div class="form-control border-0">
                            <input type="email" name="email" placeholder="Email">
                            <label for="" class="icon">	<i class="fa fa-envelope" aria-hidden="true"></i></label>
                        </div>
                        <div class="err"></div>
                        <div class="form-control border-0">
                            <input type="password" name="password" placeholder="Password">
                            <label for="" class="icon">	<i class="fa fa-lock" aria-hidden="true"></i></label>
                        </div>
                        <div class="err"></div>
                        <div class="form-control border-0">
                            <input type="password" name="repassword" placeholder="Repassword">
                            <label for="" class="icon">	<i class="fa fa-lock" aria-hidden="true"></i></label>
                        </div>
                        <div class="err"></div>
                        <div class="form-control border-0">
                            <button type="submit" class="btn my-3 bg-success font-weight-bold text-white">Sign up</button>
                        </div>
                    </form>
                    <!-- <a href="#" class="">Forget Password</a> -->
                    <a href="#" class="position-absolute signup" style="bottom: -20px; left: 50%;transform: translateX(-50%);">Create your account -></a>
                </div>
                <!---================================================  Signup -================================================  -->

                <!--================================================ Forget Password=================================================================== -->
                <div class="w-75 form-box d-none" id="forget-password">
                    <a href="" class="position-absolute m-3 back" style="top: 0; left:0;">
                        <img src="${link}/img/Arrow 1.png" alt="back" width="20px"> Back to Login</a>

                    <h3 class="text-center active my-3 mb-5">Forget Password</h3>
                    <form action="" class="active form-container p-0 m-0" id="getcodeform">
                        <div class="form-control border-0">
                            <input type="email" name="email" placeholder="Email">
                            <label for="" class="icon">	<i class="fa fa-envelope" aria-hidden="true"></i></label>
                        </div>
                        <div class="err"></div>
                        <div class="form-control border-0">
                            <button type="submit" class="btn my-3 bg-success font-weight-bold text-white">SEND</button>
                        </div>
                    </form>
                    <form action="" class="d-none active form-container p-0 m-0" id="confirmform">
                        <div class="form-control border-0">
                            <input type="number" name="code" placeholder="Code">
                            <label for="" class="icon">	<i class="fa fa-cog"></i></label>
                        </div>
                        <div class="err"></div>
                        <div class="form-control border-0">
                            <input type="password" name="password" placeholder="Password">
                            <label for="" class="icon">	<i class="fa fa-lock" aria-hidden="true"></i></label>
                        </div>
                        <div class="err"></div>
                        <div class="form-control border-0">
                            <input type="password" name="repassword" placeholder="Repassword">
                            <label for="" class="icon">	<i class="fa fa-lock" aria-hidden="true"></i></label>
                        </div>
                        <div class="err"></div>
                        <div class="form-control border-0">
                            <button type="submit" class="btn my-3 bg-danger font-weight-bold text-white">Confirm</button>
                        </div>
                    </form>
                    <a href="#" class="position-absolute signup" style="bottom: -20px; left: 50%;transform: translateX(-50%);">Create your account -></a>
                </div>

                <!---================================================  Forget Password -================================================ -->

            </div>
        </div>
    </div>
    <script>
        // Switch mode Controller ==================================================================================
       
            // Back button => Login 
        $('.back').on('click', function() {
                $(this).parent().addClass('d-none');
                $('#login').removeClass('d-none');
            })
            // Forget-Password button => Forget Password 
        $('.forget-password').on('click', function() {
                $(this).parent().addClass('d-none');
                $('#forget-password').removeClass('d-none');
            })
            // Signup button => Forget Password
        $('.signup').on('click', function() {
            $(this).parent().addClass('d-none');
            $('#signup').removeClass('d-none');
        })
		// Init =================================================================================================
			$('input:not(input[type="radio"])').val('');
        	$('input[ name="birthday"]').val("1999-08-30");
             $('.err').text('');
             $('.invald').removeClass('invald');
             // For all
             $('input').on('change', function() {
                 $(this).removeClass('invaild')
                 $(this).parent().next('.err').text('');
             })
        // Submit Controller ==================================================================================
        // Login 
        $('#loginform').on('submit', function(e) {
                e.preventDefault();
                // Get Variable
                var email = $('#loginform input[type="email"]');
                var pass = $('#loginform input[type="password"]');
                // Validate
                if (email.val() == "") {
                    email.parent().next().text("Please fill in Email");
                    email.addClass('invaild');
                }
                if (pass.val() == "") {
                    pass.parent().next().text("Please fill in Password");
                    pass.addClass('invaild');
                }else if(pass.val().length < 8){
                	pass.parent().next().text("The length of password at least 8 characters");
                    pass.addClass('invaild');
                }
                // AJAX
                if (email.val() != "" && pass.val() != "" && pass.val().length >= 8) {
                    $.ajax({
                        type: 'POST',
                        url: 'login.htm',
                        data: {
                            email: email.val(),
                            password: pass.val()
                        },
                        success: function(d) {
                        	if(d == "")
                        		swal('Oops', 'This is unavailable email you can sign up with this email', 'warning');
                        	else if(d=="false"){
                        		swal('Oops', 'Wrong password', 'error');
                        	}else if(d != ""){
                        		async function sequence(){
                        			await swal('Welcome', 'Nice to see u '+d, 'success');
                            		location.href="home.htm";
                                 	}
                                 sequence();
                        		
                        	}
                        	
                        },
                        error: function(e) {
                            swal('Oops', 'This is unavailable email you can sign up with this email', 'warning');
                        }
                    })
                }

            })
            function check(what){
        	 if (what.val() == "") {
                 what.parent().next().text("Please fill in "+what.attr('name'));
                 what.addClass('invaild');
                 return false;
             }else
            	 return true;
        	}
        	function checkregex(what, regex){
        		 if (!what.val().match(regex)) {
                     what.parent().next().text("Wrong data type");
                     what.addClass('invaild');
                     return false;
                 }else
                	 return true;
        	}
              // Signup
            $('#signupform').on('submit', function(e) {
                    e.preventDefault();
                    // Get Variable
                    var firstname = $('#signupform input[name="firstname"]');
                    
                    var lastname = $('#signupform input[name="lastname"]');
                    var birthday = $('#signupform input[name="birthday"]');
                    var gender = $('#signupform input[name="gender"]')
                    var email = $('#signupform input[name="email"]');
                    var pass = $('#signupform input[name="password"]');
                    var repass = $('#signupform input[name="repassword"]');
                    var utf8="^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ" +
    	            "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ" +
    	            "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$";
                    if(check(firstname) && checkregex(firstname,utf8))
                    	if(check(lastname) && checkregex(lastname,utf8))
                    		if(check(email))
                    			if(check(pass))
                    				if(pass.val().length >=8)
                    				{
	                    				if(check(repass))
		                    					if(pass.val() == repass.val())
		                    						{
		                    						 $('.err').text('');
		                    						 $('.invaild').removeClass('invaild');
		                    						// AJAX
		                    							 $.ajax({
									                        type: 'POST',
									                        url: 'register.htm',
									                        data: {
									                          firstname: firstname.val(),
									                          lastname: lastname.val(),
									                          email: email.val(),
									                          password: pass.val(),
									                          birthday: birthday.val(),
		                    							 	  gender : gender.val(),
									                        },
									                        success: function(d) {
									                        	if(d!="")
									                            swal('Congratulation', "Create new user successfully", "success");
									                        	else
									                        		swal("Sorry","This Email have been taken","error");
									                        },
									                        error: function(e) {
									                            swal('Oops', 'Something happen with database', 'warning');
									                        }
									                    })
		                    						}
		                    					else{
		                    						 pass.parent().next().text("Password and Repassword must be the same");
		                    		                 pass.addClass('invaild');
		                    		                 repass.parent().next().text("Password and Repassword must be the same");
		                    		                 repass.addClass('invaild');
		                    		                
		                    		             }
                    				}else{
                    					$('input').on('change', function() {
                		                     $(this).removeClass('invaild')
                		                     $(this).parent().next('.err').text('');
                   					pass.parent().next().text("Password at least 8 characters");
              		                pass.addClass('invaild');
              		              	
         		                 })
                   				}
                    
            })
            var codewesent = "";
            var id = 0;
             // Forgot Password
        $('#getcodeform').on('submit', function(e) {
            e.preventDefault();
            // Get Variable
            var email = $('#getcodeform input[type="email"]');
            // Validate
            if (email.val() == "") {
                email.parent().next().text("Please fill in Email");
                email.addClass('invaild');
            } else {
                // AJAX
                $.ajax({
                        type: 'POST',
                        url: 'changepw.htm',
                        data: {
                            email: email.val()
                        },
                        success: function(d) {
                        	if(d.split(',')[0].match("\\d+")){
	                            swal('All right', "We have send some code to your email", "success")
	                            $('#getcodeform').addClass('d-none');
	                            $('#confirmform').removeClass('d-none');
	                            id = parseInt(d.split(',')[1]);
	                            codewesent = d.split(',')[0];
                        	}else if(d == "false"){
                        		 swal('Oops', "Seem like don't have this email in database", "error")
                        	}
                        },
                        error: function(e) {
                            swal('Oops', 'Something went wrong', 'error')
                        }
                    })
                   
            }
        })
        $('#confirmform').on('submit', function(e) {
                e.preventDefault();
                // Get Variable
                var codesent = codewesent; 
               // console.log(codesent);
               // console.log(id);
                var code = $('#confirmform input[name="code"]');
                var pass = $('#confirmform input[name="password"]');
                var repass = $('#confirmform input[name="repassword"]');
                // Validate
                if(check(code))
                	if(check(pass))
                		if(pass.val().length < 8)
                			{
                			pass.parent().next().text("Password must have at least 8 characters");
   		                	 pass.addClass('invaild');
   		                
                			}else	
                			if(check(repass))
                				if(repass.val().length < 8)
                    			{
                					repass.parent().next().text("Password must have at least 8 characters");
          		                	repass.addClass('invaild');
                    			}else
                    				if(pass.val() == repass.val()){
                    					$('.invaild').removeClass('invaild');
                    					$('.err').text('');
                    					$.ajax({
                                            type: 'POST',
                                            url: 'confirmpw.htm',
                                            data: {
                                            	id: id,
                                                pass: pass.val()
                                            },
                                            success: function(d) {
                                                swal('All right', "Your password have been changed successfully", "success");
                                                $('input:not(input[type="radio"])').val('');
                                            },
                                            error: function(e) {
                                                swal('Oops', 'Something went wrong', 'error')
                                            }
                                        })
                    				}
                    				else
                    					{
                    					 pass.parent().next().text("Password and Repassword must be the same");
                		                 pass.addClass('invaild');
                		                 repass.parent().next().text("Password and Repassword must be the same");
                		                 repass.addClass('invaild');
                		                 $('input').on('change', function() {
                		                     $(this).removeClass('invaild')
                		                     $(this).parent().next('.err').text('');
                    					})
                    					}
                
              	
        })
               
         
    </script>
</body>

</html>