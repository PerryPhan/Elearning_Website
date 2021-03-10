<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Udemy Course Control</title>
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
        </a>       <div class="col-6 d-flex justify-content-end align-items-center">
            Welcome back, <span class="mx-2 text-info font-weight-bold">Dai</span>
        </div>
    </nav>
    <div class="d-flex container-fluid h-100">
        <aside class="col-3 p-0 h-100 bg-white">
            <ul>
                <li class="list-group">
                    <a href="user.htm" class=" lg">User</a>
                </li>
                <li class="list-group">
                    <a href="#" class=" lg">Product</a>
                </li>
                <li class="list-group">
                    <a href="" class="lg">Result</a>
                </li>
            </ul>
        </aside>
        <main class="col-8 ml-5 bg-white pt-2" id="table">
            <div class="d-flex align-items-center">
                <h2 class="p-0">Chuyên ngành
                </h2>
                <button class="btn bg-success text-white font-weight-bold p-2 mx-2 spec" name="add"><i class="fa fa-plus"></i></button>
                <button class="btn bg-primary text-white font-weight-bold p-2 mx-2 spec" name="edit"><i class="fa fa-cog"></i></button>
                <button class="btn bg-danger text-white font-weight-bold p-2 mx-2 spec" name="del"><i class="fa fa-minus"></i></button>
            </div>
            <c:if test="${list_major == null}">Sorry Major table is empty</c:if>
            <c:if test="${list_major != null}">
            <ul class="p-2 my-2 row justify-content-center" id="cn">
                <c:forEach items="${ list_major }" var="m">
                <li class=" col-5 font-weight-bold position-relative badge-pill badge-primary m-2 mx-3 p-2 lg cn" id="${m.id}">${m.name}
                    <div class="smallicon edit d-none" id="${m.id}"><i class="fa fa-pencil"></i></div>
                    <div class="smallicon exit d-none" id="${m.id}" >X</div>
                </li>
				</c:forEach>
            </ul>
            </c:if>
            <h2 class=""> <span>Khóa học</span>
                <span>
                <a class="btn bg-success text-white font-weight-bold p-2 mx-2 cour" name="add" href="courseAddform.htm"><i class="fa fa-plus"></i></a>
                <button class="btn bg-primary text-white font-weight-bold p-2 mx-2 cour" name="edit"><i class="fa fa-cog"></i></button>
               
            </span>
            </h2>
            <h4 class="pl-2">Số lượng: <span>5</span></h4>
            <!-- <p>Cái nào của admin thì mới được func</p> -->
            <div class="database product pt-0 mt-0">
            <c:if test="${list_course == null}">Sorry Course table is empty</c:if>
            <c:if test="${list_course != null}">
                <table class="table bg-light table-white position-relative table-striped">
                    <thead class="thead-dark " style="top: 0;left:0;">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">NameofMajor</th>
                            <th scope="col">Instructor</th>
                            <th scope="col">Price</th>
                            <th scope="col">Description</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list_course}" var="c">
                        <tr>
                            <th scope="row">${c.id}</th>
                            <td>${c.name}</td>
                            <td>${c.majorid.name}</td>
                            <td>${c.instruid.firstname} ${c.instruid.lastname}</td>
                            <td>${c.price }</td>
                            <td>${c.des }
                            </td>
                            <td class="courfunc">
                                <a class="btn bg-success p-1 font-weight-bold text-white more" href="curriculum.htm?id=${c.id}">More</a>
                                <a class="d-none btn bg-primary p-1 font-weight-bold text-white editc " href="courseUpdform.htm?id=${c.id}">Edit</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                </c:if>
            </div>
        </main>


        <script src="${link}/js/bootstrap.js"></script>
        <script src="${link}/js/sweetalert.min.js"></script>
        <script src="${link}/js/jquery.js"></script>
        <script src="${link}/js/SpecialistControlJQuery.js"></script>   
        <script>
            $('.cancel').on('click', function() {
                $(this).parent().parent().parent().children().get(0).addClass('d-none');
            })
            $('tr').on('click', function() {
                console.log("a");
            })
            var edit = true;

            $('.cour').on('click', function() {

                var type = $(this).attr('name');
                if (type == "add") {

                }

                if (type == "edit") {
                    if (edit) {
                        $('.courfunc').children().addClass('d-none');
                        $('.courfunc').children('.editc').removeClass('d-none');
                        edit = !edit;
                    } else {
                        $('.courfunc').children('.more').removeClass('d-none');
                        $('.courfunc').children('.editc').addClass('d-none');
                        edit = !edit;
                    }

                }
            })
        </script>

</body>

</html>